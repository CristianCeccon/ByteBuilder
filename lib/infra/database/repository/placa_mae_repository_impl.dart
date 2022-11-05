import 'package:bytebuilder/domain/data/placa_mae_dto.dart';
import 'package:bytebuilder/domain/port/placa_mae_repository.dart';
import 'package:bytebuilder/infra/database/connection.dart';

class PlacaMaeRepositoryImpl implements PlacaMaeRepository {
  @override
  Future<PlacaMaeDTO> salvar(PlacaMaeDTO placaMae) async {
    var db = await Connection.db;

    var sql = "INSERT INTO PLACA_MAE(nome, marca, preco, ddr, socket) VALUES(?, ?, ?, ?, ?)";

    var res = await db.rawInsert(sql, [placaMae.nome, placaMae.marca, placaMae.preco, placaMae.ddr, placaMae.socket]);
    placaMae.id = res;
    if (res != null) {
      return placaMae;
    } else {
      return placaMae;
    }
  }

  PlacaMaeDTO _toDTO(Map<String, dynamic> item) {
    var plac = PlacaMaeDTO(
      nome: item["nome"],
      marca: item["marca"],
      preco: item["preco"],
      ddr: item["ddr"],
      socket: item["socket"],
    );
    plac.id = item["id"];
    return plac;
  }

  @override
  Future<List<PlacaMaeDTO>> listar() async {
    var db = await Connection.db;

    List<Map<String, dynamic>> resultado = await db.query('PLACA_MAE');

    return resultado.map((item) => _toDTO(item)).toList();
  }
}
