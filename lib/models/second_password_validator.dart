import 'package:formz/formz.dart';
import '../models/password_validator.dart';

enum SecondPasswordValidatorError {
  isTooShort,
  isDifferent,
  firstPassIsInvalid,
}

class SecondPassword extends FormzInput<String, SecondPasswordValidatorError> {
  const SecondPassword.pure([String value = '']) : super.pure(value);
  const SecondPassword.dirty([String value = '']) : super.dirty(value);
  static Password _firstPassword;

  set setFirstPassword(Password firstPassword) {
    _firstPassword = firstPassword;
  }

  @override
  SecondPasswordValidatorError validator(String value) {
    if (value.length > 0) {
      if (_firstPassword.valid) {
        if (value.length > 6) {
          if (value == _firstPassword.value) {
            return null;
          } else {
            return SecondPasswordValidatorError.isDifferent;
          }
        } else {
          return SecondPasswordValidatorError.isTooShort;
        }
      } else {
        return SecondPasswordValidatorError.firstPassIsInvalid;
      }
    } else {
      return null;
    }
  }
}
