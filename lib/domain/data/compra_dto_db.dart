import 'package:bytebuilder/domain/data/placa_mae_dto.dart';
import 'package:bytebuilder/domain/data/processador_dto.dart';

class CompraDTODatabase {
  late PlacaMaeDTO placaMae;
  late ProcessadorDTO processador;

  late double precoTotal;

  CompraDTODatabase({required this.placaMae, required this.processador, required this.precoTotal});
}
