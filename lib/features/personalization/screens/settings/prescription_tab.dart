import 'package:flutter/material.dart';
import 'package:medica_consult/features/personalization/screens/settings/widgets/prescription_card.dart';

class MedicaPrescription extends StatelessWidget {
  const MedicaPrescription({super.key, required this.prescriptionList, required this.report});

  final List prescriptionList;
  final bool report;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: prescriptionList.length,
          itemBuilder: (context,index){
        return PrescriptionCard(date: '28-04-2025',doctorName: 'Mohsen',report: report,);
      }),
    );
  }
}
