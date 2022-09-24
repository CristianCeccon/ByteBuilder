import 'package:bytebuilder/entity/base.dart';

class PlacaMae extends Base {
  late String socket;
  late int ddr;

  PlacaMae({
    required this.ddr,
    required this.socket,
    required marca,
    required preco,
    required nome,
  }) : super(marca: marca, preco: preco, nome: nome);
}
