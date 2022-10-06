import 'package:bytebuilder/domain/data/compra_dto_db.dart';
import 'package:bytebuilder/domain/entity/placa_mae.dart';
import 'package:bytebuilder/domain/entity/processador.dart';
import 'package:bytebuilder/domain/exception/componente_incompativel.dart';

class Compra {
  late PlacaMae placaMae;
  late Processador processador;
  int? id;

  late double precoTotal;

  Compra({required this.placaMae, required this.processador, this.id});

  CompraDTODatabase toDTODatabase() {
    return CompraDTODatabase(
      id: id!,
      placaMae: placaMae.toDTO(),
      processador: processador.toDTO(),
      precoTotal: precoTotal,
    );
  }

  Compra.criar(PlacaMae placaMae, Processador processador) {
    validarCompatibilidade(placaMae, processador);

    placaMae = placaMae;
    processador = processador;

    calcularPreco();
  }

  void calcularPreco() {
    precoTotal += placaMae.preco + processador.preco;
  }

  void validarCompatibilidade(PlacaMae placaMae, Processador processador) {
    if (placaMae.socket.toLowerCase() != processador.socket.toLowerCase()) {
      throw ComponenteIncompativel(
          "O processador é imcompatível com a placa-mãe escolhida");
    }
  }
}
