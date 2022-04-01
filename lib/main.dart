import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sih_tal/theme/theme.dart';
import 'package:sih_tal/views/login.view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TAL',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.appTheme,
        home: const LoginPage());
  }
}
