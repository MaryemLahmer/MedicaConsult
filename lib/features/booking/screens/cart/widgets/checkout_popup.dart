import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class CheckoutPopup extends StatelessWidget {
  const CheckoutPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MedicaColors.white,
      surfaceTintColor: Colors.transparent,
      title: const Column(
        children: [
          Image(
            width: 100,
            image: AssetImage(MedicaImages.paymentSuccess),
          ),
          SizedBox(
            height: MedicaSizes.spaceBetweenItems,
          ),
          Text('Payment Success'),
        ],
      ),
      content: Text(
        'Your payment has been successful, you can have a consultation session with your trusted doctor',
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
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
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Back to home',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
