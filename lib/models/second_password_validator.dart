import 'package:formz/formz.dart';
import '../models/password_validator.dart';

enum SecondPasswordValidatorStatus {
  isTooShort,
  isDifferent,
  firstPassIsInvalid,
  isValid
}

class SecondPassword extends FormzInput<String, SecondPasswordValidatorStatus> {
  const SecondPassword.pure([String value = '']) : super.pure(value);
  const SecondPassword.dirty([String value = '']) : super.dirty(value);
  static Password _firstPassword;

  set setFirstPassword(Password firstPassword) {
    _firstPassword = firstPassword;
  }

  @override
  SecondPasswordValidatorStatus validator(String value) {
    if (value.length > 0) {
      if (_firstPassword.error == PasswordValidatorStatus.isValid) {
        if (value.length > 6) {
          if (value == _firstPassword.value) {
            return SecondPasswordValidatorStatus.isValid;
          } else {
            return SecondPasswordValidatorStatus.isDifferent;
          }
        } else {
          return SecondPasswordValidatorStatus.isTooShort;
        }
      } else {
        return SecondPasswordValidatorStatus.firstPassIsInvalid;
      }
    } else {
      return SecondPasswordValidatorStatus
          .isValid; // is valid because empty field does not show any errors
    }
  }
}
