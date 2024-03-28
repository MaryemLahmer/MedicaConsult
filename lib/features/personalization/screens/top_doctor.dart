import 'package:flutter/material.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/personalization/screens/widgets/doctor_horizontal_card.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/logging/logger.dart';

class TopDoctorPage extends StatelessWidget {
  const TopDoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: MedicaSizes.md),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Center(
          child: Text('Top Doctor'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: MedicaSizes.md),
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Implement your options action here
              },
            ),
          ),
        ],
      ),
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
                onPressed: () {
                  MedicaLoggerHelper.info("Index: $index");
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
