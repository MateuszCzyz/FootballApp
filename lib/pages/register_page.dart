import 'dart:async';
import 'package:FootballApp/blocs/register_bloc/register_bloc.dart';
import 'package:FootballApp/cubits/form_validation/form_validation_cubit.dart';
import 'package:FootballApp/widgets/forms_fields/email_field.dart';
import 'package:FootballApp/widgets/forms_fields/password_field.dart';
import 'package:FootballApp/widgets/forms_fields/second_password_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/others/snackbar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormValidationCubit>(
      create: (context) => FormValidationCubit(),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: HexColor('FBFBFB'),
            body: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is FailureRegistration) {
                  Scaffold.of(context).removeCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(getSnackBar(
                      type: SnackbarType.failure,
                      message: codeErrorToMessage(state.errorMessage)));
                } else if (state is SuccessRegistration) {
                  Navigator.of(context).pop();
                }
              },
              child: Builder(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sign up panel',
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
                        height: 150,
                        decoration: BoxDecoration(
                            color: HexColor('6798B4'),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(90))),
                      ),
                      SizedBox(height: 50),
                      EmailInput(),
                      SizedBox(height: 20),
                      PasswordInput(),
                      SizedBox(height: 20),
                      SecondPasswordInput(),
                      SizedBox(height: 15),
                      Container(
                        width: 300,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            FormValidationCubit formCubit =
                                BlocProvider.of<FormValidationCubit>(context);
                            Map<String, dynamic> formStatus =
                                formCubit.registerFormValidate();
                            if (formStatus['validate']) {
                              BlocProvider.of<RegisterBloc>(context).add(
                                  CreateNewAccount(
                                      email: formCubit.emailValue,
                                      password: formCubit.passwordValue));
                            } else {
                              Scaffold.of(context).showSnackBar(getSnackBar(
                                  type: SnackbarType.failure,
                                  message: formStatus['message']));
                            }
                          },
                          color: HexColor('6798B4'),
                          child: Text(
                            'Create an account',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )),
      ),
    );
  }
}

String codeErrorToMessage(String code) {
  switch (code) {
    case 'invalid-email':
      return 'That email is not correct';
      break;
    case 'user-not-found':
      return 'The user was not found';
      break;
    case 'unknown':
      return 'The fields cannot be empty';
      break;
    case 'invalid-password':
      return 'The password is too short';
      break;
    case 'email-already-in-use':
      return 'This email already exists';
      break;
    default:
      return '';
      break;
  }
}
