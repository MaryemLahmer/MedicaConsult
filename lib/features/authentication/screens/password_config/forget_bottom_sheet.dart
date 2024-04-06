import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/authentication/screens/password_config/forget_password_phone.dart';
import 'package:medica_consult/features/authentication/screens/password_config/forget_psw_btn_widget.dart';
import 'package:medica_consult/features/authentication/screens/password_config/forgot_password_mail.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              MedicaTexts.choiceDone,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(MedicaTexts.choiceDoneSub,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 30),
            ForgetBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: MedicaTexts.email,
              subTitle: MedicaTexts.reset,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPassword());
              },
            ),
            const SizedBox(height: 20.0),
            ForgetBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: MedicaTexts.phoneNo,
              subTitle: MedicaTexts.resetphone,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordPhone());
              },
            ),
          ],
        ),
      ),
    );
  }
}
