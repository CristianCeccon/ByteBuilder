import 'package:bytebuilder/domain/entity/compra.dart';

abstract class CompraRepository {
  Future<bool> salvar(Compra compra);
}
