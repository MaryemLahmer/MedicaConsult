import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/common/widgets/custom_shapes/containers/header_container.dart';
import 'package:medica_consult/common/widgets/texts/section_heading.dart';
import 'package:medica_consult/features/booking/screens/doctor/widgets/doctor_insight.dart';
import 'package:medica_consult/features/booking/screens/doctor/widgets/doctor_profile_card.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/texts/text_discription.dart';
import '../doctor_reviews/doctor_reviews.dart';
import '../doctor_reviews/widgets/user_review_widget.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
                child: Padding(
              padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
              child: Column(
                children: [
                  MedicaAppBar(
                    title: Text(
                      'Doctor details',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: MedicaColors.white),
                    ),
                  ),
                  const DoctorProfileCard(
                    drImage: MedicaImages.doctorReal,
                    drName: 'Dr. Mohsen',
                    drLocation: 'Bardo, Hogwarts',
                    drSpeciality: 'Cardiologist',
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenSections,
                  ),
                ],
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DoctorInsight(
                  title: '200+',
                  backgroundColor: MedicaColors.accent.withOpacity(0.4),
                  subtitle: 'patients',
                  iconData: Iconsax.people,
                ),
                DoctorInsight(
                  title: '10+',
                  backgroundColor: MedicaColors.accent.withOpacity(0.4),
                  subtitle: 'years of experience',
                  iconData: Iconsax.user_tick,
                ),
                DoctorInsight(
                  title: '4.5',
                  backgroundColor: MedicaColors.accent.withOpacity(0.4),
                  subtitle: 'rating',
                  iconData: Iconsax.star1,
                ),
                DoctorInsight(
                  title: '20',
                  backgroundColor: MedicaColors.accent.withOpacity(0.4),
                  subtitle: 'reviews',
                  iconData: Iconsax.message,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    textHeading: 'About',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: MedicaSizes.xs,
                  ),
                  const TextDescription(
                      textDescription:
                          'I am Dr.Mohsen from jandouba. I am the best of the best. If you wanna get checked baby girl, just hit that button and let’s chat. I am always free, always available.'),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  const SectionHeading(
                    textHeading: 'Working Time',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: MedicaSizes.xs,
                  ),
                  const TextDescription(
                      textDescription: 'Monday - Friday, 9:00 AM to 3 PM'),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  SectionHeading(
                    textHeading: 'Reviews',
                    onPressed: () => Get.to(() => const DoctorReviewsScreen()),
                  ),
                  const UserReviewCard(
                    name: 'Madame Karima',
                    image: MedicaImages.userTegher,
                    date: '30-03-2024',
                    rating: 4.5,
                    feedbackText:
                        'Oh la la! this one is a player, he knows exactly where i mean what to do. 5 stars you bet !!',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
