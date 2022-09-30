import 'package:bytebuilder/data/email_dto.dart';
import 'package:bytebuilder/port/email_manager.dart';

class EnviarCompra {
  late EmailManager _emailManager;
  EmailDTO emailDTO;

  EnviarCompra({required this.emailDTO});

  Future<bool> enviarEmailCompra() {
    return _emailManager.enviarEmail(emailDTO);
  }
}
