import 'package:flutter/material.dart';

import 'Formulario.dart';
import 'Home.dart';

final ThemeData temaDefault = ThemeData(
  primaryColor: Color(0xff1b3155),
  accentColor: Color(0xfffff200)
);

void main() => runApp(MaterialApp(
    title: "Tipos de Mascaras e validações",
    //home: Home(),
    home: Formulario(),
    theme: temaDefault,
    debugShowCheckedModeBanner: false,
  ));

