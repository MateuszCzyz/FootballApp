import 'package:formz/formz.dart';

enum EmailValidatorStatus { isNotEmail, isTooShort, isValid }

class Email extends FormzInput<String, EmailValidatorStatus> {
  const Email.pure([String value = '']) : super.pure(value);
  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegExp = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');

  @override
  EmailValidatorStatus validator(String value) {
    if (value.isNotEmpty) {
      if (value.length > 6) {
        if (_emailRegExp.hasMatch(value)) {
          return EmailValidatorStatus.isValid;
        } else {
          return EmailValidatorStatus.isNotEmail;
        }
      } else {
        return EmailValidatorStatus.isTooShort;
      }
    } else {
      return EmailValidatorStatus.isValid;
    }
  }
}
