import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/personalization/screens/widgets/appointment_card.dart';
import 'package:medica_consult/features/personalization/screens/widgets/article_card.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/logging/logger.dart';

class SchedualPage extends StatefulWidget {
  const SchedualPage({Key? key}) : super(key: key);

  @override
  _SchedualPageState createState() => _SchedualPageState();
}

class _SchedualPageState extends State<SchedualPage> {
  int _selectedCategoryIndex = 0;

  List<Map<String, dynamic>> getFilteredAppointments() {
    switch (_selectedCategoryIndex) {
      case 0:
        return appointmentData
            .where((appointment) =>
                appointment['status'] == 'Confirmed' ||
                appointment['status'] == 'Pending')
            .toList();
      case 1:
        return appointmentData
            .where((appointment) => appointment['status'] == 'Completed')
            .toList();
      case 2:
        return appointmentData
            .where((appointment) => appointment['status'] == 'Canceled')
            .toList();
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: MedicaSizes.md),
          child: Text('Articles',
              style: TextStyle(fontSize: MedicaSizes.fontSizeLg)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: MedicaSizes.md),
            child: IconButton(
              icon: const Icon(Iconsax.notification),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: MedicaSizes.lg,
          right: MedicaSizes.lg,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 40.0,
                color: const Color(0xFFE8F3F1),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: _selectedCategoryIndex == 0
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.primary)
                              : MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                          foregroundColor: _selectedCategoryIndex == 0
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.white)
                              : MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedCategoryIndex = 0;
                          });
                        },
                        child: const Text("Upcoming"),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: _selectedCategoryIndex == 1
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.primary)
                              : MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                          foregroundColor: _selectedCategoryIndex == 1
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.white)
                              : MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedCategoryIndex = 1;
                          });
                        },
                        child: const Text("Completed"),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: _selectedCategoryIndex == 2
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.primary)
                              : MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                          foregroundColor: _selectedCategoryIndex == 2
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.white)
                              : MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedCategoryIndex = 2;
                          });
                        },
                        child: const Text("Canceled"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children:
                      getFilteredAppointments().asMap().entries.map((entry) {
                    final index = entry.key;
                    final data = entry.value;
                    return AppointmentCard(
                      doctorProfileImage: data['doctorProfileImage'],
                      doctorName: data['doctorName'],
                      doctorSpeciality: data['doctorSpeciality'],
                      date: data['date'],
                      time: data['time'],
                      status: data['status'],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
