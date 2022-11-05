import 'package:bytebuilder/domain/data/processador_dto.dart';

abstract class ProcessadorRepository {
  Future<ProcessadorDTO> salvar(ProcessadorDTO processador);

  Future<List<ProcessadorDTO>> listar();
}
