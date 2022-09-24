import 'package:bytebuilder/entidades/base.dart';

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
}
