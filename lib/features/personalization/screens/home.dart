import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/features/personalization/screens/data.dart';
import 'package:medica_consult/features/personalization/screens/widgets/article_card.dart';
import 'package:medica_consult/features/personalization/screens/widgets/clickacble_icon_button.dart';
import 'package:medica_consult/features/personalization/screens/widgets/doctor_card.dart';
import 'package:medica_consult/features/personalization/screens/widgets/section_header.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/logging/logger.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: MedicaSizes.lg, left: MedicaSizes.lg),
              child: Column(
                children: <Widget>[
                  SafeArea(
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              MedicaSizes.imageThumbSize / 2),
                          child: const Image(
                            width: MedicaSizes.imageThumbSize,
                            height: MedicaSizes.imageThumbSize,
                            image: AssetImage(MedicaImages.user2),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(MedicaSizes.md),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome back,",
                                  style: TextStyle(
                                    color: MedicaColors.textSecondary,
                                    fontSize: MedicaSizes.fontSizeSm,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  "TheFerrMann",
                                  style: TextStyle(
                                    fontSize: MedicaSizes.fontSizeMd,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                              Icons.notifications_outlined), // Bell icon
                          onPressed: () {
                            // Add your onPressed callback here
                            // This will be triggered when the button is pressed
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenSections,
                  ),
                  TextField(
                    style: const TextStyle(fontSize: 12.0, height: 0.9),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MedicaColors.lightGrey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        borderSide:
                            const BorderSide(color: MedicaColors.borderPrimary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36.0),
                        borderSide:
                            const BorderSide(color: MedicaColors.borderPrimary),
                      ),
                      hintText:
                          'Search, doctor, drugs, articles...', // Added search icon in the hint text
                      hintStyle: const TextStyle(
                        color: MedicaColors.textSecondary,
                      ),
                      prefixIcon: const Icon(Icons
                          .search), // Adding the search icon using Icon widget
                    ),
                    cursorColor: MedicaColors.black,
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenSections,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ClickableIconButton(
                        icon: Icons.home_repair_service_outlined,
                        text: 'Doctor',
                        onPressed: () {
                          MedicaLoggerHelper.info(
                              'Notifications button clicked');
                        },
                      ),
                      ClickableIconButton(
                        icon: Icons.local_pharmacy_outlined,
                        text: 'Pharmacy',
                        onPressed: () {
                          MedicaLoggerHelper.info('Messages button clicked');
                        },
                      ),
                      ClickableIconButton(
                        icon: Iconsax.hospital,
                        text: 'Hospital',
                        onPressed: () {
                          MedicaLoggerHelper.info('Settings button clicked');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenSections,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    child: Container(
                      color: const Color(0xFFE8F3F1), // Background color
                      child: Padding(
                        padding: const EdgeInsets.all(MedicaSizes.md),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Medical checks!",
                                    style: TextStyle(
                                        color: MedicaColors.textPrimary,
                                        fontSize: MedicaSizes.fontSizeLg,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: MedicaSizes.sm,
                                  ),
                                  const Text(
                                    "Don’t forget your regular checks.",
                                    style: TextStyle(
                                        color: MedicaColors.textSecondary,
                                        fontSize: 9.0),
                                  ),
                                  const Text(
                                    "Keep track of your health.",
                                    style: TextStyle(
                                        color: MedicaColors.textSecondary,
                                        fontSize: 9.0),
                                  ),
                                  const SizedBox(
                                    height: MedicaSizes.sm,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(MedicaColors
                                              .primary), // Background color set to green
                                      fixedSize: MaterialStateProperty
                                          .all<Size>(const Size(120,
                                              40)), // Set the desired width and height
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0), // Border radius to create semi-circles
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      "Check now",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: MedicaColors.textWhite),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 140.0,
                                child: Transform.translate(
                                  offset: Offset(10.0,
                                      20.0), // Adjust the Y offset as needed
                                  child: Image(
                                    width: MedicaSizes.imageThumbSize,
                                    image: AssetImage(MedicaImages.image1),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SectionHeader(text: "Top Doctor"),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: doctorData.asMap().entries.map((entry) {
                  final index = entry.key;
                  final data = entry.value;
                  return DoctorCard(
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: MedicaSizes.lg, left: MedicaSizes.lg),
              child: Column(
                children: [
                  const SectionHeader(text: "Health Article"),
                  Column(
                    children: articleData.asMap().entries.map((entry) {
                      final index = entry.key;
                      final data = entry.value;
                      return ArticleCard(
                        image: data['image'],
                        title: data['title'],
                        date: data['date'],
                        length: data['length'],
                        onPressed: () {
                          MedicaLoggerHelper.info("Index: $index");
                        },
                      );
                    }).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
