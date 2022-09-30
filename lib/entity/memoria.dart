import 'package:bytebuilder/data/compra_dto.dart';
import 'package:bytebuilder/entity/base.dart';
import 'package:bytebuilder/exception/valor_inavlido.dart';

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

  Memoria.criar(CompraDTO compra): super(preco: compra.memoria.preco, nome: compra.memoria.nome, marca: compra.memoria.marca) {
    compra.memoria.validarBase();

    int tamanho = compra.memoria.tamanho;
    int velocidade = compra.memoria.velocidade;

    if (tamanho <= 0 || tamanho > 1000) throw ValorInvalido("O tamanho da memória é inválido");
    if (velocidade <= 0 || velocidade > 1000) throw ValorInvalido("A velocidade da memória é inválida");

    this.tamanho = tamanho;
    this.velocidade = velocidade;
    nome = compra.memoria.nome;
    preco = compra.memoria.preco;
    marca = compra.memoria.marca;
  }

  int get ddr{
    if (velocidade <= 400) return 1;
    else if (velocidade <= 1066) return 2;
    else if (velocidade <= 2133) return 3;
    else if (velocidade <= 5333) return 4;
    else return 5;
  }
}
