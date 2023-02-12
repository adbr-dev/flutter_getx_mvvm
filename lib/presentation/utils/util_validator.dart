import 'package:form_field_validator/form_field_validator.dart';

class UtilValidator {
  UtilValidator._();
  static MultiValidator get displayNameValidator {
    return MultiValidator([
      MinLengthValidator(2, errorText: '2자 이상 입력해주세요'),
      MaxLengthValidator(10, errorText: '10자 이하로 입력해주세요'),
    ]);
  }
}
