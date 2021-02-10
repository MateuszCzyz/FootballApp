part of 'form_validation_cubit.dart';

class FormValidationState extends Equatable {
  final EmailValidatorStatus emailValidate;
  final PasswordValidatorStatus passwordValidate;

  FormValidationState({this.emailValidate, this.passwordValidate});

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

  @override
  List<Object> get props => [emailValidate, passwordValidate];
}
