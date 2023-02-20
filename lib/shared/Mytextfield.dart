// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';
class Mytextfield extends StatelessWidget {


  final TextInputType textInputTypee;

  final bool ispassword;

  final String textinbox;
  final  myController;
  Mytextfield({required this.myController,required this.textInputTypee,required this.ispassword,required this.textinbox});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: myController,
        keyboardType: textInputTypee,
        obscureText: ispassword,
        decoration: InputDecoration(
          hintText: textinbox,
          // To delete borders
          enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context),),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),),
          // fillColor: Colors.red,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ));
  }
}
