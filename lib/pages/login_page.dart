import 'package:FootballApp/blocs/login_bloc/login_bloc.dart';
import 'package:FootballApp/blocs/register_bloc/register_bloc.dart';
import 'package:FootballApp/cubits/form_validation/form_validation_cubit.dart';
import 'package:FootballApp/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:FootballApp/widgets/forms_fields/email_field.dart';
import 'package:FootballApp/widgets/forms_fields/password_field.dart';
import '../functions/show_snackbar.dart';
import '../functions/get_error_message.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: HexColor('FBFBFB'),
            body: SingleChildScrollView(
              child: MultiBlocListener(
                  listeners: [
                    BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                      if (state is LoginSuccess) {
                        Navigator.of(context).pop();
                      } else if (state is LoginFailure) {
                        Scaffold.of(context).removeCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(getSnackBar(
                            type: SnackbarType.failure,
                            message: codeErrorToMessage(state.errorMessage)));
                      }
                    }),
                    BlocListener<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                      if (state is SuccessRegistration) {
                        BlocProvider.of<FormValidationCubit>(context)
                            .clearForm();
                        Scaffold.of(context).showSnackBar(getSnackBar(
                            type: SnackbarType.success,
                            message:
                                'Your account has been sucessfully created!'));
                      }
                    })
                  ],
                  child: Builder(
                    builder: (context) {
                      return SingleChildScrollView(
                          child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sign in panel',
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18)),
                                  SizedBox(height: 5),
                                  Text(
                                    'If you want get acces to commenting sport posts and exchange your insights and opinion about concerete situations you have to sign in to our app',
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: HexColor('6798B4'),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(80),
                                      bottomRight: Radius.circular(80))),
                            ),
                            SizedBox(height: 50),
                            EmailInput(),
                            SizedBox(height: 20),
                            PasswordInput(),
                            SizedBox(height: 15),
                            Container(
                              width: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  BlocProvider.of<FormValidationCubit>(context)
                                      .loginFormValidate(
                                          context: context,
                                          scaffold: Scaffold.of(context));
                                },
                                color: HexColor('6798B4'),
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                              },
                              child: Text('Create a new account',
                                  style: GoogleFonts.nunito(
                                      color: HexColor('888888'))),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                elevation: 0.5,
                                color: HexColor('F0F0F0'),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/google.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Sign in with google',
                                      style: GoogleFonts.nunito(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(SigInWithGoogle());
                                },
                              ),
                            ),
                          ],
                        ),
                      ));
                    },
                  )),
            )));
  }
}
