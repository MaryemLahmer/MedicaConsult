import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/doctor/widgets/doctor_horizontal_card.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import 'package:get/get.dart';

import 'doctor_profile.dart';

class TopDoctorPage extends StatelessWidget {
  const TopDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedicaAppBar(
          title: Text('Top Doctor',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: MedicaSizes.lg,
            right: MedicaSizes.lg,
          ),
          child: Column(
            children: doctorData.asMap().entries.map((entry) {
              final index = entry.key;
              final data = entry.value;
              return DoctorHorziontalCard(
                profileImage: data['profileImage'],
                name: data['name'],
                speciality: data['speciality'],
                rating: data['rating'],
                distance: data['distance'],
                onPressed: () => Get.to(() => const DoctorProfile()),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
