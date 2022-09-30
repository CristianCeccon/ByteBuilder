import 'package:bytebuilder/data/compra_dto.dart';
import 'package:bytebuilder/entity/base.dart';
import 'package:bytebuilder/exception/conteudo_invalido.dart';
import 'package:bytebuilder/exception/valor_inavlido.dart';

class PlacaMae extends Base {
  late String socket;
  late int ddr;

  PlacaMae({
    required this.ddr,
    required this.socket,
    required marca,
    required preco,
    required nome,
  }) : super(marca: marca, preco: preco, nome: nome);

  PlacaMae.criar(CompraDTO compra) : super(preco: compra.placaMae.preco, nome: compra.placaMae.nome, marca: compra.placaMae.marca) {
    compra.placaMae.validarBase();

    int ddr = compra.placaMae.ddr;
    String socket = compra.placaMae.socket;

    if (ddr <= 0 || ddr > 10) throw ValorInvalido("O valor do DDR é inválido");
    if (socket.isEmpty) throw ConteudoInvalido("O modelo do socket não pode ser vazio");

    this.ddr = ddr;
    this.socket = socket;
    nome = compra.placaMae.nome;
    preco = compra.placaMae.preco;
    marca = compra.placaMae.marca;
  }
}
