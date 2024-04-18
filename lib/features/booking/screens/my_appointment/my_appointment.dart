import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/common/widgets/ratings/rating_indicator.dart';
import 'package:medica_consult/features/booking/screens/doctor/widgets/doctor_horizontal_card.dart';
import 'package:medica_consult/features/booking/screens/messages/messages.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        title: const Text('dunno'),
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
            left: MedicaSizes.spaceBetweenItems,
            right: MedicaSizes.spaceBetweenItems,
            top: MedicaSizes.spaceBetweenItems,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorHorziontalCard(
                  profileImage: MedicaImages.user1,
                  name: "Gojo Satoru",
                  speciality: "spines",
                  rating: 9.7,
                  distance: 10,
                  onPressed: () {}),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Text(
                "Scheduled Appointment",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Text(
                "Today, Dec 28, 2023",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "03:00 PM - 03:30 PM",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Text(
                "Patient Information",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Text(
                "Full Name : Cristiano Ronaldo",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "Gender : Female",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "Age  : 40",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "Problem : Ligament Croisé",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Text(
                "Your Package",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Container(
                  padding: EdgeInsets.all(MedicaSizes.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: MedicaColors.accent,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Messaging",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Column(
                        children: [
                          Text(
                            "20DT",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "Fully paid",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const MessagesScreen());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: MedicaColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Message (Start at 16:00)",
                    style: TextStyle(
                      color: MedicaColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
