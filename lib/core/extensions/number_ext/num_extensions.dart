double? safeParseDouble(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  return double.tryParse(value.trim());
}

int? safeParseInt(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  return int.tryParse(value.trim());
}
