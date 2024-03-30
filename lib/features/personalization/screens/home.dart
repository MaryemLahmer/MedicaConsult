import 'package:flutter/material.dart';
import 'package:medica_consult/features/personalization/screens/find_doctors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/personalization/screens/article.dart';
import 'package:medica_consult/features/personalization/screens/top_doctor.dart';
import 'package:medica_consult/features/personalization/screens/widgets/article_card.dart';
import 'package:medica_consult/features/personalization/screens/widgets/doctor_card.dart';
import 'package:medica_consult/features/personalization/screens/widgets/section_header.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/logging/logger.dart';
import 'package:get/get.dart';

import '../../../common/widgets/custom_shapes/containers/header_container.dart';
import '../../../common/widgets/images/image_text.dart';
import 'notifications.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Header: user image + greeting message + notification icon
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Padding(
                padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
                child: Column(
                  children: [
                    SafeArea(
                      child: Row(
                        children: [
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(MedicaSizes.md),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome Back,",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Text("TheFerrMann",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .apply(color: MedicaColors.white)),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Iconsax.notification,
                              size: 30,
                            ), // Bell icon
                            onPressed: () =>
                                Get.to(() => const NotificationsPage()),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: MedicaSizes.spaceBetweenSections,
                    ),
                    TextField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MedicaColors.lightGrey,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36.0),
                          borderSide:
                              const BorderSide(color: MedicaColors.accent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(36.0),
                          borderSide: const BorderSide(
                              color: MedicaColors.borderPrimary),
                        ),
                        hintText: 'Search Doctors, Drugs, Articles...',
                        // Added search icon in the hint text
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: MedicaSizes.defaultSpace,
                  right: MedicaSizes.defaultSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CategorySection(),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  const MedicalBanner(),
                  SectionHeader(
                      text: "Top Doctor",
                      action: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const TopDoctorPage();
                        }));
                      }),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: doctorData.take(6).map((data) {
                  return DoctorCard(
                    profileImage: data['profileImage'],
                    name: data['name'],
                    speciality: data['speciality'],
                    rating: data['rating'],
                    distance: data['distance'],
                    onPressed: () {
                      MedicaLoggerHelper.info(
                          "Index: ${doctorData.indexOf(data)}");
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
                  SectionHeader(
                      text: "Health Article",
                      action: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ArticlePage();
                        }));
                      }),
                  Column(
                    children: articleData.take(3).map((data) {
                      return ArticleCard(
                        image: data['image'],
                        title: data['title'],
                        date: data['date'],
                        length: data['length'],
                        onPressed: () {
                          MedicaLoggerHelper.info(
                              "Index: ${articleData.indexOf(data)}");
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

class MedicalBanner extends StatelessWidget {
  const MedicalBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
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
                    Text(
                      "Medical checks!",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: MedicaSizes.sm,
                    ),
                    const Text(
                      "Don’t forget your regular checks.",
                      style: TextStyle(
                          color: MedicaColors.textSecondary, fontSize: 9.0),
                    ),
                    const Text(
                      "Keep track of your health.",
                      style: TextStyle(
                          color: MedicaColors.textSecondary, fontSize: 9.0),
                    ),
                    const SizedBox(
                      height: MedicaSizes.sm,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MedicaColors.primary),
                        // Background color set to green
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(120, 40)),
                        // Set the desired width and height
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Border radius to create semi-circles
                          ),
                        ),
                      ),
                      child: const Text(
                        "Check now",
                        style: TextStyle(
                            fontSize: 10.0, color: MedicaColors.textWhite),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 140.0,
                  child: Transform.translate(
                    offset: const Offset(
                        10.0, 20.0), // Adjust the Y offset as needed
                    child: const Image(
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
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VerticalImageText(
          image: MedicaImages.doctor,
          title: 'Doctor',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FindDoctorsPage();
            }));
          },
        ),
        VerticalImageText(
          image: MedicaImages.pharmacy,
          title: 'Pharmacy',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FindDoctorsPage();
            }));
          },
        ),
        VerticalImageText(
          image: MedicaImages.hospital,
          title: 'Hospital',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FindDoctorsPage();
            }));
          },
        ),
      ],
    );
  }
}
