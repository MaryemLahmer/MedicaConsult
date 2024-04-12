import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/ratings/rating_indicator.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/cart/cart.dart';
import 'package:medica_consult/features/booking/screens/medicine/widgets/quantity_controller_widget.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:readmore/readmore.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

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
              const Image(
                height: 300,
                image: AssetImage(MedicaImages.medicine1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OBH Combi",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: MedicaSizes.xs,
                      ),
                      Text(
                        "75ml",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: MedicaSizes.xs,
                      ),
                      const Row(
                        children: [
                          MRatingBarIndicator(rating: 3.5),
                          SizedBox(
                            width: MedicaSizes.sm,
                          ),
                          Text(
                            "3.5",
                            style: TextStyle(color: MedicaColors.primary),
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
                  const QuantityControllerWidget(),
                  Text(
                    "\$9.99",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Column(
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
                    'OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing. OBH COMBI  is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing.',
                    trimMode: TrimMode.Line,
                    trimLines: 5,
                    colorClickableText: MedicaColors.primary,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    style: Theme.of(context).textTheme.bodySmall,
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
