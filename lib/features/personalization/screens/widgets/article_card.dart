import 'package:flutter/material.dart';
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
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 110.0,
        child: Padding(
          padding: const EdgeInsets.only(
              top: MedicaSizes.xs, bottom: MedicaSizes.xs),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: MedicaColors.softGrey,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(MedicaSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        width: MedicaSizes.imageThumbSize,
                        height: MedicaSizes.imageThumbSize,
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: MedicaSizes.xs,
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                MedicaFormatter.formatDate(date),
                                style: const TextStyle(fontSize: 10.0),
                              ),
                              const Text(
                                " • ",
                              ),
                              Text(
                                '$length min read',
                                style: const TextStyle(
                                    color: MedicaColors.primary,
                                    fontSize: 10.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: MedicaSizes.xs,
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.bookmark,
                          color: MedicaColors.primary,
                        ),
                        onPressed: () {
                          MedicaLoggerHelper.info("saved");
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
