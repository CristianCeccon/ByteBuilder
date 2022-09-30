import 'package:bytebuilder/domain/data/email_dto.dart';
import 'package:bytebuilder/domain/port/email_manager.dart';

class EnviarCompra {
  late EmailManager emailManager;
  EmailDTO emailDTO;

  EnviarCompra({required this.emailDTO, required this.emailManager});

  Future<bool> enviarEmailCompra() {
    return emailManager.enviarEmail(emailDTO);
  }
}
