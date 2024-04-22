import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/medicine/medicine.dart';
import 'package:medica_consult/features/booking/screens/pharmacy/widgets/medicine_horizontal_card.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class ProductsOnSaleScreen extends StatelessWidget {
  const ProductsOnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedicaAppBar(
          title: Text('Products On Sale',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: MedicaSizes.lg,
            right: MedicaSizes.lg,
          ),
          child: Column(
            children: medicineData.asMap().entries.map((entry) {
              final index = entry.key;
              final data = entry.value;
              return data["sale"] != 0
                  ? MedicineHorizontalCard(
                      medicineImage: data['medicineImage'],
                      type: data['type'],
                      name: data['name'],
                      quantity: data['quantity'],
                      rating: data['rating'],
                      description: data['description'],
                      price: data['price'],
                      sale: data['sale'],
                      onPressed: () => Get.to(() => MedicineScreen(
                            medicineImage: data['medicineImage'],
                            type: data['type'],
                            name: data['name'],
                            quantity: data['quantity'],
                            rating: data['rating'],
                            description: data['description'],
                            price: data['price'],
                            sale: data['sale'],
                          )),
                      // onPressed: () {
                      //   MedicaLoggerHelper.info(
                      //       "Index: ${doctorData.indexOf(data)}");
                      // },
                    )
                  : const SizedBox();
            }).toList(),
          ),
        ),
      ),
    );
  }
}
