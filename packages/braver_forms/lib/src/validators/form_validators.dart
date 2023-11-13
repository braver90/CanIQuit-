abstract class FormValidators {
  static String? Function(String?) isNotNull({String? message}) {
    return (String? value) {
      if (value != null && value.isEmpty || value == null) {
        return message ?? "Questo campo è obbligatorio";
      }
      return null;
    };
  }

  static String? Function(String?) greaterThan(num limit, String? message) {
    return (String? value) {
      if (value != null && value.isNotEmpty) {
        try {
          double parsedValue = double.parse(value);
          if (parsedValue > limit) return null;
          return message ?? 'Il valore deve essere maggiore di $limit';
        } catch (e) {
          return "Il valore inserito non è un numero";
        }
      }
      return null;
    };
  }

  static String? Function(String?) lesserThan(num limit, String? message) {
    return (String? value) {
      if (value != null && value.isNotEmpty) {
        try {
          double parsedValue = double.parse(value);
          if (parsedValue < limit) return null;
          return message ?? 'Il valore deve essere maggiore di $limit';
        } catch (e) {
          return "Il valore inserito non è un numero";
        }
      }
      return null;
    };
  }
}
