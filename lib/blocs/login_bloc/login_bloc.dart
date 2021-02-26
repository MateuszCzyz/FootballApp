import 'package:FootballApp/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:FootballApp/resources/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationRepository _authenticationRepository;
  LoginBloc(
      {AuthenticationBloc authenticationBloc,
      AuthenticationRepository authenticationRepository})
      : _authenticationBloc = authenticationBloc,
        _authenticationRepository = authenticationRepository,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SigInWithEmailAndPassword) {
      yield LoginLoading();
      yield* mapSignInWithEmailAndPasswordToState(
          email: event.email, password: event.password);
    } else if (event is SigInWithGoogle) {
      yield LoginLoading();
      yield* mapSignInWithGoogleToState();
    }
  }

  Stream<LoginState> mapSignInWithEmailAndPasswordToState(
      {String email, String password}) async* {
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
          email: email, password: password);
      yield LoginSuccess();
      _authenticationBloc.add(LoggedInAuthentication());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      yield LoginFailure(errorMessage: e.code);
    }
  }

  Stream<LoginState> mapSignInWithGoogleToState() async* {
    try {
      await _authenticationRepository.signInWithGoogle();
      _authenticationBloc.add(LoggedInAuthentication());
      yield LoginSuccess();
    } on FirebaseAuthException catch (e) {
      yield LoginFailure(errorMessage: 'sign-in-google-went-wrong');
    }
  }
}
