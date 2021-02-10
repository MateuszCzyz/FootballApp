import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:FootballApp/models/email_validator.dart';
import 'package:FootballApp/models/password_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';

part 'form_validation_state.dart';

class FormValidationCubit extends Cubit<FormValidationState> {
  String emailValue;
  String passwordValue;

  FormValidationCubit({email = '', password = ''})
      : super(FormValidationState());

  void emailChanged(String value) {
    Email email = Email.dirty(value);
    emailValue = email.value;
    emit(FormValidationState(
        emailValidate: email.error, passwordValidate: null));
  }

  void emailUnFocus() {
    emit(FormValidationState(emailValidate: null, passwordValidate: null));
  }

  void emailFocus() {
    emailChanged(emailValue);
  }

  void passwordChanged(String value) {
    Password password = Password.dirty(value);
    passwordValue = password.value;
    emit(FormValidationState(
        emailValidate: null, passwordValidate: password.error));
  }

  void passwordUnFocus() {
    emit(FormValidationState(emailValidate: null, passwordValidate: null));
  }

  void passwordFocus() {
    passwordChanged(passwordValue);
  }
}
