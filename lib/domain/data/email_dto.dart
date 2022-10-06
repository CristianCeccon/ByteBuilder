import 'package:bytebuilder/domain/data/produto_dto.dart';

class EmailDTO {
  String assunto;
  String msg;
  String destino;
  List<ProdutoDTO> produtos;

  double precoTotal;

  EmailDTO({required this.assunto, required this.msg, required this.destino, required this.produtos, required this.precoTotal});
}
