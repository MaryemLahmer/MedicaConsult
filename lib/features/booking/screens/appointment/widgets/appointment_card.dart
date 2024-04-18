import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:medica_consult/features/booking/screens/appointment/widgets/cancel_appointment/dialog_cancel.dart';
=======
import 'package:medica_consult/features/booking/screens/finish_consultation/finish_consultation.dart';
import 'package:medica_consult/features/booking/screens/my_appointment/my_appointment.dart';
>>>>>>> 3039eefdc9d35f00e796767f44831020343b8afb
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/formatters/formatter.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorProfileImage;
  final String doctorName;
  final String doctorSpeciality;
  final DateTime date;
  final DateTime time;
  final String status;

  const AppointmentCard({
    super.key,
    required this.doctorProfileImage,
    required this.doctorName,
    required this.doctorSpeciality,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    bool canCancelOrReschedule = status == 'Confirmed' || status == 'Pending';

    return GestureDetector(
      onTap: () {
        status == "Completed"
            ? Get.to(() => const FinishConsultationScreen())
            : status == "Confirmed"
                ? Get.to(() => const MyAppointmentScreen())
                : {};
      },
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            top: MedicaSizes.xs,
            bottom: MedicaSizes.xs,
          ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(MedicaSizes.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: MedicaSizes.xs,
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctorName,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    doctorSpeciality,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 10.0,
                                      color: MedicaColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: MedicaSizes.spaceBetweenItems,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 14.0,
                                  ),
                                  Text(
                                    MedicaFormatter.formatDate(date),
                                    style: const TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.access_time,
                                    size: 14.0,
                                  ),
                                  Text(
                                    MedicaFormatter.formatTime(time),
                                    style: const TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    status,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: status == 'Canceled'
                                          ? MedicaColors.error
                                          : MedicaColors.success,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(doctorProfileImage),
                        ),
                      ],
                    ),
                  ),
                  if (canCancelOrReschedule)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: MedicaSizes.sm,
                        vertical: MedicaSizes.xs,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                showDialog(context: context, builder: ((context) => const CancelDialog()));
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  MedicaColors.accent.withOpacity(0.3),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  MedicaColors.black,
                                ),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  MedicaColors.primary,
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  MedicaColors.white,
                                ),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: const Text('Reschedule'),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
