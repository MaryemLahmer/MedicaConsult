import 'package:flutter/material.dart';
import 'package:medica_consult/features/booking/screens/article/widgets/article_interf.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/formatters/formatter.dart';
import 'package:medica_consult/utils/logging/logger.dart';

class ArticleCard extends StatelessWidget {
  final String image;
  final String title;
  final DateTime date;
  final int length;
  final VoidCallback onPressed;

  const ArticleCard(
      {super.key,
      required this.image,
      required this.title,
      required this.date,
      required this.length,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the Screenshot page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ArticleScree()),
        );
      },
      child: Column(
        children: [
          Container(
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: MedicaColors.accent),
            ),
            height: 210,
            child: Padding(
              padding: const EdgeInsets.all(MedicaSizes.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    child: Image(
                      image: AssetImage(image),
                      height: 190,
                      width: 100,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Center(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: MedicaSizes.xs,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Text(
                              MedicaFormatter.formatDate(date),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const Text(
                            " • ",
                          ),
                          SizedBox(
                            child: Text(
                              '$length min read',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .apply(color: MedicaColors.darkerGrey),
                            ),
                          ),
                          const SizedBox(
                            width: MedicaSizes.xs,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                    child: IconButton(
                        icon: const Icon(
                          Icons.bookmark,
                          color: MedicaColors.primary,
                        ),
                        onPressed: () {
                          MedicaLoggerHelper.info("saved");
                        }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBetweenItems,
          ),
        ],
      ),
    );
  }
}
