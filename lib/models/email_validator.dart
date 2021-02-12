import 'package:formz/formz.dart';

enum EmailValidatorError { isNotEmail, isTooShort, isUsed }

class Email extends FormzInput<String, EmailValidatorError> {
  const Email.pure([String value = '']) : super.pure(value);
  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');

  @override
  EmailValidatorError validator(String value) {
    if (value.isNotEmpty) {
      if (value.length > 6) {
        if (_emailRegExp.hasMatch(value)) {
          return null;
        } else {
          return EmailValidatorError.isNotEmail;
        }
      } else {
        return EmailValidatorError.isTooShort;
      }
    } else {
      return null;
    }
  }
}
