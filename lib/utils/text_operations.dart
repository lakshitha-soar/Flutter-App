extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';

  String get paraInCaps => this.split(".").map((str) => str.inCaps).join(".");

  String get inCapsAll => this.split(" ").map((str) => str.inCaps).join(" ");
}
