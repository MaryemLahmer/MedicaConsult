import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(MedicaImages.manUser),
              radius: 70,
            ),
            Positioned(
              right: -3,
              bottom: -10,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.gallery_edit,
                    color: MedicaColors.black,
                    size: 28,
                  )),
            )
          ],
        ),
        Text(
          'User Disney Style',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: MedicaColors.black),
        ),
        Text(
          '+999 999 999 ',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: MedicaSizes.spaceBetweenSections,
        )
      ],
    );
  }
}
