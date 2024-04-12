import 'package:flutter/material.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/Home/widgets/top_doctor_category.dart';
import 'package:medica_consult/features/booking/screens/doctor/top_doctor.dart';
import 'package:medica_consult/features/booking/screens/medicine/medicine.dart';
import 'package:medica_consult/features/booking/screens/pharmacy/widgets/medical_banner.dart';
import 'package:medica_consult/features/booking/screens/pharmacy/widgets/medicine_card.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/searchbar/serachbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class Pharmacy extends StatelessWidget {
  const Pharmacy({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    print(medicineData);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        titleSpacing: 0,
        title: const Text("Pharmacy"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: MedicaSizes.md),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: MedicaColors.primary,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  left: MedicaSizes.spaceBetweenItems,
                  right: MedicaSizes.spaceBetweenItems),
              child: MedicaSearchBar(
                hintText: 'Search Doctors, Drugs, Articles',
              ),
            ),
            const MedicalBanner(
              title: 'Order quickly with prescription',
              buttonText: 'Upload Prescription',
              image: MedicaImages.placeholder6,
              radius: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: MedicaSizes.spaceBetweenItems,
                  right: MedicaSizes.spaceBetweenItems),
              child: SectionHeading(
                textHeading: 'Popular Product',
                showActionButton: true,
                onPressed: () => Get.to(() => const TopDoctorPage()),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Row(
                    children: medicineData.take(6).map((data) {
                      return MedicineCard(
                        medicineImage: data['medicineImage'],
                        type: data['type'],
                        name: data['name'],
                        quantity: data['quantity'],
                        rating: data['rating'],
                        description: data['description'],
                        price: data['price'],
                        onPressed: () => Get.to(() => const MedicineScreen()),
                        // onPressed: () {
                        //   MedicaLoggerHelper.info(
                        //       "Index: ${doctorData.indexOf(data)}");
                        // },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: MedicaSizes.xs,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: MedicaSizes.spaceBetweenItems,
                  right: MedicaSizes.spaceBetweenItems),
              child: SectionHeading(
                textHeading: 'Product on Sale',
                showActionButton: true,
                onPressed: () => Get.to(() => const TopDoctorPage()),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Row(
                    children: medicineData.take(6).map((data) {
                      return data["onSale"]
                          ? MedicineCard(
                              medicineImage: data['medicineImage'],
                              type: data['type'],
                              name: data['name'],
                              quantity: data['quantity'],
                              rating: data['rating'],
                              description: data['description'],
                              price: data['price'],
                              onPressed: () =>
                                  Get.to(() => const MedicineScreen()),
                              // onPressed: () {
                              //   MedicaLoggerHelper.info(
                              //       "Index: ${doctorData.indexOf(data)}");
                              // },
                            )
                          : const SizedBox();
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
