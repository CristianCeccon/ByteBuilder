import 'package:bytebuilder/data/compra_dto.dart';
import 'package:bytebuilder/entity/memoria.dart';
import 'package:bytebuilder/entity/placa_mae.dart';
import 'package:bytebuilder/entity/processador.dart';
import 'package:bytebuilder/exception/componente_incompativel.dart';

class Compra {
  late PlacaMae placaMae;
  late Processador processador;
  late Memoria memoria;

  late double precoTotal;

  Compra(
      {required this.placaMae,
      required this.memoria,
      required this.processador});

  Compra.criar(CompraDTO compra) {
    validarCompatibilidade(compra);

    placaMae = compra.placaMae;
    processador = compra.processador;
    memoria= compra.memoria;
    
    calcularPreco();
  }

  void calcularPreco() {
    precoTotal += placaMae.preco + memoria.preco + processador.preco;
  }

  void validarCompatibilidade(CompraDTO compra) {
    if (compra.placaMae.socket.toLowerCase() != compra.processador.socket.toLowerCase()) {
      throw ComponenteIncompativel(
          "O processador é imcompatível com a placa-mãe escolhida");
    }

    if (compra.placaMae.ddr != compra.memoria.ddr) {
      throw ComponenteIncompativel(
          "O DDR da memória não é compatível com o DDR da placa-mãe");
    }
  }
}
