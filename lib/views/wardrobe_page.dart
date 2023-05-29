import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:optimum/src/constant/image.dart';

class WardrobePage extends StatefulWidget {
  const WardrobePage({Key? key}) : super(key: key);

  @override
  _WardrobePageState createState() => _WardrobePageState();
}

class _WardrobePageState extends State<WardrobePage> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    'All',
    'Tshirt',
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
        case 'Tshirt':
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 122, 122, 122),
          automaticallyImplyLeading: false,
          title: Text(
            'My Wardrobe',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 142, 142, 142),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
              child: Container(
                height: 25.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index == _selectedCategoryIndex;
                    String categoryName = _categories[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                          generatePhotoPaths();
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : null,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          categoryName,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: _categories.length,
                controller: PageController(initialPage: _selectedCategoryIndex),
                onPageChanged: (index) {
                  setState(() {
                    _selectedCategoryIndex = index;
                    generatePhotoPaths();
                  });
                },
                itemBuilder: (context, index) {
                  String categoryName = _categories[index];

                  return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: _photos.length,
                    itemBuilder: (context, index) {
                      String photoPath = _photos[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(photoPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: FloatingActionButton(
          onPressed: () {
            // Add button action
          },
          backgroundColor: Colors.grey,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}