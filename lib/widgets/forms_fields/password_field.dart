import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FootballApp/cubits/form_validation/form_validation_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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
        _formValidationCubit.unFocusForm();
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
