class Photos {
  static const String _assetPath = '/photos/';


  static List<String> tshirtPhotos = generateAssetPaths('Tshirt', 5);
  static List<String> pantsPhotos = generateAssetPaths('Pants', 8);
  static List<String> shoesPhotos = generateAssetPaths('Shoes', 8);
  static List<String> dressPhotos = generateAssetPaths('Dress', 6);
  static List<String> skirtsPhotos = generateAssetPaths('Skirt', 8);
  static List<String> handbagPhotos = generateAssetPaths('Handbags', 9);
  static List<String> topPhotos = generateAssetPaths('Top', 10);
  static List<String> coatPhotos = generateAssetPaths('Coat', 3); 
  static List<String> hoodiePhotos = generateAssetPaths('Hoodie', 6); 

  static List<String> allPhotos = [
    ...tshirtPhotos,
    ...pantsPhotos,
    ...shoesPhotos,
    ...dressPhotos,
    ...skirtsPhotos,
    ...handbagPhotos,
    ...topPhotos,
    ...coatPhotos,
    ...hoodiePhotos,

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
