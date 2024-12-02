class ConversionUtils {
  static Map<String, List<String>> getCategories() {
    return {
      "Length": ["Meters", "Kilometers", "Miles"],
      "Weight": ["Kilograms", "Grams", "Pounds"],
      "Temperature": ["Celsius", "Fahrenheit", "Kelvin"],
    };
  }

  static double? performConversion(
      String category, double value, String fromUnit, String toUnit) {
    if (category == "Length") {
      if (fromUnit == "Meters" && toUnit == "Kilometers") return value / 1000;
      if (fromUnit == "Kilometers" && toUnit == "Meters") return value * 1000;
      if (fromUnit == "Miles" && toUnit == "Kilometers") return value * 1.60934;
      if (fromUnit == "Kilometers" && toUnit == "Miles") return value / 1.60934;
    } else if (category == "Weight") {
      if (fromUnit == "Kilograms" && toUnit == "Grams") return value * 1000;
      if (fromUnit == "Grams" && toUnit == "Kilograms") return value / 1000;
      if (fromUnit == "Kilograms" && toUnit == "Pounds") return value * 2.20462;
      if (fromUnit == "Pounds" && toUnit == "Kilograms") return value / 2.20462;
    } else if (category == "Temperature") {
      if (fromUnit == "Celsius" && toUnit == "Fahrenheit") {
        return (value * 9 / 5) + 32;
      }
      if (fromUnit == "Fahrenheit" && toUnit == "Celsius") {
        return (value - 32) * 5 / 9;
      }
      if (fromUnit == "Celsius" && toUnit == "Kelvin") return value + 273.15;
      if (fromUnit == "Kelvin" && toUnit == "Celsius") return value - 273.15;
    }
    return null;
  }
}
