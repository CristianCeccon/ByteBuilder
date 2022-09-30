import 'package:bytebuilder/domain/exception/dominio_erro.dart';

class PrecoInvalido extends DominioErro {
  PrecoInvalido() : super('Preço de componente inválido');
}
