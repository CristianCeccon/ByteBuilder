import 'package:bytebuilder/data/email_dto.dart';
import 'package:bytebuilder/entity/processador.dart';

abstract class ProcessadorRepository {
  Future<bool> salvar(Processador processador);
}
