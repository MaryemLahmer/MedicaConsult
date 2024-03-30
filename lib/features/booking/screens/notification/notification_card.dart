import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/formatters/formatter.dart';

class NotificationCard extends StatelessWidget {
  final String subject;
  final String type;
  final DateTime time;
  final String content;

  const NotificationCard({
    super.key,
    required this.subject,
    required this.type,
    required this.time,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                  color: Colors.transparent,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(type),
                        ),
                        const SizedBox(
                          width: MedicaSizes.sm,
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                subject,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: MedicaSizes.xs,
                              ),
                              Text(
                                MedicaFormatter.formatTime(time),
                                style: const TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                              const SizedBox(
                                height: MedicaSizes.xs,
                              ),
                              Text(
                                content,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
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
