import 'package:bytebuilder/domain/data/placa_mae_dto.dart';
import 'package:bytebuilder/domain/entity/base.dart';
import 'package:bytebuilder/domain/exception/conteudo_invalido.dart';
import 'package:bytebuilder/domain/exception/valor_inavlido.dart';

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

  PlacaMaeDTO toDTO() {
    return PlacaMaeDTO(
      ddr: ddr,
      socket: socket,
      marca: marca,
      preco: preco,
      nome: nome,
    );
  }

  PlacaMae.criar(PlacaMaeDTO placaMae) : super(preco: placaMae.preco, nome: placaMae.nome, marca: placaMae.marca) {
    placaMae.validarBase();

    int ddr = placaMae.ddr;
    String socket = placaMae.socket;

    if (ddr <= 0 || ddr > 10) throw ValorInvalido("O valor do DDR é inválido");
    if (socket.isEmpty) throw ConteudoInvalido("O modelo do socket não pode ser vazio");

    this.ddr = ddr;
    this.socket = socket;
    nome = placaMae.nome;
    preco = placaMae.preco;
    marca = placaMae.marca;
  }
}
