import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/booking/screens/view_media_asset/view_media_asset.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class ViewAssets extends StatefulWidget {
  const ViewAssets({super.key});

  @override
  _ViewAssetsState createState() => _ViewAssetsState();
}

class _ViewAssetsState extends State<ViewAssets> {
  int _selectedCategoryIndex = 0;

  final List<String> images = [
    MedicaImages.user1,
    MedicaImages.user2,
    MedicaImages.user3,
    MedicaImages.user1,
    MedicaImages.user2,
    MedicaImages.user3,
    MedicaImages.user1,
    MedicaImages.user2,
    MedicaImages.user3,
    MedicaImages.user1,
    MedicaImages.user2,
    MedicaImages.user3,
    MedicaImages.user1,
    MedicaImages.user2,
    MedicaImages.user3,
    MedicaImages.user1,
    MedicaImages.user2,
    MedicaImages.user3,
    MedicaImages.user1,
    MedicaImages.user2,
    MedicaImages.user3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Grid'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: MedicaSizes.lg,
              right: MedicaSizes.lg,
              bottom: MedicaSizes.lg,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 40.0,
                color: MedicaColors.accent.withOpacity(0.3),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: _selectedCategoryIndex == 0
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.primary)
                              : MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                          foregroundColor: _selectedCategoryIndex == 0
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.white)
                              : MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedCategoryIndex = 0;
                          });
                        },
                        child: const Text("Media"),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: _selectedCategoryIndex == 1
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.primary)
                              : MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                          foregroundColor: _selectedCategoryIndex == 1
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.white)
                              : MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedCategoryIndex = 1;
                          });
                        },
                        child: const Text("Files"),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: _selectedCategoryIndex == 2
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.primary)
                              : MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                          foregroundColor: _selectedCategoryIndex == 2
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.white)
                              : MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedCategoryIndex = 2;
                          });
                        },
                        child: const Text("Links"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => ViewMediaAsset(
                            image: Image(
                          image: AssetImage(images[index]),
                        )));
                  },
                  child: Image(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
