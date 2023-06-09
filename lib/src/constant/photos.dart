import 'package:flutter/services.dart' show rootBundle;

class Photos {
  static  List<String> category = [
    'All',
    'Tshirt',
    'Top',
    'Coat',
    'Hoodie',
    'Pants',
    'Shoes',
    'Skirt',
    'Dress',
    'Handbags',
    'Heel',
    'Boot',
    'Casual',
    
  ];

  static const String _assetPath = '/photos/';
 
  //tops
  static List<String> topPhotos = generateAssetPaths('Top', 10);
  static List<String> coatPhotos = generateAssetPaths('Coat', 3); 
  static List<String> hoodiePhotos = generateAssetPaths('Hoodie', 6);
  static List<String> tshirtPhotos = generateAssetPaths('Tshirt', 5);
  static List<String> dressPhotos = generateAssetPaths('Dress', 6); 
  // bottoms
  static List<String> skirtsPhotos = generateAssetPaths('Skirt', 8);
  static List<String> pantsPhotos = generateAssetPaths('Pants', 8);
  //shoes
  static List<String> heelPhotos = generateAssetPaths('Heel', 3);  
  static List<String> bootPhotos = generateAssetPaths('Boot', 3); 
  static List<String> casualPhotos = generateAssetPaths('Casual', 3);
   //accesories
   static List<String> handbagPhotos = generateAssetPaths('Handbags', 9);

  static List<String> allPhotos = [ //ALL
    ...bottomsPhotos,
    ...topsPhotos,
    ...shoesPhotos, 
    ...accessoriesPhotos,
  ];
  
  static List<String> topsPhotos = [  //TOPS
    ...topPhotos,
    ...coatPhotos,
    ...hoodiePhotos,
    ...tshirtPhotos,
    ...dressPhotos,
  ];

  static List<String> bottomsPhotos = [  //BOTTOM
    ...skirtsPhotos,
    ...pantsPhotos,
  ];

  static List<String> shoesPhotos = [   //SHOES
    ...heelPhotos,
    ...bootPhotos,
    ...casualPhotos,
  ];
  
  static List<String> accessoriesPhotos = [   //ACCESORIES
    ...handbagPhotos,
  ];
  static List<String> alternativeTopPhotos = [   //ALTERNATIVETOPS
    ...tshirtPhotos,
    ...topPhotos,
  ];
  
 static List<String> generateAssetPaths(String category, int maxCount) {
  List<String> assetPaths = [];
  String folderName = category.toLowerCase();
  int count = 1;
  while (true) {
    String assetPath = '$_assetPath$folderName/$category-$count.jpg';
    try {
      rootBundle.load(assetPath);
      assetPaths.add(assetPath);
      count++;
      if (count > maxCount) break;
    } catch (e) {
      break;
    }
  }
  return assetPaths;
}
}

//carousel resimleri
List<String> getWeatherImages(String condition) {
    if (condition.contains('rain')) {
      return [
        '/photos/rain/rain-1.jpg',
        '/photos/rain/rain-2.jpg',
        '/photos/rain/rain-3.jpg',
        '/photos/rain/rain-4.jpg',
        '/photos/rain/rain-5.jpg',
        '/photos/rain/rain-6.jpg',
        '/photos/rain/rain-7.jpg',
      ];
    } else if (condition.contains('cloud')) {
      return [
        '/photos/cloud/cloud-1.jpg',
        '/photos/cloud/cloud-2.jpg',
        '/photos/cloud/cloud-3.jpg',
        '/photos/cloud/cloud-4.jpg',
        '/photos/cloud/cloud-5.jpg',
        '/photos/cloud/cloud-6.jpg',
        '/photos/cloud/cloud-7.jpg',  
      
      ];
    } else if (condition.contains('sun') || condition.contains('clear')) {
      return [
        '/photos/clear/clear-1.jpg',
        '/photos/clear/clear-2.jpg',
        '/photos/clear/clear-3.jpg',
        '/photos/clear/clear-4.jpg',
        '/photos/clear/clear-5.jpg',
        '/photos/clear/clear-6.jpg',
        '/photos/clear/clear-7.jpg',
      ];
    } else if (condition.contains('snow')) {
      return [
        '/photos/snow/snow-1.jpg',
        '/photos/snow/snow-2.jpg',
        '/photos/snow/snow-3.jpg',
        '/photos/snow/snow-4.jpg',
        '/photos/snow/snow-5.jpg',
        '/photos/snow/snow-6.jpg',
        '/photos/snow/snow-7.jpg',
      ];
    } else {
      return [];
    }
}