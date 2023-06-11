extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }

    String wordCapitalize() {
      return split(' ').map((s) => s.capitalize()).join(' ');
    }
}
