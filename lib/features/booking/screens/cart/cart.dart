import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/features/booking/screens/maps/maps.dart';
import 'package:medica_consult/features/booking/screens/medicine/widgets/quantity_controller_widget.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
              const SizedBox(
                height: 230,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MedicineHorizontalCard(),
                      MedicineHorizontalCard(),
                      MedicineHorizontalCard(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Detail",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal",
                          style: Theme.of(context).textTheme.bodySmall),
                      Text("\$25.98",
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Taxes",
                          style: Theme.of(context).textTheme.bodySmall),
                      Text("\$25.98",
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text("\$25.98",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Method",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(MedicaSizes.sm),
                      border: Border.all(color: MedicaColors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(MedicaSizes.sm),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Image(
                              image: AssetImage(MedicaImages.visa),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Change",
                                style: TextStyle(color: MedicaColors.darkGrey),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "123 Ariana",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => MapScreen()),
                        child: const Text(
                          "Change",
                          style: TextStyle(color: MedicaColors.darkGrey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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

class MedicineHorizontalCard extends StatelessWidget {
  const MedicineHorizontalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: MedicaSizes.xs, bottom: MedicaSizes.xs),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MedicaSizes.sm),
          border: Border.all(color: MedicaColors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.sm),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  width: 80,
                  image: AssetImage(MedicaImages.medicine1),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "OBG Combi",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Text("75ml"),
                      ],
                    ),
                    const QuantityControllerWidget(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.trash),
                    ),
                    Text(
                      "\$15.99",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
