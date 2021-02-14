import 'package:formz/formz.dart';

enum PasswordValidatorError { isTooShort, isEmpty }

class Password extends FormzInput<String, PasswordValidatorError> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidatorError validator(String value) {
    if (value.isNotEmpty) {
      if (value.length >= 6) {
        return null;
      } else {
        return PasswordValidatorError.isTooShort;
      }
    } else {
      return PasswordValidatorError.isEmpty;
    }
  }
}
