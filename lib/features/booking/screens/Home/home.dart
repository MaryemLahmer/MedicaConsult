import 'package:flutter/material.dart';
import 'package:medica_consult/features/booking/screens/Home/widgets/category_section.dart';
import 'package:medica_consult/features/booking/screens/Home/widgets/medical_banner.dart';
import 'package:medica_consult/features/booking/screens/Home/widgets/top_doctor_category.dart';
import 'package:medica_consult/features/booking/screens/article/article.dart';
import 'package:medica_consult/features/booking/screens/article/widgets/article_interf.dart';
import 'package:medica_consult/features/booking/screens/doctor/top_doctor.dart';
import 'package:medica_consult/features/personalization/controllers/user_controller.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/article/widgets/article_card.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/App_Bar_Profile_Card.dart';
import '../../../../common/widgets/custom_shapes/containers/header_container.dart';
import '../../../../common/widgets/searchbar/serachbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../notification/notifications.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
                      subtitle: controller.user.value.fullName,
                      width: MedicaSizes.imageThumbSize,
                      height: MedicaSizes.imageThumbSize,
                      radius: 50,
                      imageName: MedicaImages.user3,
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
            const Padding(
              padding: EdgeInsets.only(
                  left: MedicaSizes.defaultSpace,
                  right: MedicaSizes.defaultSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CategorySection(),
                  SizedBox(
                    height: MedicaSizes.spaceBetweenItems / 2,
                  ),
                ],
              ),
            ),
            const MedicalBanner(
              title: 'Medical Checks!',
              buttonText: 'Check Now!',
              image: MedicaImages.doctorBanner,
              radius: 30,
              subText:
                  "Don't forget your regular checks! Keep track of your health anywhere you are.",
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: MedicaSizes.spaceBetweenItems,
                  right: MedicaSizes.spaceBetweenItems),
              child: SectionHeading(
                textHeading: 'Top Doctor',
                showActionButton: true,
                onPressed: () => Get.to(() => const TopDoctorPage()),
              ),
            ),
            Column(
              children: [
                const TopDoctorCategory(),
                const SizedBox(
                  height: MedicaSizes.xs,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: MedicaSizes.spaceBetweenItems,
                      right: MedicaSizes.spaceBetweenItems),
                  child: Column(
                    children: [
                      SectionHeading(
                        textHeading: 'Health Articles',
                        showActionButton: true,
                        onPressed: () => Get.to(() => const ArticlePage()),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: articleData.take(3).map((data) {
                          return ArticleCard(
                            image: data['image'],
                            title: data['title'],
                            date: data['date'],
                            length: data['length'],
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ArticleScree()),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
