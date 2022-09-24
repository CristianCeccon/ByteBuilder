import 'package:bytebuilder/data/pc_dto.dart';
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
  }) : super(
          marca: marca,
          preco: preco,
          nome: nome,
        );

  Memoria.criar(PcDTO pcDTO) : super(preco: pcDTO.memoria.preco, nome: pcDTO.memoria.nome, marca: pcDTO.memoria.marca) {
    pcDTO.validarBase();

    int tamanho = pcDTO.memoria.tamanho;
    int velocidade = pcDTO.memoria.velocidade;

    if (tamanho <= 0 || tamanho > 1000) throw ValorInvalido("O tamanho da memória é inválido");
    if (velocidade <= 0 || velocidade > 1000) throw ValorInvalido("A velocidade da memória é inválida");

    this.tamanho = tamanho;
    this.velocidade = velocidade;
    nome = pcDTO.memoria.nome;
    preco = pcDTO.memoria.preco;
    marca = pcDTO.memoria.marca;
  }
}
