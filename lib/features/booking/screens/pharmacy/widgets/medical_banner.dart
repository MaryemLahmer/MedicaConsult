import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MedicalBanner extends StatelessWidget {
  const MedicalBanner({
    super.key,
    required this.title,
    required this.buttonText,
    required this.radius,
    required this.image,
  });

  final String title;
  final String buttonText;
  final double radius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          color: MedicaColors.accent.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(MedicaSizes.md),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(
                        height: MedicaSizes.lg,
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
                    height: 148,
                    child: Image(
                      width: MedicaSizes.imageThumbSize,
                      image: AssetImage(image),
                      fit: BoxFit.cover,
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
