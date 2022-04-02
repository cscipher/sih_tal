import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_tal/controller/dataTrack.c.dart';
import 'package:sih_tal/theme/theme.dart';
import 'package:sih_tal/views/dataInfo.view.dart';
import 'package:sih_tal/views/login.view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'TAL',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.appTheme,
        home: const DataInfo());
  }
}
