import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, double>> getSliderData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return {
    "redSlider": prefs.getDouble("redSlider") ?? 0,
    "blueSlider": prefs.getDouble("blueSlider") ?? 0,
    "greenSlider": prefs.getDouble("greenSlider") ?? 0,
    "opacitySlider": prefs.getDouble("opacitySlider") ?? 1,
  };
}