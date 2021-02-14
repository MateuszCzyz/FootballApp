import 'package:FootballApp/models/second_password_validator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:FootballApp/models/email_validator.dart';
import 'package:FootballApp/models/password_validator.dart';
import 'package:formz/formz.dart';
import 'package:dartz/dartz.dart';
part 'form_validation_state.dart';

class ErrorValidate {
  final String message;
  ErrorValidate({this.message});
}

class SuccesValidate {}

class FormValidationCubit extends Cubit<FormValidationState> {
  String emailValue = '';
  String passwordValue = '';
  String secondPasswordValue = '';

  FormValidationCubit({email = '', password = '', secondPassword = ''})
      : super(FormValidationState());

  void emailChanged(String value) {
    Email email = Email.dirty(value);
    emailValue = email.value;
    emit(FormValidationState(emailValidate: email.error));
  }

  void passwordChanged(String value) {
    Password password = Password.dirty(value);
    passwordValue = password.value;
    emit(FormValidationState(passwordValidate: password.error));
  }

  void secondPasswordChanged(String value) {
    SecondPassword secondPassword = SecondPassword.dirty(value)
      ..setFirstPassword = Password.dirty(passwordValue);
    secondPasswordValue = secondPassword.value;
    emit(FormValidationState(secondPasswordValidate: secondPassword.error));
  }

  void passwordFocus() {
    passwordChanged(passwordValue);
  }

  void emailFocus() {
    emailChanged(emailValue);
  }

  void secondPasswordFocus() {
    secondPasswordChanged(secondPasswordValue);
  }

  void unFocusForm() {
    emit(FormValidationState());
  }

  void clearForm() {
    emailValue = '';
    passwordValue = '';
    secondPasswordValue = '';
  }

  Map<String, dynamic> loginFormValidate() {
    FormzStatus formStatus = Formz.validate(
        [Email.dirty(emailValue), Password.dirty(passwordValue)]);
    return {
      'validate': formStatus.isValid,
      'message': (emailValue.isEmpty || passwordValue.isEmpty)
          ? 'The forms fields cannot be empty'
          : 'The form fields have not been properly completed'
    };
  }

  Map<String, dynamic> registerFormValidate() {
    FormzStatus formStatus = Formz.validate([
      Email.dirty(emailValue),
      Password.dirty(passwordValue),
      SecondPassword.dirty(secondPasswordValue)
    ]);
    return {
      'validate': formStatus.isValid,
      'message': (emailValue.isEmpty ||
              passwordValue.isEmpty ||
              secondPasswordValue.isEmpty)
          ? 'The forms fields cannot be empty'
          : 'The form fields have not been properly completed'
    };
  }
}
