import 'dart:math';

class brain {
  brain({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;

  String calcbmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getresult() {
    if (_bmi > 25)
      return "overwight";
    else if (_bmi > 18.5)
      return "normal";
    else
      return "underwight";
  }

  String advice() {
    if (_bmi > 25)
      return "bhai your weight is to much ,try to excercise more";
    else if (_bmi > 18.5)
      return "bhai you have a normal body weight nice ,good job";
    else
      return " bhai your body wight is lower than normlw body  weight. you can eat a bit more ";
  }
}
