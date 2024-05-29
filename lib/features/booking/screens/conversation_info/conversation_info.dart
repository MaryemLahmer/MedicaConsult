import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/features/booking/screens/call/call.dart';
import 'package:medica_consult/features/booking/screens/conversation_info/widgets/conversation_action.dart';
import 'package:medica_consult/features/booking/screens/conversation_info/widgets/conversation_info_option.dart';
import 'package:medica_consult/features/booking/screens/doctor/doctor_profile.dart';
import 'package:medica_consult/features/booking/screens/view_assets/view_assets.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class ConversationInfoScreen extends StatelessWidget {
  const ConversationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: MedicaSizes.md),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(56.0),
            child: const Image(
              width: 112.0,
              height: 112.0,
              fit: BoxFit.cover,
              image: AssetImage(MedicaImages.docM2),
            ),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBetweenItems,
          ),
          Text(
            "Dr. Slimen Labyedh",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: MedicaSizes.spaceBetweenItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConversationInfoOption(
                icon: Icons.phone,
                onPressed: () {
                  Get.to(() => VideoCallRingingScreen());
                },
              ),
              const SizedBox(
                width: MedicaSizes.lg,
              ),
              ConversationInfoOption(
                icon: Icons.videocam,
                onPressed: () {
                  Get.to(() => VideoCallRingingScreen());
                },
              ),
              const SizedBox(
                width: MedicaSizes.lg,
              ),
              ConversationInfoOption(
                icon: Iconsax.user,
                onPressed: () {
                  Get.to(() => const DoctorProfile());
                },
              ),
            ],
          ),
          const SizedBox(
            height: MedicaSizes.spaceBetweenSections,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: MedicaSizes.lg, right: MedicaSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Actions",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),
                ConversationAction(
                  icon: Icons.image,
                  onPressed: () {
                    Get.to(() => ViewAssets());
                  },
                  text: "View media, files & links",
                  color: MedicaColors.primary,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),
                ConversationAction(
                  icon: Icons.search,
                  onPressed: () {},
                  text: "Search in conversation",
                  color: MedicaColors.primary,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenSections,
                ),
                Text(
                  "Privacy and support",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),
                ConversationAction(
                  icon: Iconsax.trash,
                  onPressed: () {},
                  text: "Delete Conversation",
                  color: MedicaColors.error,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),
                ConversationAction(
                  icon: Icons.warning_amber_rounded,
                  onPressed: () {},
                  text: "Report user",
                  color: MedicaColors.error,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),
                ConversationAction(
                  icon: Icons.report_gmailerrorred_rounded,
                  onPressed: () {},
                  text: "Report technical problem",
                  color: MedicaColors.error,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
