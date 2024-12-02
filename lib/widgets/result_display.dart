import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final String result;

  const ResultDisplay({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        result,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
