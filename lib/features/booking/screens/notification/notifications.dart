import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/booking/screens/communication/widgets/message_card.dart';
import 'package:medica_consult/features/booking/screens/notification/notification_card.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: MedicaSizes.md),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Center(
          child: Text('Notifications'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: MedicaSizes.md),
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Implement your options action here
              },
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
                      flex: 5,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: _selectedOptionIndex == 0
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.primary)
                              : MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                          foregroundColor: _selectedOptionIndex == 0
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
                            _selectedOptionIndex = 0;
                          });
                        },
                        child: const Text("Messages"),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: _selectedOptionIndex == 1
                              ? MaterialStateProperty.all<Color>(
                                  MedicaColors.primary)
                              : MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                          foregroundColor: _selectedOptionIndex == 1
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
                            _selectedOptionIndex = 1;
                          });
                        },
                        child: const Text("Notifications"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _selectedOptionIndex == 0
                    ? messages.isEmpty
                        ? buildNoAppointmentsImage(
                            MedicaImages.placeholder3,
                            'You have no messages.',
                          )
                        : Column(
                            children: messages.asMap().entries.map((entry) {
                              final index = entry.key;
                              final data = entry.value;
                              return MessageCard(
                                senderProfileImage: data['senderProfileImage'],
                                senderName: data['senderName'],
                                time: data['time'],
                                content: data['content'],
                              );
                            }).toList(),
                          )
                    : messages.isEmpty
                        ? buildNoAppointmentsImage(
                            MedicaImages.placeholder3,
                            'You have no notifications.',
                          )
                        : Column(
                            children:
                                notifications.asMap().entries.map((entry) {
                              final index = entry.key;
                              final data = entry.value;
                              String type = '';
                              switch (data['type']) {
                                case 'reminder':
                                  type = MedicaImages.reminder;
                                  break;
                                case 'cancel':
                                  type = MedicaImages.canceled;
                                  break;
                                case 'success':
                                  type = MedicaImages.success;
                                  break;
                                case 'payment':
                                  type = MedicaImages.payment;
                                  break;
                                default:
                                  break;
                              }
                              return NotificationCard(
                                subject: data['subject'],
                                type: type,
                                time: data['time'],
                                content: data['content'],
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
