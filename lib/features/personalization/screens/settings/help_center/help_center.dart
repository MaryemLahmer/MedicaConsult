import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_function.dart';
import 'FAQ_screen.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MedicaAppBar(
            title: Text(
          'Medica Help Center',
          style: Theme.of(context).textTheme.headlineSmall,
        )),
        body: Column(
          children: [
            TabBar(
                labelColor: MedicaHelperFunctions.isDarkMode(context)
                    ? MedicaColors.white
                    : MedicaColors.primary,
                indicatorColor: MedicaColors.primary,
                unselectedLabelColor: MedicaColors.darkGrey,
                isScrollable: false,
                tabs: [
                  /// FAQ Tab title
                  Tab(
                    child: Text(
                      'FAQ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),

                  /// Contact Us Tab title
                  Tab(
                    child: Text(
                      'Contact Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ]),
            const Expanded(
                child: TabBarView(
              children: [
                FAQScreen(),
                SizedBox(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
