import 'package:bytebuilder/entity/base.dart';
import 'package:bytebuilder/entity/memoria.dart';
import 'package:bytebuilder/entity/placa_mae.dart';
import 'package:bytebuilder/entity/processador.dart';

class PcDTO extends Base {
  late PlacaMae placaMae;
  late Processador processador;
  late Memoria memoria;

  PcDTO({required this.placaMae, required this.memoria, required this.processador, required preco, required marca, required nome}) : super(marca: marca, preco: preco, nome: nome);
}
