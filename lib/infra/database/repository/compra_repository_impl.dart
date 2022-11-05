import 'package:bytebuilder/domain/data/compra_dto_db.dart';
import 'package:bytebuilder/domain/port/compra_repository.dart';
import 'package:bytebuilder/infra/database/connection.dart';

class CompraRepositoryImpl implements CompraRepository {
  @override
  Future<bool> salvar(CompraDTODatabase compra) async {
    var db = await Connection.db;

    var sql =
        "INSERT INTO COMPRA(placa_mae, processador, preco_total) VALUES(?, ?, ?)";

    var res = await db.rawInsert(sql, [
      compra.placaMae.id,
      compra.processador.id,
      compra.precoTotal,
    ]);
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }
}