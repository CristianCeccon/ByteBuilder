import 'package:bytebuilder/domain/entity/base.dart';
import 'package:bytebuilder/domain/exception/valor_inavlido.dart';

class Memoria extends Base {
  late int tamanho;
  late int velocidade;

  Memoria({
    required this.tamanho,
    required this.velocidade,
    required marca,
    required preco,
    required nome,
  }) : super(marca: marca, preco: preco, nome: nome);

  Memoria.criar(Memoria memoria) : super(preco: memoria.preco, nome: memoria.nome, marca: memoria.marca) {
    memoria.validarBase();

    int tamanho = memoria.tamanho;
    int velocidade = memoria.velocidade;

    if (tamanho <= 0 || tamanho > 1000) throw ValorInvalido("O tamanho da memória é inválido");
    if (velocidade <= 0 || velocidade > 1000) throw ValorInvalido("A velocidade da memória é inválida");

    this.tamanho = tamanho;
    this.velocidade = velocidade;
    nome = memoria.nome;
    preco = memoria.preco;
    marca = memoria.marca;
  }

  int get ddr {
    if (velocidade <= 400)
      return 1;
    else if (velocidade <= 1066)
      return 2;
    else if (velocidade <= 2133)
      return 3;
    else if (velocidade <= 5333)
      return 4;
    else
      return 5;
  }
}
