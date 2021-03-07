import 'package:FootballApp/blocs/article_list_bloc/article_list_bloc.dart';
import 'package:FootballApp/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:FootballApp/blocs/login_bloc/login_bloc.dart';
import 'package:FootballApp/blocs/register_bloc/register_bloc.dart';
import 'package:FootballApp/cubits/form_validation/form_validation_cubit.dart';
import 'package:FootballApp/resources/repositories/article_repository.dart';
import 'package:FootballApp/resources/repositories/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository authRespository = AuthenticationRepository(
      firebaseAuth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
      googleSignIn: GoogleSignIn());
  final ArticleRepository articleRepository = ArticleRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) =>
          AuthenticationBloc(authenticationRepository: authRespository)
            ..add(CheckAuthenticationStatus()),
      child: MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
              authenticationRepository: authRespository,
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        ),
        BlocProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(authenticationRepository: authRespository)),
        BlocProvider<FormValidationCubit>(
            create: (context) => FormValidationCubit()),
        BlocProvider<ArticleListBloc>(
            create: (context) =>
                ArticleListBloc(articleRepository: articleRepository)
                  ..add(FetchFirstPage()))
      ], child: AppView()),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: HexColor('6798B4'),
          textTheme: TextTheme(
              bodyText1: GoogleFonts.nunito(
            color: HexColor('444444'),
          ))),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
