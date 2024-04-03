import 'package:flutter/material.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/doctor/widgets/doctor_horizontal_card.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';
import 'package:medica_consult/utils/logging/logger.dart';

class SearchResults extends StatefulWidget {
  final Key? key;
  final String? inputText;

  const SearchResults({
    this.key,
    required this.inputText,
  }) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<String> selectedCategories = [];
  int? _selectedRatingIndex;
  int? _selectedDistanceIndex;

  void _filterModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          height: MedicaHelperFunctions.screenHeight() * .60,
          child: Column(
            children: [
              Text(
                "Filter",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width, // Fixed width
                padding: const EdgeInsets.only(
                  left: MedicaSizes.lg,
                  right: MedicaSizes.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Speciality",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: doctorCategories.asMap().entries.map((entry) {
                         // final index = entry.key;
                          final category = entry.value["name"];
                          return TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  return selectedCategories.contains(category)
                                      ? MedicaColors.primary
                                      : Colors.transparent;
                                },
                              ),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  return selectedCategories.contains(category)
                                      ? MedicaColors.white
                                      : MedicaColors.black;
                                },
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (selectedCategories.contains(category)) {
                                  selectedCategories.remove(category);
                                } else {
                                  selectedCategories.add(category);
                                }
                              });
                              MedicaLoggerHelper.info(
                                  "Selected categories: $selectedCategories");
                            },
                            child: Text(category),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Rating",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ratings.asMap().entries.map((entry) {
                          final index = entry.key;
                          final rating = entry.value;
                          return TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  return index == _selectedRatingIndex
                                      ? MedicaColors.primary
                                      : Colors.transparent;
                                },
                              ),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  return index == _selectedRatingIndex
                                      ? MedicaColors.white
                                      : MedicaColors.black;
                                },
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedRatingIndex = index;
                              });
                              MedicaLoggerHelper.info(
                                  "Selected rating: $_selectedRatingIndex");
                            },
                            child: Text(rating.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Distance",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: distances.asMap().entries.map((entry) {
                          final index = entry.key;
                          final distance = entry.value;
                          return TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  return index == _selectedDistanceIndex
                                      ? MedicaColors.primary
                                      : Colors.transparent;
                                },
                              ),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  return index == _selectedDistanceIndex
                                      ? MedicaColors.white
                                      : MedicaColors.black;
                                },
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedDistanceIndex = index;
                              });
                              MedicaLoggerHelper.info(
                                  "Selected distance: $_selectedDistanceIndex");
                            },
                            child: Text("${distance}m away"),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 120,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MedicaColors.grey), // Set background color
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  MedicaColors
                                      .black), // Set foreground (text) color
                            ),
                            child: const Text("Cancel"),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MedicaColors.primary), // Set background color
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  MedicaColors
                                      .white), // Set foreground (text) color
                            ),
                            child: const Text("Apply"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${doctorData.asMap().entries.where((entry) {
                  final name = entry.value['name'] as String;
                  return name.contains(widget.inputText ?? '');
                }).length} found',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedCategories = [];
                  });
                  _filterModalBottomSheet(context);
                },
                icon: const Icon(
                  Icons.filter_alt,
                  color: MedicaColors.primary,
                ),
              ),
            ],
          ),
          ...doctorData.asMap().entries.where((entry) {
            final name = entry.value['name'] as String;
            return name.contains(widget.inputText ?? '');
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
          }),
        ],
      ),
    );
  }
}
