import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';

void main() {
  runApp(ColorPicker());
}

class ColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingPage(),
      routes: {
        "/loading": (context) => LoadingPage(),
        "/home": (context) => ColorPickerHome()
      },
    );
  }
}
