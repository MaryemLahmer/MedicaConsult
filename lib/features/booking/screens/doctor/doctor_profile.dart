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

import '../../../../common/widgets/texts/text_discription.dart';

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
            const Padding(
              padding: EdgeInsets.all(MedicaSizes.defaultSpace),
              child: Column(
                children: [
                  SectionHeading(
                    textHeading: 'About',
                    showActionButton: false,
                  ),
                  TextDescription(
                      textDescription:
                          'I am Dr.Mohsen from jandouba. I am the best of the best. If you wanna get checked baby girl, just hit that button and let’s chat. I am always free, always available ... Read more'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
