T as<T>(value) {
  if (value is T) return value;
  if ('' is T) return value.toString() as T;
  if (0 is T) return (int.tryParse(value.toString()) ?? 0) as T;
  if (0.0 is T) return (double.tryParse(value.toString()) ?? 0.0) as T;
  if (true is T) return (value is bool ? value : (value == 'true')) as T;
  throw Exception('$value is not $T');
  }