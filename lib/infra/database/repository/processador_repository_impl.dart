import 'package:bytebuilder/domain/data/processador_dto.dart';
import 'package:bytebuilder/domain/port/processador_repository.dart';
import 'package:bytebuilder/infra/database/connection.dart';

class ProcessadorRepositoryImpl implements ProcessadorRepository {
  @override
  Future<ProcessadorDTO> salvar(ProcessadorDTO processador) async {
    var db = await Connection.db;

    var sql = "INSERT INTO PROCESSADOR(nome, marca, preco, nucleo, frequencia, socket) VALUES(?, ?, ?, ?, ?, ?)";

    var res = await db.rawInsert(sql, [processador.nome, processador.marca, processador.preco, processador.nucleo, processador.frequencia, processador.socket]);
    processador.id = res;
    if (res != null) {
      return processador;
    } else {
      return processador;
    }
  }

  ProcessadorDTO _toDTO(Map<String, dynamic> item) {
    var proc = ProcessadorDTO(
      nome: item["nome"],
      marca: item["marca"],
      preco: item["preco"],
      nucleo: item["nucleo"],
      frequencia: item["frequencia"],
      socket: item["socket"],
    );
    proc.id = item["id"];
    return proc;
  }

  @override
  Future<List<ProcessadorDTO>> listar() async {
    var db = await Connection.db;

    List<Map<String, dynamic>> resultado = await db.query('PROCESSADOR');

    return resultado.map((item) => _toDTO(item)).toList();
  }
}
