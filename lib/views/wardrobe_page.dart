import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:optimum/src/constant/image.dart';
import '../widgets/navigation_bar.dart' as optNavigation;

class WardrobePage extends StatefulWidget {
  @override
  _WardrobePageState createState() => _WardrobePageState();
}

class _WardrobePageState extends State<WardrobePage> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    'All',
    'TShirt',
    'Pants',
    'Shoes',
    'Skirt',
    'Dress',
  ];

  List<String> _photos = [];

  @override
  void initState() {
    super.initState();
    generatePhotoPaths();
  }

  void generatePhotoPaths() {
    if (_selectedCategoryIndex == 0) {
      // All category selected, show all photos
      _photos = [
        ...Images.tshirtImages,
        ...Images.pantsImages,
        ...Images.shoesImages,
        ...Images.dressImages,
        ...Images.skirtsImages,
      ];
    } else {
      // Filter photos based on selected category
      String selectedCategory = _categories[_selectedCategoryIndex];
      switch (selectedCategory) {
        case 'TShirt':
          _photos = Images.tshirtImages;
          break;
        case 'Pants':
          _photos = Images.pantsImages;
          break;
        case 'Shoes':
          _photos = Images.shoesImages;
          break;
        case 'Dress':
          _photos = Images.dressImages;
          break;
        case 'Skirt':
          _photos = Images.skirtsImages;
          break;
        default:
          _photos = [];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: optNavigation.NavigationBar(), // Custom navigation bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          automaticallyImplyLeading: false, // Hide the default back button
        ),
      ),
      body: Container(
        color: Colors.grey[200], // Set the background color to grey
        child: Column(
          children: [
            Container(
              height: 40.0,
              child: Row(
                children: [
                  _buildCategoryList(),
                  _buildCameraButton(),
                ],
              ),
            ),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          bool isSelected = index == _selectedCategoryIndex;
          String iconName = _categories[index].toLowerCase() + '.svg'; // Generate icon name based on category
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white), // Set border color to white
                color: isSelected ? Colors.white : null, // Set background color to white if selected
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/$iconName', // Load icon from assets/icons folder
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    _categories[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.black : null, // Set text color to black if selected
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCameraButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: IconButton(
        icon: Icon(Icons.camera),
        onPressed: () {
          // Handle camera button tap
          print('Camera button tapped');
        },
      ),
    );
  }

  Widget _buildContent() {
  List<String> filteredPhotos;
  if (_selectedCategoryIndex == 0) {
    // All category selected, show all photos
    filteredPhotos = _photos;
  } else {
    // Filter photos based on selected category
    String selectedCategory = _categories[_selectedCategoryIndex].toLowerCase();
    filteredPhotos = _photos.where((photo) => photo.toLowerCase().contains(selectedCategory)).toList();
  }

  return Expanded(
    child: ListView.builder(
      itemCount: filteredPhotos.length,
      itemBuilder: (context, index) {
        String photoPath = filteredPhotos[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(photoPath),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    ),
  );
}
}