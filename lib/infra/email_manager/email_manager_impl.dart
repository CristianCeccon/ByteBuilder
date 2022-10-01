import 'package:bytebuilder/domain/data/email_dto.dart';
import 'package:bytebuilder/domain/port/email_manager.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class EmailManagerImpl extends EmailManager {
  @override
  Future<bool> enviarEmail(EmailDTO emailDTO) async {
    var conteudo = "<h3>${emailDTO.msg}</h3>";

    emailDTO.produtos.map((produto) => conteudo += "<div style='display: flex;'> ${produto.nome}: ${produto.preco}</div>");

    final msg = Message()
      ..from = const Address("username", 'Your name')
      ..recipients.add(emailDTO.destino)
      ..subject = 'Compra concluída'
      ..html = conteudo;

    try {
      await send(msg, gmailRelaySaslXoauth2("email@gmail.com", "token"));
      return true;
    } on MailerException {
      return false;
    }
  }
}
