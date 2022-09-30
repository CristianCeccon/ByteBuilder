import 'package:bytebuilder/domain/entity/placa_mae.dart';

abstract class PlacaMaeRepository {
  Future<bool> salvar(PlacaMae placaMae);
}
