import 'dart:math';

const int PRECISION = 1;
const double OVERWEIGHT_BMI_THRESHOLD = 25.0;
const double UNDERWEIGHT_BMI_THRESHOLD = 18.5;

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(PRECISION);
  }

  String getResult() {
    if (_bmi >= OVERWEIGHT_BMI_THRESHOLD) {
      return 'Overweight';
    } else if (_bmi < UNDERWEIGHT_BMI_THRESHOLD) {
      return 'Underweight';
    }
    return 'Normal';
  }

  String getInterpretation() {
    if (_bmi >= OVERWEIGHT_BMI_THRESHOLD) {
      return 'Ypu have a higher than normal body weight. Try to exercise more, and eat less.';
    } else if (_bmi < UNDERWEIGHT_BMI_THRESHOLD) {
      return 'You have a lower than normal body weight. Try to eat more.';
    }
    return 'You have a normal body weight. Good job!';
  }
}
