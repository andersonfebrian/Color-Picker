import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ColorPicker());
}

class ColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ColorPickerHome());
  }
}

class ColorPickerHome extends StatefulWidget {
  @override
  _ColorPickerHomeState createState() => _ColorPickerHomeState();
}

class _ColorPickerHomeState extends State<ColorPickerHome> {
  
  double _redSlider = 0;
  double _blueSlider = 0;
  double _greenSlider = 0;
  double _opacitySlider = 1;

  Color? _appBarColor = Color.fromRGBO(0, 0, 0, 1);

  Map<String, Color> _presetColors = {
    "Red": Colors.red,
    "Blue": Colors.blue,
    "Green": Colors.green,
    "Yellow": Colors.yellow
  };
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ColorPicker"),
          backgroundColor: _appBarColor ?? Color.fromRGBO(0, 0, 0, 1),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var v in _presetColors.entries)
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() => _appBarColor = v.value);
                    },
                    child: Text(v.key),
                    style: ElevatedButton.styleFrom(
                        primary: v.value,
                        minimumSize: Size(double.infinity, 50))
                        ),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              ),
            Slider(
              value: _redSlider,
              onChanged: (value) {
                setState(() {
                  _redSlider = value;
                  _appBarColor = Color.fromRGBO(_redSlider.toInt(), _greenSlider.toInt(), _blueSlider.toInt(), _opacitySlider);
                });
              },
              min: 0,
              max: 255,
              divisions: 255,
              label: "$_redSlider",
              activeColor: Colors.red,
            ),
            Slider(
              value: _greenSlider,
              onChanged: (value) {
                setState(() {
                  _greenSlider = value;
                  _appBarColor = Color.fromRGBO(_redSlider.toInt(), _greenSlider.toInt(), _blueSlider.toInt(), _opacitySlider);
                });
              },
              min: 0,
              max: 255,
              divisions: 255,
              label: "$_greenSlider",
              activeColor: Colors.green,
            ),
            Slider(
              value: _blueSlider,
              onChanged: (value) {
                setState(() {
                  _blueSlider = value;
                  _appBarColor = Color.fromRGBO(_redSlider.toInt(), _greenSlider.toInt(), _blueSlider.toInt(), _opacitySlider);
                });
              },
              min: 0,
              max: 255,
              divisions: 255,
              label: "$_blueSlider",
              activeColor: Colors.blue,
            ),
            Slider(
              value: _opacitySlider,
              onChanged: (value) {
                setState(() {
                  _opacitySlider = value;
                  _appBarColor = Color.fromRGBO(_redSlider.toInt(), _greenSlider.toInt(), _blueSlider.toInt(), _opacitySlider);
                });
              },
              min: 0.0,
              max: 1.0,
              divisions: 100,
              label: "$_opacitySlider",
              activeColor: Colors.grey,
            ),
          
          ],
        ));
  }
}
