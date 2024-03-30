import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MedicalBanner extends StatelessWidget {
  const MedicalBanner({
    super.key,
    required this.title,
    required this.subText,
    required this.buttonText, required this.radius, required this.image,
  });

  final String title;
  final String subText;
  final String buttonText;
  final double radius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius), // Adjust the radius as needed
        child: Container(
          color: MedicaColors.accent.withOpacity(0.3), // Background color
          child: Padding(
            padding: const EdgeInsets.all(MedicaSizes.md),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(
                        height: MedicaSizes.lg,
                      ),
                      Text(
                        subText,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: MedicaSizes.spaceBetweenSections,
                      ),
                      SizedBox(
                          height: 55,
                          width: 150,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                buttonText,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ))),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 255,
                    child: Transform.translate(
                      offset: const Offset(
                          10.0, 20.0), // Adjust the Y offset as needed
                      child: Image(
                        width: MedicaSizes.imageThumbSize,
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
