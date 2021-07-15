import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'util.dart';

class ColorPickerHome extends StatefulWidget {
  @override
  _ColorPickerHomeState createState() => _ColorPickerHomeState();
}

class _ColorPickerHomeState extends State<ColorPickerHome> {
  bool flag = false;

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

  void saveSliderPosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble("redSlider", _redSlider);
    prefs.setDouble("blueSlider", _blueSlider);
    prefs.setDouble("greenSlider", _greenSlider);
    prefs.setDouble("opacitySlider", _opacitySlider);
  }

  @override
  void initState() {
    super.initState();
    getSliderData().then((value) {
      _redSlider = value['redSlider'] ?? 0;
      _blueSlider = value['blueSlider'] ?? 0;
      _greenSlider = value['greenSlider'] ?? 0;
      _opacitySlider = value['opacitySlider'] ?? 0;
      _appBarColor = Color.fromRGBO(_redSlider.toInt(), _greenSlider.toInt(),
          _blueSlider.toInt(), _opacitySlider);
    }).whenComplete(() {
      print("done");
      setState(() {
        flag = true;
      });
    });
    print("called");
  }

  @override
  Widget build(BuildContext context) {
    if (!flag) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
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
                          minimumSize: Size(double.infinity, 50))),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                ),
              Slider(
                value: _redSlider,
                onChanged: (value) {
                  setState(() {
                    _redSlider = value;
                    _appBarColor = Color.fromRGBO(
                        _redSlider.toInt(),
                        _greenSlider.toInt(),
                        _blueSlider.toInt(),
                        _opacitySlider);
                    saveSliderPosition();
                  });
                },
                min: 0,
                max: 255,
                divisions: 255,
                label: "$_redSlider",
                activeColor: _presetColors["Red"],
              ),
              Slider(
                value: _greenSlider,
                onChanged: (value) {
                  setState(() {
                    _greenSlider = value;
                    _appBarColor = Color.fromRGBO(
                        _redSlider.toInt(),
                        _greenSlider.toInt(),
                        _blueSlider.toInt(),
                        _opacitySlider);
                    saveSliderPosition();
                  });
                },
                min: 0,
                max: 255,
                divisions: 255,
                label: "$_greenSlider",
                activeColor: _presetColors["Green"],
              ),
              Slider(
                value: _blueSlider,
                onChanged: (value) {
                  setState(() {
                    _blueSlider = value;
                    _appBarColor = Color.fromRGBO(
                        _redSlider.toInt(),
                        _greenSlider.toInt(),
                        _blueSlider.toInt(),
                        _opacitySlider);
                    saveSliderPosition();
                  });
                },
                min: 0,
                max: 255,
                divisions: 255,
                label: "$_blueSlider",
                activeColor: _presetColors["Blue"],
              ),
              Slider(
                value: _opacitySlider,
                onChanged: (value) {
                  setState(() {
                    _opacitySlider = value;
                    _appBarColor = Color.fromRGBO(
                        _redSlider.toInt(),
                        _greenSlider.toInt(),
                        _blueSlider.toInt(),
                        _opacitySlider);
                    saveSliderPosition();
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
}
