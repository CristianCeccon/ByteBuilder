import 'dart:convert';

import 'package:bytebuilder/domain/data/email_dto.dart';
import 'package:bytebuilder/domain/port/email_manager.dart';
import 'package:dio/dio.dart';

class EmailManagerImpl extends EmailManager {
  @override
  Future<bool> enviarEmail(EmailDTO emailDTO) async {
    var conteudo = "<h3>${emailDTO.msg}</h3>";

    for (var produto in emailDTO.produtos) {
      conteudo += "<div style='display: flex;'> <h4> ${produto.nome}: ${produto.preco} <h4> </div>";
    }

    conteudo += "<h3> Preco Total: ${emailDTO.precoTotal}</h3>";

    try {
      await Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000")).post("/send_email",
          data: json.encode({
            "email": emailDTO.destino,
            "content": conteudo,
            "subject": emailDTO.assunto,
          }));
      return true;
    } catch (err) {
      return false;
    }
  }
}
