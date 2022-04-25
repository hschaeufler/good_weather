String countryCodeToFlag(String countryCode) {
  final codeUnit = countryCode
      .toUpperCase()
      .split("")
      .map((char) => 127397 + char.codeUnitAt(0));
  return String.fromCharCodes(codeUnit);
}
