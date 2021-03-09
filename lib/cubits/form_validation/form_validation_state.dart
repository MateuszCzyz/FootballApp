part of 'form_validation_cubit.dart';

class FormValidationState extends Equatable {
  final EmailValidatorError emailValidate;
  final PasswordValidatorError passwordValidate;
  final SecondPasswordValidatorError secondPasswordValidate;

  FormValidationState(
      {this.emailValidate, this.passwordValidate, this.secondPasswordValidate});

  get getEmailError {
    switch (emailValidate) {
      case EmailValidatorError.isTooShort:
        return 'This email is too short, must have 6 chars';
        break;
      case EmailValidatorError.isNotEmail:
        return 'Entered value is not email';
        break;
      case EmailValidatorError.isUsed:
        return 'Entered email is already used';
        break;
      case EmailValidatorError.isEmpty:
        return null;
        break;
    }
  }

  get getPasswordError {
    switch (passwordValidate) {
      case PasswordValidatorError.isTooShort:
        return 'Entered value must have 6 chars';
        break;
      case PasswordValidatorError.isEmpty:
        return null;
        break;
    }
  }

  get getSecondPasswordError {
    switch (secondPasswordValidate) {
      case SecondPasswordValidatorError.isTooShort:
        return 'Entered value must have 6 chars';
        break;
      case SecondPasswordValidatorError.firstPassIsInvalid:
        return 'First you have to enter the correct previous password';
        break;
      case SecondPasswordValidatorError.isDifferent:
        return 'The enterer password is not equal with previous password';
        break;
      case SecondPasswordValidatorError.isEmpty:
        return null;
        break;
    }
  }

  @override
  List<Object> get props =>
      [emailValidate, passwordValidate, secondPasswordValidate];
}
