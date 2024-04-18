import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/features/booking/screens/doctor_reviews/widgets/user_review_widget.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class DoctorReviewsScreen extends StatelessWidget {
  const DoctorReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      /// Appbar
      appBar: MedicaAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ratings and Reviews are verified and are from people who use the same type of device that you do"),
              SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),

              /// User Reviews List
              UserReviewCard(
                name: 'Madame Karima',
                image: MedicaImages.userTegher,
                date: '30-03-2024',
                rating: 4.5,
                feedbackText:
                    'Oh la la! this one is a player, he knows exactly where i mean what to do. 5 stars you bet !!',
              ),
              SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              UserReviewCard(
                name: 'Monsieur Moncef',
                image: MedicaImages.user2,
                date: '28-03-2024',
                rating: 3,
                feedbackText:
                    'This dude stole my wife. I’m gonna kill him and then her.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
