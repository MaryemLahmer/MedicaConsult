import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica_consult/features/personalization/controllers/user_controller.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/utils/device/device_utility.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class UserProfileCard extends StatefulWidget {
  const UserProfileCard({
    super.key,
  });

  @override
  State<UserProfileCard> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  Uint8List? newImage;

  void selectImage() async {
    Uint8List img = await MedicaDeviceUtils.pickImage(ImageSource.gallery);
    setState(() {
      newImage = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Column(
      children: [
        Stack(
          children: [
            (newImage != null)
                ? CircleAvatar(
                    backgroundImage: MemoryImage(newImage!),
                    radius: 70,
                  )
                : const CircleAvatar(
                    backgroundImage: AssetImage(MedicaImages.manUser),
                    radius: 70,
                  ),
            Positioned(
              right: -3,
              bottom: -10,
              child: IconButton(
                  onPressed: selectImage,
                  icon: const Icon(
                    Iconsax.gallery_edit,
                    color: MedicaColors.black,
                    size: 28,
                  )),
            )
          ],
        ),
        Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: MedicaColors.black),
        ),
        Text(
          controller.user.value.phoneNumber,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: MedicaSizes.spaceBetweenSections,
        )
      ],
    );
  }
}
