import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard(
      {super.key, required this.doctorName, required this.date, required this.report});

  final String doctorName;
  final String date;
  final bool report;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: MedicaSizes.md, right: MedicaSizes.md, top: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: MedicaColors.accent),
        ),
        contentPadding: const EdgeInsets.only(
            top: MedicaSizes.xs, left: MedicaSizes.md, right: MedicaSizes.md),
        leading: const Image(
          height: 150,
          fit: BoxFit.fitHeight,
          image: AssetImage(MedicaImages.prescription),
        ),
        minLeadingWidth: 50,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (report != true)
                ? Text(
                    'Dr. $doctorName\'s Prescription',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                : Text(
                    'Dr. $doctorName\'s Report',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
            const SizedBox(
              height: MedicaSizes.xs,
            ),
            Text(
              'Date: $date',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: MedicaColors.darkGrey),
            ),
            const SizedBox(
              height: MedicaSizes.md,
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30,
              width: 70,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero, minimumSize: Size.zero),
                child: const Expanded(
                    child: Text(
                  'View',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 30,
              width: 80,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero, minimumSize: Size.zero),
                child: const Expanded(
                    child: Text(
                  'Download',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 30,
              width: 60,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero, minimumSize: Size.zero),
                child: const Expanded(
                    child: Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
