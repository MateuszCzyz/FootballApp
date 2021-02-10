import 'dart:async';

import 'package:FootballApp/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc({AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AuthenticationStarted());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is CheckAuthenticationStatus) {
      yield* mapCheckAuthStatusToState();
    } else if (event is LoggedInAuthentication) {
      yield SuccesAuthentication();
    } else if (event is LogoutAuthentication) {
      yield* mapSignOutToState();
    }
  }

  Stream<AuthenticationState> mapCheckAuthStatusToState() async* {
    if (_authenticationRepository.isSignedIn()) {
      yield SuccesAuthentication();
    } else {
      yield FailureAuthentication();
    }
  }

  Stream<AuthenticationState> mapSignOutToState() async* {
    await _authenticationRepository.signOut();
    yield FailureAuthentication();
  }
}
