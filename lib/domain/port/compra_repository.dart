import 'package:bytebuilder/domain/data/compra_dto_db.dart';

abstract class CompraRepository {
  Future<bool> salvar(CompraDTODatabase compra);
}
