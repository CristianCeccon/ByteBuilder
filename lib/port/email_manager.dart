import 'package:bytebuilder/data/email_dto.dart';

abstract class EmailManager {
  Future<bool> enviarEmail(EmailDTO emailDTO);
}
