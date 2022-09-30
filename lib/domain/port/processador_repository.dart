import 'package:bytebuilder/domain/entity/processador.dart';

abstract class ProcessadorRepository {
  Future<bool> salvar(Processador processador);
}
