import 'package:bytebuilder/domain/entity/base.dart';
import 'package:bytebuilder/domain/exception/conteudo_invalido.dart';
import 'package:bytebuilder/domain/exception/valor_inavlido.dart';

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

  Processador.criar(Processador processador) : super(preco: processador.preco, nome: processador.nome, marca: processador.marca) {
    processador.validarBase();

    int nucleo = processador.nucleo;
    double frequencia = processador.frequencia;
    String socket = processador.socket;

    if (frequencia <= 0 || frequencia > 1000) throw ValorInvalido("A frequência do processador é inválido");
    if (nucleo <= 0 || nucleo > 1000) throw ValorInvalido("A quantidade de núcleos é inválida");
    if (socket.isEmpty) throw ConteudoInvalido("O modelo do socket não pode ser vazio");

    this.frequencia = frequencia;
    this.nucleo = nucleo;
    this.socket = socket;
    nome = processador.nome;
    preco = processador.preco;
    marca = processador.marca;
  }
}
