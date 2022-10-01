import 'package:bytebuilder/domain/entity/memoria.dart';
import 'package:bytebuilder/domain/entity/placa_mae.dart';
import 'package:bytebuilder/domain/entity/processador.dart';
import 'package:bytebuilder/domain/exception/componente_incompativel.dart';

class Compra {
  late PlacaMae placaMae;
  late Processador processador;
  late Memoria memoria;

  late double precoTotal;

  Compra({required this.placaMae, required this.memoria, required this.processador});

  Compra.criar(PlacaMae placaMae, Processador processador, Memoria memoria) {
    validarCompatibilidade(placaMae, memoria, processador);

    placaMae = placaMae;
    processador = processador;
    memoria = memoria;

    calcularPreco();
  }

  void calcularPreco() {
    precoTotal += placaMae.preco + memoria.preco + processador.preco;
  }

  void validarCompatibilidade(PlacaMae placaMae, Memoria memoria, Processador processador) {
    if (placaMae.socket.toLowerCase() != processador.socket.toLowerCase()) {
      throw ComponenteIncompativel("O processador é imcompatível com a placa-mãe escolhida");
    }

    if (placaMae.ddr != memoria.ddr) {
      throw ComponenteIncompativel("O DDR da memória não é compatível com o DDR da placa-mãe");
    }
  }
}
