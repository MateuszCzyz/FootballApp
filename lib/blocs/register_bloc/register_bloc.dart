import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:FootballApp/resources/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationRepository _authenticationRepository;
  RegisterBloc({AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(RegisterStarted());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is CreateNewAccount) {
      yield RegisterLoading();
      try {
        await _authenticationRepository.createUserWithEmailAndPassoword(
            email: event.email, password: event.password);
        _authenticationRepository.updateUserAccount(
            displayName: event.email.split('@')[0]);
        _authenticationRepository.signOut();
        yield SuccessRegistration();
      } on FirebaseAuthException catch (e) {
        yield FailureRegistration(errorMessage: e.code);
      }
    }
  }
}
