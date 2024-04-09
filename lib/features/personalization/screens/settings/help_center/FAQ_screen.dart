import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/searchbar/serachbar.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

import '../../../../../common/widgets/buttons/toggleable_button_list.dart';


class FAQScreen extends StatelessWidget {
  const FAQScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(MedicaSizes.md),
        child: Column(
          children: [
            ToggleableButtonList(),

            MedicaSearchBar(hintText: "Search"),
          ],
        ),
      ),
    );
  }
}
