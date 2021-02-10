import 'package:FootballApp/blocs/login_bloc/login_bloc.dart';
import 'package:FootballApp/cubits/form_validation/form_validation_cubit.dart';
import 'package:FootballApp/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:FootballApp/models/email_validator.dart';

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
    return BlocProvider<FormValidationCubit>(
      create: (context) => FormValidationCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor('FBFBFB'),
          body: SingleChildScrollView(
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
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  height: 150,
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
                      BlocProvider.of<LoginBloc>(context).add(
                          SigInWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim()));
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
                      style: GoogleFonts.nunito(color: HexColor('888888'))),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      elevation: 0.5,
                      onPressed: () {},
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
                      )),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class EmailInput extends StatefulWidget {
  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  FocusNode _focusNode;
  FormValidationCubit _formValidationCubit;

  @override
  void initState() {
    super.initState();
    _formValidationCubit = BlocProvider.of<FormValidationCubit>(context);
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _formValidationCubit.emailUnFocus();
      } else {
        _formValidationCubit.emailFocus();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationCubit, FormValidationState>(
      cubit: BlocProvider.of<FormValidationCubit>(context),
      builder: (context, state) {
        return Container(
          width: 300,
          child: TextFormField(
            focusNode: _focusNode,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: HexColor('DDDDDD'), width: 1)),
                labelStyle: GoogleFonts.nunito(),
                labelText: 'Email',
                errorText: state.getEmailError,
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            onChanged: (value) {
              _formValidationCubit..emailChanged(value);
            },
          ),
        );
      },
    );
  }
}

class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  FocusNode _focusNode;
  FormValidationCubit _formValidationCubit;

  @override
  void initState() {
    super.initState();
    _formValidationCubit = BlocProvider.of<FormValidationCubit>(context);
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _formValidationCubit.passwordUnFocus();
      } else {
        _formValidationCubit.passwordFocus();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationCubit, FormValidationState>(
      builder: (context, state) {
        return Container(
          width: 300,
          child: TextFormField(
            focusNode: _focusNode,
            obscureText: true,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: HexColor('DDDDDD'), width: 1)),
                labelStyle: GoogleFonts.nunito(),
                labelText: 'Password',
                errorText: state.getPasswordError,
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide:
                        BorderSide(width: 0.5, color: HexColor('FBFBFB')))),
            onChanged: (value) {
              _formValidationCubit.passwordChanged(value);
            },
          ),
        );
      },
    );
  }
}
