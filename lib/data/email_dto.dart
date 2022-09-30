import 'package:bytebuilder/data/produto_dto.dart';

class EmailDTO {
  String msg;
  String destino;
  List<ProdutoDTO> produtos;

  double precoTotal;

  EmailDTO({required this.msg, required this.destino, required this.produtos, required this.precoTotal});
}
