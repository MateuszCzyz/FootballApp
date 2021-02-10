import 'package:formz/formz.dart';

enum PasswordValidatorStatus { isTooShort, isValid }

class Password extends FormzInput<String, PasswordValidatorStatus> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidatorStatus validator(String value) {
    if (value.length > 6 || value.length == 0) {
      return PasswordValidatorStatus.isValid;
    } else if (value.length > 0) {
      return PasswordValidatorStatus.isTooShort;
    }
  }
}
