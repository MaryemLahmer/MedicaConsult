import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/images/image_text.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/personalization/screens/widgets/doctor_horizontal_card.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';
import 'package:medica_consult/utils/logging/logger.dart';

class FindDoctorsPage extends StatefulWidget {
  const FindDoctorsPage({Key? key}) : super(key: key);

  @override
  _FindDoctorsPageState createState() => _FindDoctorsPageState();
}

class _FindDoctorsPageState extends State<FindDoctorsPage> {
  String? tappedCategory;
  String? inputText;
  bool isLoading = false;
  bool showSearchResult = false;

  double calculateGridViewHeight(int itemCount) {
    int crossAxisCount = 4;
    double mainAxisSpacing = MedicaSizes.lg;
    double itemHeight = 92;
    double crossAxisSpacing = 0;

    double totalMainSpacing =
        mainAxisSpacing * (itemCount / crossAxisCount - 1);
    double totalCrossSpacing =
        crossAxisSpacing * ((itemCount / crossAxisCount).floor() - 1);
    double totalItemHeight = itemHeight * (itemCount / crossAxisCount).ceil();

    return totalMainSpacing + totalCrossSpacing + totalItemHeight;
  }

  void handleSubmit(String text) {
    setState(() {
      showSearchResult = true;
      isLoading = true;
      inputText = text;
    });

    // Simulating loading for 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: MedicaSizes.md),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              showSearchResult = false;
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Center(
          child: Text('Find Doctors'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: MedicaSizes.defaultSpace, right: MedicaSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MedicaColors.lightGrey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    borderSide: const BorderSide(color: MedicaColors.accent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    borderSide:
                        const BorderSide(color: MedicaColors.borderPrimary),
                  ),
                  hintText: 'Find a doctor',
                  hintStyle: const TextStyle(
                    color: MedicaColors.textSecondary,
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                cursorColor: MedicaColors.black,
                onSubmitted: (value) {
                  handleSubmit(value);
                },
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : showSearchResult
                      ? SingleChildScrollView(
                          child: Column(
                            children: doctorData.asMap().entries.where((entry) {
                              final name = entry.value['name'] as String;
                              return name.contains(inputText ??
                                  ''); // Use an empty string as default if inputText is null
                            }).map((entry) {
                              final index = entry.key;
                              final data = entry.value;
                              return DoctorHorziontalCard(
                                profileImage: data['profileImage'],
                                name: data['name'],
                                speciality: data['speciality'],
                                rating: data['rating'],
                                distance: data['distance'],
                                onPressed: () {
                                  MedicaLoggerHelper.info("Index: $index");
                                },
                              );
                            }).toList(),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Category",
                                style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(
                              height: MedicaSizes.spaceBetweenItems,
                            ),
                            SizedBox(
                              height: calculateGridViewHeight(
                                  doctorCategories.length),
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                ),
                                itemCount: doctorCategories.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GridTile(
                                    child: VerticalIconText(
                                      image: MedicaImages.applePay,
                                      title: doctorCategories
                                          .elementAt(index)["name"],
                                      onTap: () {
                                        setState(() {
                                          tappedCategory = doctorCategories
                                              .elementAt(index)["name"];
                                        });
                                      },
                                      isSelected: tappedCategory ==
                                          doctorCategories
                                              .elementAt(index)["name"],
                                    ),
                                  );
                                },
                              ),
                            ),
                            tappedCategory == null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Recommended Doctors",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                      const SizedBox(
                                        height: MedicaSizes.spaceBetweenItems,
                                      ),
                                      DoctorHorziontalCard(
                                          profileImage: MedicaImages.user1,
                                          name: "some guy",
                                          speciality: "tbib",
                                          rating: 4.4,
                                          distance: 600,
                                          onPressed: (() {})),
                                      const SizedBox(
                                        height: MedicaSizes.spaceBetweenItems,
                                      ),
                                      Text("Your Recent Doctors",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                      const SizedBox(
                                        height: MedicaSizes.spaceBetweenItems,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children:
                                              doctorData.take(6).map((data) {
                                            return VerticalIconText(
                                              image: data['profileImage'],
                                              title: data['name'],
                                              onTap: () {
                                                MedicaLoggerHelper.info(
                                                    "Index: ${doctorData.indexOf(data)}");
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  )
                                : SingleChildScrollView(
                                    child: Column(
                                      children: doctorData
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        final index = entry.key;
                                        final data = entry.value;
                                        // Filter the doctorData based on category
                                        if (data['speciality'] ==
                                            tappedCategory) {
                                          return DoctorHorziontalCard(
                                            profileImage: data['profileImage'],
                                            name: data['name'],
                                            speciality: data['speciality'],
                                            rating: data['rating'],
                                            distance: data['distance'],
                                            onPressed: () {
                                              MedicaLoggerHelper.info(
                                                  "Index: $index");
                                            },
                                          );
                                        } else {
                                          // Return an empty container if the category does not match
                                          return Container();
                                        }
                                      }).toList(),
                                    ),
                                  ),
                          ],
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalIconText extends StatelessWidget {
  const VerticalIconText({
    Key? key,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String image, title;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MedicaSizes.spaceBetweenItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(MedicaSizes.sm),
              decoration: BoxDecoration(
                color: isSelected
                    ? MedicaColors.primary // Change color when selected
                    : backgroundColor ??
                        (MedicaHelperFunctions.isDarkMode(context)
                            ? MedicaColors.black
                            : MedicaColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image(
                    image: AssetImage(image),
                    width: MedicaSizes.imageThumbSize,
                    height: MedicaSizes.imageThumbSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 80,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall!.apply(
                        color: isSelected
                            ? MedicaColors
                                .primary // Change text color when selected
                            : MedicaHelperFunctions.isDarkMode(context)
                                ? MedicaColors.white
                                : MedicaColors.black,
                      ),
                  softWrap: false,
                  overflow: TextOverflow.visible,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
