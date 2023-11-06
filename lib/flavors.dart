enum Flavor {
  dev("dev"),
  stage("stage"),
  prod("prod");

  final String value;

  const Flavor(this.value);

  factory Flavor.fromString(String val) {
    return Flavor.values.firstWhere(
        (element) => element.value.toUpperCase() == val,
        orElse: () => Flavor.dev);
  }
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'flutter_template App DEV';
      case Flavor.stage:
        return 'flutter_template App STAGE';
      case Flavor.prod:
        return 'flutter_template App PROD';
      default:
        return 'title';
    }
  }
}
