import 'package:bytebuilder/entidades/base.dart';

class Memoria extends Base {
  late int tamanho;
  late int velocidade;

  Memoria(
      {required this.tamanho,
      required this.velocidade,
      required marca,
      required preco,
      required nome})
      : super(marca: marca, preco: preco, nome: nome);
}
