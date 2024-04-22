import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(MedicaSizes.xs),
        child: Column(
          children: [
            Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                border: Border.all(color: MedicaColors.accent,width: 2)),
              child: TableCalendar(
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {
                    if ((day.weekday == DateTime.sunday) ||
                        (day.weekday == DateTime.saturday)) {
                      final text = DateFormat.E().format(day);

                      return Center(
                        child: Text(
                          text,
                          style: const TextStyle(color: MedicaColors.error),
                        ),
                      );
                    }
                    return null;
                  },
                ),
                locale: "en_US",
                availableGestures: AvailableGestures.all,
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    ),
                rowHeight: MedicaSizes.spaceBetweenSections * 1.5,
                focusedDay: today,
                firstDay: DateTime.utc(2024, 01, 01),
                lastDay: DateTime.utc(2026, 01, 01),
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: _onDaySelected,
              ),
            ),
            const SizedBox(
              height: MedicaSizes.spaceBetweenItems,
            ),
            Text(
              "Selected Day : ${today.toString().split(" ")[0]}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
