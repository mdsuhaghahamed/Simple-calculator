
class CalculatorLogic {
  String display = "0";
  double _num1 = 0;
  String _operator = "";

  void input(String value) {
    if (value == "AC") {
      _clear();
    } else if (_isOperator(value)) {
      _setOperator(value);
    } else if (value == "=") {
      _calculate();
    } else {
      _appendNumber(value);
    }
  }

  void _clear() {
    display = "0";
    _num1 = 0;
    _operator = "";
  }

  void _setOperator(String op) {
    _num1 = double.parse(display);
    _operator = op;
    display = "0";
  }

  void _calculate() {
    double num2 = double.parse(display);
    double result = 0;

    switch (_operator) {
      case "+":
        result = _num1 + num2;
        break;
      case "-":
        result = _num1 - num2;
        break;
      case "×":
        result = _num1 * num2;
        break;
      case "÷":
        result = _num1 / num2;
        break;
    }

    display = result.toString();
  }

  void _appendNumber(String num) {
    if (display == "0") {
      display = num;
    } else {
      display += num;
    }
  }

  bool _isOperator(String v) {
    return v == "+" || v == "-" || v == "×" || v == "÷";
  }
}