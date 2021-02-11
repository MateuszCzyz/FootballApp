part of 'form_validation_cubit.dart';

class FormValidationState extends Equatable {
  final EmailValidatorStatus emailValidate;
  final PasswordValidatorStatus passwordValidate;
  final SecondPasswordValidatorStatus secondPasswordValidate;

  FormValidationState(
      {this.emailValidate, this.passwordValidate, this.secondPasswordValidate});

  get getEmailError {
    switch (emailValidate) {
      case EmailValidatorStatus.isTooShort:
        return 'This email is too short, must have 6 chars';
        break;
      case EmailValidatorStatus.isNotEmail:
        return 'Entered value is not email';
        break;
      case EmailValidatorStatus.isValid:
        return null;
        break;
    }
  }

  get getPasswordError {
    switch (passwordValidate) {
      case PasswordValidatorStatus.isTooShort:
        return 'Entered value must have 6 chars';
        break;
      case PasswordValidatorStatus.isValid:
        return null;
        break;
    }
  }

  get getSecondPasswordError {
    switch (secondPasswordValidate) {
      case SecondPasswordValidatorStatus.isTooShort:
        return 'Entered value must have 6 chars';
        break;
      case SecondPasswordValidatorStatus.firstPassIsInvalid:
        return 'First you have to enter the correct previous password';
        break;
      case SecondPasswordValidatorStatus.isDifferent:
        return 'The enterer password is not equal with previous password';
        break;
      case SecondPasswordValidatorStatus.isValid:
        return null;
        break;
    }
  }

  @override
  List<Object> get props =>
      [emailValidate, passwordValidate, secondPasswordValidate];
}
