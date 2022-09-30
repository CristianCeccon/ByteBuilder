import 'package:bytebuilder/data/compra_dto.dart';
import 'package:bytebuilder/entity/compra.dart';
import 'package:bytebuilder/entity/memoria.dart';
import 'package:bytebuilder/entity/placa_mae.dart';
import 'package:bytebuilder/entity/processador.dart';
import 'package:bytebuilder/port/compra_repository.dart';
import 'package:bytebuilder/port/memoria_repository.dart';
import 'package:bytebuilder/port/placa_mae_repository.dart';
import 'package:bytebuilder/port/processador_repository.dart';

class SalvarCompra {
  late MemoriaRepository memoriaRepository;
  late ProcessadorRepository processadorRepository;
  late PlacaMaeRepository placaMaeRepository;
  late CompraRepository compraRepository;
  late CompraDTO compraDTO;

  SalvarCompra(this.memoriaRepository, this.compraDTO, this.placaMaeRepository,
      this.processadorRepository, this.compraRepository) {
    Memoria memoria = Memoria.criar(compraDTO);
    Processador processador = Processador.criar(compraDTO);
    PlacaMae placaMae = PlacaMae.criar(compraDTO);
    Compra compra = Compra.criar(compraDTO);
    memoriaRepository.salvar(memoria);
    processadorRepository.salvar(processador);
    placaMaeRepository.salvar(placaMae);
    compraRepository.salvar(compra);
  }
}
