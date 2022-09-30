import 'package:bytebuilder/data/email_dto.dart';
import 'package:bytebuilder/entity/compra.dart';
import 'package:bytebuilder/entity/memoria.dart';

abstract class CompraRepository{
  Future<bool> salvar(Compra compra);
}
