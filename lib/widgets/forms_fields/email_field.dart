import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FootballApp/cubits/form_validation/form_validation_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:FootballApp/resources/repositories/auth_repository.dart';

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
        _formValidationCubit.unFocusForm();
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
                contentPadding: EdgeInsets.all(10),
                errorText: state.getEmailError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
            onChanged: (value) async {
              _formValidationCubit.emailChanged(value);
            },
          ),
        );
      },
    );
  }
}
