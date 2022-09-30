import 'package:bytebuilder/domain/data/email_dto.dart';

abstract class EmailManager {
  Future<bool> enviarEmail(EmailDTO emailDTO);
}
