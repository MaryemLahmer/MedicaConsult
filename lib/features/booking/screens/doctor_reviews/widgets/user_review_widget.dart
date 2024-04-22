import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../../../common/widgets/appbar/App_Bar_Profile_Card.dart';
import '../../../../../common/widgets/ratings/rating_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard(
      {super.key,
      required this.name,
      required this.rating,
      required this.date,
      required this.feedbackText, required this.image});

  final String name;
  final double rating;
  final String date;
  final String feedbackText;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MedicaColors.accent),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(MedicaSizes.xs),
            child: Column(
              children: [
                UserImageAndNameWIthIcon(
                  height: 100,
                  width: 100,
                  radius: 30,
                  imageName: image,
                  title: name,
                  subtitle: date,
                  rating: MRatingBarIndicator(rating: rating),
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),

                /// Description
                ReadMoreText(
                  feedbackText,
                  trimExpandedText: ' Show Less',
                  trimCollapsedText: '  Show More',
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MedicaColors.primary),
                  lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MedicaColors.primary),
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
