import 'package:bytebuilder/entity/memoria.dart';
import 'package:bytebuilder/entity/placa_mae.dart';
import 'package:bytebuilder/entity/processador.dart';
import 'package:bytebuilder/exception/componente_incompativel.dart';

class Compra {
  late PlacaMae placaMae;
  late Processador processador;
  late Memoria memoria;

  late double precoTotal;

  Compra({required this.placaMae, required this.memoria, required this.processador});

  Compra.criar(){
    // TODO: fazer construtor validando todos os componentes e calculando preco
  }

  void calcularPreco(){
    precoTotal += placaMae.preco + memoria.preco + processador.preco;
  }

  void validarCompatibilidade(){
    if (placaMae.socket.toLowerCase() != processador.socket.toLowerCase()) {
      throw ComponenteIncompativel("O processador é imcompatível com a placa-mãe escolhida");
      }

    if (placaMae.ddr != memoria.ddr){
      throw ComponenteIncompativel("O DDR da memória não é compatível com o DDR da placa-mãe");
    }
  }
}
