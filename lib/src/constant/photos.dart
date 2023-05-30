class Photos {
  static const String _assetPath = '/photos/';


  static List<String> tshirtPhotos = generateAssetPaths('Tshirt', 7);
  static List<String> pantsPhotos = generateAssetPaths('Pants', 4);
  static List<String> shoesPhotos = generateAssetPaths('Shoes', 9);
  static List<String> dressPhotos = generateAssetPaths('Dress', 4);
  static List<String> skirtsPhotos = generateAssetPaths('Skirt', 10);
  static List<String> handbagPhotos = generateAssetPaths('Handbags', 9);
  static List<String> topPhotos = generateAssetPaths('Top', 6);

  static List<String> allPhotos = [
    ...tshirtPhotos,
    ...pantsPhotos,
    ...shoesPhotos,
    ...dressPhotos,
    ...skirtsPhotos,
    ...handbagPhotos,
    ...topPhotos,
  ];

  static List<String> generateAssetPaths(String category, int count) {
    List<String> assetPaths = [];
    String folderName = category.toLowerCase();
    for (int i = 1; i <= count; i++) {
      String assetPath = '$_assetPath$folderName/$category-$i.jpg';
      assetPaths.add(assetPath);
    }
    return assetPaths;
  }
}
