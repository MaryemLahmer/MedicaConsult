import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/appointment/widgets/appointment_card.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';

class SchedualPage extends StatefulWidget {
  const SchedualPage({super.key});

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
    List<Map<String, dynamic>> filteredAppointments = getFilteredAppointments();

    Widget buildNoAppointmentsImage(String imageAsset, String text1) {
      return Column(
        children: [
          const SizedBox(
            height: 120.0,
          ),
          Image.asset(
            imageAsset,
            height: 120.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10.0),
          Text(
            text1,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
        ],
      );
    }

    return Scaffold(
      appBar: MedicaAppBar(title: Text('Schedule',style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: false,),
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
                            ),
                          ),
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
                            ),
                          ),
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
                            ),
                          ),
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
                child: filteredAppointments.isEmpty
                    ? buildNoAppointmentsImage(
                        _selectedCategoryIndex == 0
                            ? MedicaImages.placeholder1
                            : _selectedCategoryIndex == 1
                                ? MedicaImages.placeholder2
                                : MedicaImages.placeholder2,
                        _selectedCategoryIndex == 0
                            ? 'You don’t have any appointments yet'
                            : _selectedCategoryIndex == 1
                                ? 'You don’t have any completed appointments.'
                                : 'You don’t have any canceled appointments.',
                      )
                    : Column(
                        children:
                            filteredAppointments.asMap().entries.map((entry) {
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
