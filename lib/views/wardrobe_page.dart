import 'package:flutter/material.dart';
import 'package:optimum/src/constant/photos.dart';

class WardrobePage extends StatefulWidget {
  const WardrobePage({Key? key}) : super(key: key);

  @override
  _WardrobePageState createState() => _WardrobePageState();
}

class _WardrobePageState extends State<WardrobePage> {
  int _selectedCategoryIndex = 0;
  List<String> _categories = [
    'All',
    'Tshirt',
    'Tops',
    'Coat',
    'Hoodie',
    'Pants',
    'Shoes',
    'Skirt',
    'Dress',
    'Handbags',
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
        ...Photos.tshirtPhotos,
        ...Photos.pantsPhotos,
        ...Photos.shoesPhotos,
        ...Photos.dressPhotos,
        ...Photos.skirtsPhotos,
        ...Photos.handbagPhotos,
        ...Photos.coatPhotos,
        ...Photos.hoodiePhotos,
      ];
    } else {
      // Filter photos based on selected category
      String selectedCategory = _categories[_selectedCategoryIndex];
      switch (selectedCategory) {
        case 'Tshirt':
          _photos = Photos.tshirtPhotos;
          break;
        case 'Pants':
          _photos = Photos.pantsPhotos;
          break;
        case 'Coat':
          _photos = Photos.coatPhotos;
          break;
        case 'Shoes':
          _photos = Photos.shoesPhotos;
          break;
        case 'Dress':
          _photos = Photos.dressPhotos;
          break;
        case 'Handbags':
          _photos = Photos.handbagPhotos;
          break;
        case 'Skirt':
          _photos = Photos.skirtsPhotos;
          break;
        case 'Hoodie':
          _photos = Photos.hoodiePhotos;
          break;
        case 'Tops':
          _photos = Photos.topPhotos;
          break;
        default:
          _photos = [];
      }
    }
  }

  void _showAddOptions() {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Open Camera'),
              onTap: () {
                // Handle open camera option
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Select from Gallery'),
              onTap: () {
                // Handle select from gallery option
              },
            ),
          ],
        ),
      );
    },
  );
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
        margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
        child: FloatingActionButton(
          onPressed: _showAddOptions,
          backgroundColor: Colors.grey,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
