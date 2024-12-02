import 'package:flutter/material.dart';
import '../conversion_utils.dart';
import '../widgets/result_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "Length";
  String? fromUnit;
  String? toUnit;
  String result = "";
  final TextEditingController inputController = TextEditingController();

  final Map<String, List<String>> categories = ConversionUtils.getCategories();

  void convert() {
    if (inputController.text.isEmpty || fromUnit == null || toUnit == null) {
      setState(() {
        result = " Please fill in all fields!";
      });
      return;
    }

    double input = double.tryParse(inputController.text) ?? 0;
    double? conversionResult =
    ConversionUtils.performConversion(selectedCategory, input, fromUnit!, toUnit!);

    if (conversionResult == null) {
      setState(() {
        result = " Invalid conversion!";
      });
      return;
    }

    setState(() {
      result = "$input $fromUnit = ${conversionResult.toStringAsFixed(2)} $toUnit";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              items: categories.keys.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                  fromUnit = null;
                  toUnit = null;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: fromUnit,
                    hint: const Text("From Unit"),
                    isExpanded: true,
                    items: categories[selectedCategory]!.map((unit) {
                      return DropdownMenuItem(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        fromUnit = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: toUnit,
                    hint: const Text("To Unit"),
                    isExpanded: true,
                    items: categories[selectedCategory]!.map((unit) {
                      return DropdownMenuItem(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        toUnit = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter value',
                prefixIcon: const Icon(Icons.input),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: convert,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            ResultDisplay(result: result),
          ],
        ),
      ),
    );
  }
}
