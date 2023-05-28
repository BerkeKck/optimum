import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:optimum/src/constant/image.dart';
import '../widgets/navigation_bar.dart' as optNavigation;


class WardrobePage extends StatefulWidget {
  const WardrobePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        preferredSize: Size.fromHeight(10.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 156, 156, 156),
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
                generatePhotoPaths(); // Regenerate photo paths when category changes
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: IconButton(
        icon: const Icon(Icons.camera),
        onPressed: () {
          // telefonda kamera uygulamasını açma işlevi
        },
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of photos per row
          crossAxisSpacing: 8.0, // Adjust the horizontal spacing between photos
          mainAxisSpacing: 8.0, // Adjust the vertical spacing between photos
          childAspectRatio: 0.8, // Adjust the aspect ratio for photo size
        ),
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          String photoPath = _photos[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), // Apply border radius for smoother edges
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
