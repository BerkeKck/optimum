import 'dart:io';

class Images {
  static const String _assetPath = 'assets/images/';

  static const String logo = '${_assetPath}logo.png';
  
  static const String wardrobe = 'wardrobe.png';
  static const String combine = 'combine.png';
  static const String home = 'home.png';

   static const List<String> tshirtImages = [
    'assets/photos/Tshirt-1.jpg',
    'assets/photos/Tshirt-2.jpg',
    'assets/photos/Tshirt-3.jpg',
    'assets/photos/Tshirt-4.jpg',
    'assets/photos/Tshirt-5.jpg',
    'assets/photos/Tshirt-6.jpg',
    'assets/photos/Tshirt-7.jpg',
  ];

  static const List<String> pantsImages = [
    'assets/photos/Pants-1.jpg',
    'assets/photos/Pants-2.jpg',
    'assets/photos/Pants-3.jpg',
    'assets/photos/Pants-4.jpg',
  ];

  static const List<String> shoesImages = [
    'assets/photos/Shoes-1.jpg',
    'assets/photos/Shoes-2.jpg',
    'assets/photos/Shoes-3.jpg',
    'assets/photos/Shoes-4.jpg',
    'assets/photos/Shoes-5.jpg',
    'assets/photos/Shoes-6.jpg',
    'assets/photos/Shoes-7.jpg',
    'assets/photos/Shoes-8.jpg',
    'assets/photos/Shoes-9.jpg',
  ];

  static const List<String> dressImages = [
    'assets/photos/Dress-1.jpg',
    'assets/photos/Dress-2.jpg',
    'assets/photos/Dress-3.jpg',
    'assets/photos/Dress-4.jpg',
  ];

  static const List<String> skirtsImages = [
    'assets/photos/Skirts-1.jpg',
    'assets/photos/Skirts-2.jpg',
  ];

  static void generateTshirtImagePaths() {
    final directory = Directory('assets/photos/tshirt/');
    final files = directory.listSync();

    for (final file in files) {
      if (file is File && file.path.endsWith('.jpg')) {
        tshirtImages.add(file.path);
      }
    }
  }
}


