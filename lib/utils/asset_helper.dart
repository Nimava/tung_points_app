class AssetHelper {
  static String image(String rawPath) {
    return 'assets/' + rawPath.replaceAll('\\', '/');
  }

  static List<String> imageList(List<dynamic> rawList) {
    return rawList
        .map((e) => image(e.toString()))
        .toList();
  }
}
