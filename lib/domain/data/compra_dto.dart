import 'package:bytebuilder/domain/data/placa_mae_dto.dart';
import 'package:bytebuilder/domain/data/processador_dto.dart';

class CompraDTO {
  late PlacaMaeDTO placaMae;
  late ProcessadorDTO processador;

  CompraDTO({required this.placaMae, required this.processador});
}
