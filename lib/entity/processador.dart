import 'package:bytebuilder/data/compra_dto.dart';
import 'package:bytebuilder/entity/base.dart';
import 'package:bytebuilder/exception/conteudo_invalido.dart';
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

  Processador.criar(CompraDTO compra) : super(preco: compra.processador.preco, nome: compra.processador.nome, marca: compra.processador.marca) {
    compra.processador.validarBase();

    int nucleo = compra.processador.nucleo;
    double frequencia = compra.processador.frequencia;
    String socket = compra.processador.socket;

    if (frequencia <= 0 || frequencia > 1000) throw ValorInvalido("A frequência do processador é inválido");
    if (nucleo <= 0 || nucleo > 1000) throw ValorInvalido("A quantidade de núcleos é inválida");
    if (socket.isEmpty) throw ConteudoInvalido("O modelo do socket não pode ser vazio");

    this.frequencia = frequencia;
    this.nucleo = nucleo;
    this.socket = socket;
    nome = compra.processador.nome;
    preco = compra.processador.preco;
    marca = compra.processador.marca;
  }
}
