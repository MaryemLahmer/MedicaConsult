import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/ratings/rating_indicator.dart';
import 'package:medica_consult/features/booking/screens/cart/cart.dart';
import 'package:medica_consult/features/booking/screens/medicine/widgets/quantity_controller_widget.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class MedicineScreen extends StatelessWidget {
  final String medicineImage;
  final String name;
  final String type;
  final int quantity;
  final double price;
  final double rating;
  final String description;
  final int sale;

  const MedicineScreen({
    super.key,
    required this.medicineImage,
    required this.type,
    required this.name,
    required this.quantity,
    required this.price,
    required this.rating,
    required this.description,
    this.sale = 0,
  });

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
        child: Padding(
          padding: const EdgeInsets.only(
              left: MedicaSizes.spaceBetweenItems,
              right: MedicaSizes.spaceBetweenItems),
          child: Column(
            children: [
              Image(
                height: 300,
                image: AssetImage(medicineImage),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: MedicaSizes.xs,
                      ),
                      Text(
                        type == 'liquid'
                            ? '$quantity' 'ml'
                            : '$quantity' 'pcs',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: MedicaSizes.xs,
                      ),
                      Row(
                        children: [
                          MRatingBarIndicator(rating: rating),
                          const SizedBox(
                            width: MedicaSizes.sm,
                          ),
                          Text(
                            '$rating',
                            style: const TextStyle(color: MedicaColors.primary),
                          )
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.heart5,
                        color: MedicaColors.error,
                      ))
                ],
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuantityControllerWidget(
                    quantity: quantity,
                  ),
                  Text(
                    "\$$price",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: MedicaSizes.sm,
                    ),
                    ReadMoreText(
                      description,
                      trimMode: TrimMode.Line,
                      trimLines: 5,
                      colorClickableText: MedicaColors.primary,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () {},
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
                  child: const Text("Add to cart"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
