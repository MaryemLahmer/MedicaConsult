import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/ratings/rating_indicator.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class FinishConsultationScreen extends StatelessWidget {
  const FinishConsultationScreen({Key? key}) : super(key: key);

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
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage(MedicaImages.placeholder5)),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Text(
                "The Consultation has ended",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems / 2,
              ),
              Text(
                "Recordings have been saved in activity",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How was your experience with Dr. Mohsen?",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  const MRatingBarIndicator(rating: 3.5),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  Text(
                    "Leave a feedback (optional)",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),
                  const TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Enter your feedback here...',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MedicaColors.borderPrimary),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MedicaColors.borderPrimary),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: MedicaColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Submit",
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
