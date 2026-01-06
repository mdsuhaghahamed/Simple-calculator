import 'package:flutter/material.dart';
import '../Businesslogic/calculator_logic.dart';
import '../CastomWidget/calc_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic logic = CalculatorLogic();

  void onPress(String value) {
    setState(() {
      logic.input(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                logic.display,
                style: const TextStyle(
                  fontSize: 64,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          _buildRow(["AC", "÷", "×", "-"], Colors.purple[300]!),
          _buildRow(["7", "8", "9", "+"], Colors.grey[300]!),
          _buildRow(["4", "5", "6", "="], Colors.grey[300]!),
          _buildRow(["1", "2", "3", "0"], Colors.grey.shade800),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> texts, Color operatorColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: texts.map((t) {
          Color color = Colors.grey.shade800;
          if ("+-×÷=".contains(t)) color = operatorColor;
          if (t == "AC") color = Colors.grey;

          return SizedBox(
            width: 75,
            height: 75,
            child: CalcButton(
              text: t,
              color: color,
              onTap: () => onPress(t),
            ),
          );
        }).toList(),
      ),
    );
  }
}


