import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/cart/widgets/address.dart';
import 'package:medica_consult/features/booking/screens/cart/widgets/medicineHorizontalCard.dart';
import 'package:medica_consult/features/booking/screens/cart/widgets/payment_details.dart';
import 'package:medica_consult/features/booking/screens/cart/widgets/payment_method.dart';
import 'package:medica_consult/features/booking/screens/maps/maps.dart';
import 'package:medica_consult/features/booking/screens/medicine/medicine.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Calculate subtotal
    double subtotal = 0;
    cartData.forEach((data) {
      subtotal += data['price'] * data['quantity'];
    });

    // Calculate total (subtotal + taxes)
    double taxes = 2.98; // Example tax amount
    double total = subtotal + taxes;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Drug Details"),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: MedicaSizes.spaceBetweenItems,
              right: MedicaSizes.spaceBetweenItems),
          child: Column(
            children: [
              SizedBox(
                height: 230,
                child: SingleChildScrollView(
                  child: Column(
                    children: cartData.map(
                      (data) {
                        return MedicineHorizontalCard(
                          medicineImage: data['medicineImage'],
                          type: data['type'],
                          name: data['name'],
                          quantity: data['quantity'],
                          rating: data['rating'],
                          description: data['description'],
                          price: data['price'],
                          sale: data['sale'],
                          onPressed: () => Get.to(
                            () => MedicineScreen(
                              medicineImage: data['medicineImage'],
                              type: data['type'],
                              name: data['name'],
                              quantity: data['quantity'],
                              rating: data['rating'],
                              description: data['description'],
                              price: data['price'],
                              sale: data['sale'],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              PaymentDetails(subtotal: subtotal, taxes: taxes, total: total),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              const PaymentMethod(),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              const Address(),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () {
                    // Show payment success popup
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: AlertDialog(
                            backgroundColor: MedicaColors.white,
                            surfaceTintColor: Colors.transparent,
                            title: const Column(
                              children: [
                                Image(
                                  width: 100,
                                  image:
                                      AssetImage(MedicaImages.paymentSuccess),
                                ),
                                SizedBox(
                                  height: MedicaSizes.spaceBetweenItems,
                                ),
                                Text('Payment Success'),
                              ],
                            ),
                            content: Text(
                              'Your payment has been successful, you can have a consultation session with your trusted doctor',
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              MedicaColors.primary),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              MedicaColors.white),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Back to home',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MedicaColors.primary),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(MedicaColors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  child: const Text("Checkout"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
