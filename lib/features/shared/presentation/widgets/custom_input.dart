import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.text,
    required this.icon,
    required this.controller,
    required this.state,
    required this.validator,
    this.hide = false,
    this.inputAction = TextInputAction.next,
    this.inputFormatters = const [],
  });
  final String text;
  final IconData icon;
  final TextEditingController controller;
  final AsyncValue state;
  final String? Function(String?)? validator;
  final bool hide;
  final TextInputAction inputAction;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: Theme.of(context).shadowColor,
        width: 2.0,
      ),
    );

    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          controller: controller,
          autofocus: false,
          autocorrect: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          textInputAction: inputAction,
          obscureText: hide,
          inputFormatters: inputFormatters,
          style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            enabled: !state.isLoading,
            hintText: text,
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            border: inputBorder,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            filled: true,
            fillColor: Theme.of(context).shadowColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          ),
        ));
  }
}
