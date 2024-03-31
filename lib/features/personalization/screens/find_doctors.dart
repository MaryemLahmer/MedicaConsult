import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/personalization/screens/widgets/doctor_horizontal_card.dart';
import 'package:medica_consult/features/personalization/screens/widgets/loading_indicator.dart';
import 'package:medica_consult/features/personalization/screens/widgets/search_results.dart';
import 'package:medica_consult/features/personalization/screens/widgets/clickable_image_text.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/logging/logger.dart';

class FindDoctorsPage extends StatefulWidget {
  const FindDoctorsPage({Key? key}) : super(key: key);

  @override
  _FindDoctorsPageState createState() => _FindDoctorsPageState();
}

class _FindDoctorsPageState extends State<FindDoctorsPage> {
  String? inputText;
  bool isLoading = false;
  bool showSearchResult = false;

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
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Center(child: DotsCirclingProgressIndicator()),
                      ],
                    )
                  : showSearchResult
                      ? SearchResults(inputText: inputText)
                      : const FindDoctorsMainScreen()
            ],
          ),
        ),
      ),
    );
  }
}

class FindDoctorsMainScreen extends StatefulWidget {
  const FindDoctorsMainScreen({super.key});

  @override
  State<FindDoctorsMainScreen> createState() => _FindDoctorsMainScreenState();
}

class _FindDoctorsMainScreenState extends State<FindDoctorsMainScreen> {
  String? tappedCategory;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Category", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: MedicaSizes.spaceBetweenItems,
        ),
        SizedBox(
          height: calculateGridViewHeight(doctorCategories.length),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemCount: doctorCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: ClickableImageText(
                  image: MedicaImages.applePay,
                  title: doctorCategories.elementAt(index)["name"],
                  onTap: () {
                    setState(() {
                      tappedCategory =
                          doctorCategories.elementAt(index)["name"];
                    });
                  },
                  isSelected: tappedCategory ==
                      doctorCategories.elementAt(index)["name"],
                ),
              );
            },
          ),
        ),
        tappedCategory == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recommended Doctors",
                      style: Theme.of(context).textTheme.bodyLarge),
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
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: doctorData.take(6).map((data) {
                        return ClickableImageText(
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
                  children: doctorData.asMap().entries.map((entry) {
                    final index = entry.key;
                    final data = entry.value;
                    // Filter the doctorData based on category
                    if (data['speciality'] == tappedCategory) {
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
                    } else {
                      // Return an empty container if the category does not match
                      return Container();
                    }
                  }).toList(),
                ),
              ),
      ],
    );
  }
}
