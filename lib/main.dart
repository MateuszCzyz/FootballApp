import 'package:FootballApp/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:FootballApp/blocs/login_bloc/login_bloc.dart';
import 'package:FootballApp/blocs/register_bloc/register_bloc.dart';
import 'package:FootballApp/cubits/form_validation/form_validation_cubit.dart';
import 'package:FootballApp/repositories/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository authRespository = AuthenticationRepository(
      firebaseAuth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRespository,
      child: BlocProvider<AuthenticationBloc>(
        create: (context) =>
            AuthenticationBloc(authenticationRepository: authRespository)
              ..add(CheckAuthenticationStatus()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(
                  authenticationRepository: authRespository,
                  authenticationBloc:
                      BlocProvider.of<AuthenticationBloc>(context)),
            ),
            BlocProvider<RegisterBloc>(
                create: (context) =>
                    RegisterBloc(authenticationRepository: authRespository)),
            BlocProvider<FormValidationCubit>(
                create: (context) => FormValidationCubit())
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}
