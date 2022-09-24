import 'package:bytebuilder/data/pc_dto.dart';
import 'package:bytebuilder/entity/base.dart';
import 'package:bytebuilder/exception/valor_inavlido.dart';

class Processador extends Base {
  late int nucleo;
  late double frequencia;
  late String socket;

  Processador({
    required this.nucleo,
    required this.frequencia,
    required this.socket,
    required marca,
    required preco,
    required nome,
  }) : super(marca: marca, preco: preco, nome: nome);

  Processador.criar(PcDTO pcDTO) : super(preco: pcDTO.processador.preco, nome: pcDTO.processador.nome, marca: pcDTO.processador.marca) {
    pcDTO.validarBase();

    int nucleo = pcDTO.processador.nucleo;
    double frequencia = pcDTO.processador.frequencia;
    // String socket = pcDTO.processador.socket;

    if (frequencia <= 0 || frequencia > 1000) throw ValorInvalido("A frequência do processador é inválido");
    if (nucleo <= 0 || nucleo > 1000) throw ValorInvalido("A quantidade de núcleos é inválida");

    this.frequencia = frequencia;
    this.nucleo = nucleo;
    nome = pcDTO.processador.nome;
    preco = pcDTO.processador.preco;
    marca = pcDTO.processador.marca;
  }
}
