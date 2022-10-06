import 'package:bytebuilder/domain/data/placa_mae_dto.dart';

abstract class PlacaMaeRepository {
  Future<bool> salvar(PlacaMaeDTO placaMae);
  Future<List<PlacaMaeDTO>> listar();
}
