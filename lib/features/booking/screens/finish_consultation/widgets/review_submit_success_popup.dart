import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class ReviewSubmitSuccessPopup extends StatelessWidget {
  const ReviewSubmitSuccessPopup({
    super.key,
    required this.darkMode,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: darkMode ? MedicaColors.black : MedicaColors.white,
      surfaceTintColor: Colors.transparent,
      children: [
        Center(
          child: Column(
            children: [
              const Image(image: AssetImage(MedicaImages.placeholder2)),
              const Text(
                "Review Successful!",
                style: TextStyle(
                    color: MedicaColors.primary,
                    fontSize: MedicaSizes.fontSizeLg,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              const Text(
                "Your review has been successfully submitted.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              const Text("Thank you very much!"),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      return MedicaColors.primary;
                    },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      return MedicaColors.white;
                    },
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                ),
                onPressed: () {
                  // Perform submit action
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
