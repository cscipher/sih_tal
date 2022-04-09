import 'package:flutter/material.dart';

class Buttons {
  final ThemeData _theme;
  Buttons(this._theme);

  Widget primaryButton(onPress, String label) => ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: _theme.primaryColor,
          textStyle: const TextStyle(color: Colors.white, fontSize: 20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ));
}
