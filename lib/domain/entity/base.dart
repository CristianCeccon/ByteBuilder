import 'package:bytebuilder/domain/exception/conteudo_invalido.dart';
import 'package:bytebuilder/domain/exception/preco_invalido.dart';

class Base {
  int? id;
  late String nome;
  late String marca;
  late double preco;

  Base({required this.marca, required this.preco, required this.nome, this.id});

  validarBase() {
    validarPreco();
    validarNome();
    validarMarca();
  }

  validarPreco() {
    if (preco <= 0) throw PrecoInvalido();
  }

  validarNome() {
    if (nome.isEmpty) throw ConteudoInvalido("Não é permitido o nome de componente vazio");
  }

  validarMarca() {
    if (marca.isEmpty) throw ConteudoInvalido("Não é permitido a marca de componente vazia");
  }
}
