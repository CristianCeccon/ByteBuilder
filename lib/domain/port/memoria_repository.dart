import 'package:bytebuilder/domain/entity/memoria.dart';

abstract class MemoriaRepository {
  Future<bool> salvar(Memoria memoria);
}
