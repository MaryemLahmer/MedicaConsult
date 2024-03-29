import 'package:flutter/material.dart';
import 'package:medica_consult/features/booking/screens/Home/widgets/category_section.dart';
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
import '../../../../common/widgets/appbar/App_Bar_Profile_Card.dart';
import '../../../../common/widgets/custom_shapes/containers/header_container.dart';
import '../../../../common/widgets/serachbar.dart';
import '../../../personalization/screens/notifications.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        /// Header: user image + greeting message + notification icon
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Padding(
                padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
                child: Column(
                  children: [
                    UserImageAndNameWIthIcon(
                      title: 'Welcome Back',
                      subtitle: 'The Three Mosquitoes',
                      width: MedicaSizes.imageThumbSize,
                      height: MedicaSizes.imageThumbSize,
                      radius: 50,
                      imageName: MedicaImages.cuteUser3,
                      icon: Iconsax.notification,
                      onPressed: () => Get.to(() => const NotificationsPage()),
                    ),
                    const SizedBox(
                      height: MedicaSizes.spaceBetweenSections,
                    ),
                    const MedicaSearchBar(
                      hintText: 'Search Doctors, Drugs, Articles',
                    ),
                    const SizedBox(
                      height: MedicaSizes.spaceBetweenSections,
                    ),
                  ],
                ),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CategorySection(),
                SizedBox(
                  height: MedicaSizes.spaceBetweenItems / 2,
                ),
              ],
            ),
            const MedicalBanner(),
            SectionHeader(
                text: "Top Doctor",
                action: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TopDoctorPage();
                  }));
                }),
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
    return Padding(
      padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(30), // Adjust the radius as needed
        child: Container(
          color: MedicaColors.accent.withOpacity(0.3), // Background color
          child: Padding(
            padding: const EdgeInsets.all(MedicaSizes.md),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Medical checks!",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
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
      ),
    );
  }
}
