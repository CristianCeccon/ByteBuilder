import 'package:bytebuilder/domain/entity/memoria.dart';
import 'package:bytebuilder/domain/entity/placa_mae.dart';
import 'package:bytebuilder/domain/entity/processador.dart';

class CompraDTO {
  late PlacaMae placaMae;
  late Processador processador;
  late Memoria memoria;

  CompraDTO({required this.placaMae, required this.memoria, required this.processador});
}
