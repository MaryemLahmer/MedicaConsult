import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/features/personalization/screens/settings/prescription_tab.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';

class ReportsAndPrescriptions extends StatelessWidget {
  const ReportsAndPrescriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MedicaAppBar(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  'Documents',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
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
                  Tab(
                    child: Text(
                      'Prescriptions',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Reports',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ]),
            const Expanded(
              child: TabBarView(children: [
                MedicaPrescription(prescriptionList: ['p1','p2','p3'],report: false),
                MedicaPrescription(prescriptionList: ['p1','p2',], report: true,),

              ]),
            )
          ],
        ),
      ),
    );
  }
}
