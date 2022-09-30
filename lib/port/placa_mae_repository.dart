import 'package:bytebuilder/data/email_dto.dart';
import 'package:bytebuilder/entity/placa_mae.dart';

abstract class PlacaMaeRepository {
  Future<bool> salvar(PlacaMae placaMae);
}
