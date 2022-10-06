import 'package:bytebuilder/domain/entity/base.dart';

class ProcessadorDTO extends Base {
  late int nucleo;
  late double frequencia;
  late String socket;

  ProcessadorDTO({
    required this.nucleo,
    required this.frequencia,
    required this.socket,
    required marca,
    required preco,
    required nome,
  }) : super(marca: marca, preco: preco, nome: nome);
}