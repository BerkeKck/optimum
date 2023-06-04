import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:optimum/app_styles.dart';

class CombinePage extends StatefulWidget {
  final String weatherCondition;

  CombinePage({required this.weatherCondition});

  @override
  _CombinePageState createState() => _CombinePageState();
}

class _CombinePageState extends State<CombinePage> {
  List<String> topsCategories = ['hoodie', 'top', 'coat', 'dress', 'tshirt'];
  List<String> bottomsCategories = ['pants', 'skirt'];
  List<String> shoesCategories = ['boot', 'heel', 'casual'];
  List<String> accessoriesCategories = ['handbags'];
  List<String> alternativeTopCategories =['top','tshirt'];

  List<String> topsPaths = [];
  List<String> bottomsPaths = [];
  List<String> shoesPaths = [];
  List<String> accessoriesPaths = [];
  List<String> alternativeTopPaths = [];

  String? selectedTop;
  String? selectedBottom;
  String? selectedShoe;
  String? selectedAccessory;
  String? selectedAlternativeTop;

  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    loadPhotos();
  }

  Future<void> loadPhotos() async {
    final List<Future<void>> futures = [];

  if (widget.weatherCondition.contains('clear')) {
    topsCategories.remove('coat');
  }
     // Load Tops Photos
  if (widget.weatherCondition.contains('rain')) {
    topsCategories = ['hoodie', 'top', 'coat'];
  } else if (widget.weatherCondition.contains('snow')) {
    topsCategories = ['hoodie', 'coat'];
  } else if (widget.weatherCondition.contains('clear')) {
    topsCategories = ['dress', 'top'];
  } else if (widget.weatherCondition.contains('cloud')) {
    topsCategories = ['top', 'dress', 'hoodie', 'tshirt'];
  }

    for (var category in topsCategories) {
      List<String> categoryPaths = generatePaths(category);
      topsPaths.addAll(categoryPaths);
      futures.addAll(categoryPaths.map(rootBundle.load));
    }

    // Load Bottoms Photos
    if (widget.weatherCondition.contains('clear')) {
      bottomsCategories = topsCategories.contains('dress') ? [] : ['skirt'];
    } else {
      bottomsCategories = ['pants', 'skirt'];
    }

    for (var category in bottomsCategories) {
      List<String> categoryPaths = generatePaths(category);
      bottomsPaths.addAll(categoryPaths);
      futures.addAll(categoryPaths.map(rootBundle.load));
    }

    // Load Shoes Photos
    if (widget.weatherCondition.contains('rain') || widget.weatherCondition.contains('snow')) {
      shoesCategories = ['boot'];
    } else {
      shoesCategories = ['boot', 'heel', 'casual'];
    }

    for (var category in shoesCategories) {
      List<String> categoryPaths = generatePaths(category);
      shoesPaths.addAll(categoryPaths);
      futures.addAll(categoryPaths.map(rootBundle.load));
    }

    // Load Accessories Photos
    accessoriesCategories = ['handbags'];

    for (var category in accessoriesCategories) {
      List<String> categoryPaths = generatePaths(category);
      accessoriesPaths.addAll(categoryPaths);
      futures.addAll(categoryPaths.map(rootBundle.load));
    }
    //Load alternativeTop Photos
    for (var category in alternativeTopCategories) {
      List<String> categoryPaths = generatePaths(category);
      alternativeTopPaths.addAll(categoryPaths);
      futures.addAll(categoryPaths.map(rootBundle.load));
    }

    await Future.wait<void>(futures);

    if (mounted) {
      setState(() {});
    }
  }

  List<String> generatePaths(String category) {
    List<String> assetPaths = [];
    String folderName = category.toLowerCase();
    int count = 1;
    int maxCount = 5; // You can adjust the maxCount value here

    while (count <= maxCount) {
      String assetPath = 'photos/$folderName/$category-$count.jpg';
      try {
        rootBundle.load(assetPath);
        assetPaths.add(assetPath);
        count++;
      } catch (e) {
        break;
      }
    }

    return assetPaths;
  }

 void generateCombination() {
  final random = Random();

  selectedTop = topsPaths.isNotEmpty ? topsPaths[random.nextInt(topsPaths.length)] : null;
  selectedBottom = bottomsPaths.isNotEmpty ? bottomsPaths[random.nextInt(bottomsPaths.length)] : null;
  selectedShoe = shoesPaths.isNotEmpty ? shoesPaths[random.nextInt(shoesPaths.length)] : null;
  selectedAccessory = accessoriesPaths.isNotEmpty ? accessoriesPaths[random.nextInt(accessoriesPaths.length)] : null;
  selectedAlternativeTop = alternativeTopPaths.isNotEmpty ? alternativeTopPaths[random.nextInt(alternativeTopPaths.length)] : null;

  if (selectedTop != null && selectedTop!.contains('dress')) {
    selectedBottom = null;
  }

  if (selectedTop == 'dress') {
    shoesPaths = generatePaths('heel');
  } else {
    shoesPaths = generatePaths('boot');
    shoesPaths.addAll(generatePaths('casual'));
  }

  setState(() {});
}

  void saveCombination() async {
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      if (result['isSuccess']) {
        // Image saved successfully
        // You can show a success message or perform any desired action
      } else {
        // Image save failed
        // You can show an error message or perform any desired action
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color fieldColor = Color(0xFF4a707a);

    bool showAlternativeTop = selectedTop != null && selectedTop!.contains('coat');

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: RepaintBoundary(
            key: globalKey,
            child: Frame(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: fieldColor,
                  width: 15.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Your outfit is ready with Optimum !',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(),
                              child: selectedTop != null ? Image.asset(selectedTop!) : Container(),
                            ),
                            const SizedBox(),
                            if (selectedBottom != null)
                              Container(
                                width: 120,
                                height: 120,
                                child: Image.asset(selectedBottom!),
                              ),
                            const SizedBox(),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: const BoxDecoration(),
                              child: selectedShoe != null ? Image.asset(selectedShoe!) : Container(),
                            ),
                          ],
                        ),
                        const SizedBox(),
                        Column(
                          children: [
                            if (showAlternativeTop)
                              Container(
                                width: 120,
                                height: 120,
                                child: selectedAlternativeTop != null ? Image.asset(selectedAlternativeTop!) : Container(),
                              ),
                            Container(
                              width: 70,
                              height: 70,
                              child: selectedAccessory != null ? Image.asset(selectedAccessory!) : Container(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: saveCombination,
            child: const Icon(Icons.save),
            heroTag: null, 
            mini: true, 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: fieldColor,
          ),
          FloatingActionButton(
            onPressed: generateCombination,
            child: const Icon(Icons.refresh),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: fieldColor,
          ),
          FloatingActionButton(
            onPressed: null,
            child: const Icon(Icons.share),
            heroTag: null, 
            mini: true, 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: fieldColor,
          ),
        ],
      ),
    );
  }
}

class Frame extends StatelessWidget {
  final Widget child;
  final BoxDecoration decoration;

  Frame({required this.child, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: child,
    );
  }
}