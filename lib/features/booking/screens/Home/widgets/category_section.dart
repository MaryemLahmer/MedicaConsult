import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VerticalImageText(
          image: MedicaImages.doctor,
          title: 'Doctor',
        ),
        VerticalImageText(
          image: MedicaImages.pharmacy,
          title: 'Pharmacy',
        ),
        VerticalImageText(
          image: MedicaImages.hospital,
          title: 'Hospital',
        ),
      ],
    );
  }
}
