import 'package:flutter/material.dart';
import 'package:medica_consult/features/booking/screens/doctor/widgets/doctor_card.dart';
import '../../../../../data/data.dart';
import '../../../../../utils/logging/logger.dart';

class TopDoctorCategory extends StatelessWidget {
  const TopDoctorCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Row(
            children: doctorData.take(6).map((data) {
              return DoctorCard(
                profileImage: data['profileImage'],
                name: data['name'],
                speciality: data['speciality'],
                rating: data['rating'],
                distance: data['distance'],
                onPressed: () {
                  MedicaLoggerHelper.info(
                      "Index: ${doctorData.indexOf(data)}");
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
