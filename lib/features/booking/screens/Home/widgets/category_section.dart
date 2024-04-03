import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/image_text.dart';
import '../../../../../utils/constants/image_strings.dart';
import 'package:get/get.dart';

import '../../doctor/find_doctors.dart';
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
          onTap: () => Get.to(() => const FindDoctorsPage()),
        ),
        const VerticalImageText(
          image: MedicaImages.pharmacy,
          title: 'Pharmacy',
        ),
        const VerticalImageText(
          image: MedicaImages.hospital,
          title: 'Hospital',
        ),
      ],
    );
  }
}
