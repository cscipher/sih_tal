import 'package:flutter/material.dart';

class Misc {
  BuildContext context;
  late ThemeData _theme;

  Misc(this.context) {
    _theme = Theme.of(context);
  }

  Padding inputField(
      {required String label,
      required IconData prefixIcon,
      required TextEditingController controller,
      String? Function(String?)? validatorFn,
      bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        onChanged: (value) {},
        validator: validatorFn,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: _theme.primaryColor,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                width: 4.0),
          ),
          labelText: label,
          labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.5)),
        ),
      ),
    );
  }

  Widget customProgressIndicator() => Center(
        child: CircularProgressIndicator(
          color: _theme.primaryColor,
        ),
      );

  Widget sihLogo() => Align(
        alignment: Alignment.bottomRight,
        child: Image.asset(
          'assets/images/sih_logo.png',
          height: 65,
          width: 65,
        ),
      );

  Widget circleAsset() => Align(
        alignment: Alignment.bottomLeft,
        // child: Image.asset(
        //   'assets/images/circles.png',
        //   height: 120,
        //   width: 120,
        // ),
      );
}
