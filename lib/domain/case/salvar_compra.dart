import 'package:bytebuilder/domain/case/enviar_compra.dart';
import 'package:bytebuilder/domain/data/compra_dto.dart';
import 'package:bytebuilder/domain/data/email_dto.dart';
import 'package:bytebuilder/domain/data/produto_dto.dart';
import 'package:bytebuilder/domain/entity/compra.dart';
import 'package:bytebuilder/domain/entity/placa_mae.dart';
import 'package:bytebuilder/domain/entity/processador.dart';
import 'package:bytebuilder/domain/port/compra_repository.dart';
import 'package:bytebuilder/domain/port/email_manager.dart';
import 'package:bytebuilder/domain/port/placa_mae_repository.dart';
import 'package:bytebuilder/domain/port/processador_repository.dart';

class SalvarCompra {
  late ProcessadorRepository processadorRepository;
  late PlacaMaeRepository placaMaeRepository;
  late CompraRepository compraRepository;
  late CompraDTO compraDTO;

  late EmailManager emailManager;

  late List<ProdutoDTO> produtos;

  SalvarCompra(this.compraDTO, this.placaMaeRepository, this.processadorRepository, this.compraRepository) {
    
    Processador processador = Processador.criar(compraDTO.processador);
    PlacaMae placaMae = PlacaMae.criar(compraDTO.placaMae);
    Compra compra = Compra.criar(placaMae, processador);
    processadorRepository.salvar(processador.toDTO());
    placaMaeRepository.salvar(placaMae.toDTO());
    compraRepository.salvar(compra.toDTODatabase());

    produtos = [
      ProdutoDTO(nome: placaMae.nome, preco: placaMae.preco),
      ProdutoDTO(nome: processador.nome, preco: processador.preco),
    ];

    enviarEmail(compra.precoTotal);
  }

  void enviarEmail(double precoTotal) {
    var emailDTO = EmailDTO(
      assunto: "Compra concluída.",
      destino: "email@gmail.com",
      msg: "Sua compra foi concluída com sucesso.",
      precoTotal: precoTotal,
      produtos: produtos,
    );

    var enviarCompra = EnviarCompra(emailDTO: emailDTO, emailManager: emailManager);
    enviarCompra.enviarEmailCompra();
  }
}
