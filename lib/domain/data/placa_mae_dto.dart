import 'package:bytebuilder/domain/entity/base.dart';

class PlacaMaeDTO extends Base{
  late String socket;
  late int ddr;

  PlacaMaeDTO({
    required this.ddr,
    required this.socket,
    required marca,
    required preco,
    required nome,
    id,
  }) : super(marca: marca, preco: preco, nome: nome, id: id);
}