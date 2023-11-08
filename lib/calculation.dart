class Conversion {
  static String fromFahrenheit(double f) {
    var k = 5 / 9 * (f - 32) + 273.15; //! ==== K = 5/9(F - 32) + 273.15
    var c = (f - 32) / 1.80; //!=============== C = (F - 32)/1.80
    return "${k.toStringAsFixed(2)} K\n${c.toStringAsFixed(2)}°C";
  }

  static String fromCelsius(double c) {
    var f = (9 / 5) * c + 32; //! ==== F = 9/5(C) + 32 or F = 1.80(C) + 32
    var k = c + 273; //! ============= K = C + 273 (or K = C + 271.15 to be more precise)
    return "${f.toStringAsFixed(2)}°F\n${k.toStringAsFixed(2)} K";
  }

  static String fromKelvin(double k) {
    var c = k - 273.15; //! ============== C = K - 273 (C = K - 273.15 if you want to be more precise)
    var f = 1.8 * (k - 273) + 32; //! ==== F = 9/5(K - 273) + 32 or F = 1.8(K - 273) + 32

    return "${c.toStringAsFixed(2)}°C\n${f.toStringAsFixed(2)}°F";
  }
}
