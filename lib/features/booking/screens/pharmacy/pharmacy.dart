import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/cart/cart.dart';
import 'package:medica_consult/features/booking/screens/medicine/medicine.dart';
import 'package:medica_consult/features/booking/screens/pharmacy/widgets/medical_banner.dart';
import 'package:medica_consult/features/booking/screens/pharmacy/widgets/medicine_card.dart';
import 'package:medica_consult/features/booking/screens/pharmacy/widgets/medicine_horizontal_card.dart';
import 'package:medica_consult/features/booking/screens/popular_products/popular_products.dart';
import 'package:medica_consult/features/booking/screens/products_on_sale/products_on_sale.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PharmacyState createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  late TextEditingController _searchController;
  String _searchText = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSubmit(String value) {
    setState(() {
      _searchText = value;
      _isLoading = true;
    });
    // Simulating loading delay of 3 seconds
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => Get.to(() => const CartScreen()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: MedicaSizes.spaceBetweenItems,
                  right: MedicaSizes.spaceBetweenItems),
              child: TextField(
                controller: _searchController,
                onSubmitted: _handleSubmit,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MedicaColors.lightGrey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    borderSide: const BorderSide(color: MedicaColors.accent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    borderSide:
                        const BorderSide(color: MedicaColors.borderPrimary),
                  ),
                  hintText: 'Search drugs...',
                  hintStyle: const TextStyle(
                    color: MedicaColors.textSecondary,
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                cursorColor: MedicaColors.black,
              ),
            ),
            _isLoading
                ? const SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : _searchText.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: MedicaSizes.spaceBetweenItems,
                            right: MedicaSizes.spaceBetweenItems),
                        child: Column(
                          children: medicineData
                              .where((data) =>
                                  data['name'].contains(_searchText) ||
                                  data['description'].contains(_searchText))
                              .map((data) {
                            return MedicineHorizontalCard(
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
                            );
                          }).toList(),
                        ),
                      )
                    : Column(
                        children: [
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
                              onPressed: () =>
                                  Get.to(() => const PopularProductsScreen()),
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
                                      sale: data['sale'],
                                      onPressed: () =>
                                          Get.to(() => MedicineScreen(
                                                medicineImage:
                                                    data['medicineImage'],
                                                type: data['type'],
                                                name: data['name'],
                                                quantity: data['quantity'],
                                                rating: data['rating'],
                                                description:
                                                    data['description'],
                                                price: data['price'],
                                                sale: data['sale'],
                                              )),
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
                              onPressed: () =>
                                  Get.to(() => const ProductsOnSaleScreen()),
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
                                    return data["sale"] != 0
                                        ? MedicineCard(
                                            medicineImage:
                                                data['medicineImage'],
                                            type: data['type'],
                                            name: data['name'],
                                            quantity: data['quantity'],
                                            rating: data['rating'],
                                            description: data['description'],
                                            price: data['price'],
                                            sale: data['sale'],
                                            onPressed: () =>
                                                Get.to(() => MedicineScreen(
                                                      medicineImage:
                                                          data['medicineImage'],
                                                      type: data['type'],
                                                      name: data['name'],
                                                      quantity:
                                                          data['quantity'],
                                                      rating: data['rating'],
                                                      description:
                                                          data['description'],
                                                      price: data['price'],
                                                      sale: data['sale'],
                                                    )),
                                          )
                                        : const SizedBox();
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
