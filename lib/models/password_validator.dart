import 'package:formz/formz.dart';

enum PasswordValidatorError { isTooShort }

class Password extends FormzInput<String, PasswordValidatorError> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidatorError validator(String value) {
    if (value.length > 6 || value.length == 0) {
      return null;
    } else if (value.length > 0) {
      return PasswordValidatorError.isTooShort;
    }
  }
}
