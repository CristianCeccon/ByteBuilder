import 'package:bytebuilder/data/email_dto.dart';
import 'package:bytebuilder/entity/memoria.dart';

abstract class MemoriaRepository{
  Future<bool> salvar(Memoria memoria);
}
