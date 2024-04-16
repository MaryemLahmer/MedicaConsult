import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/buttons/toggleable_button_list.dart';

class FilterTest extends StatefulWidget {
  const FilterTest({super.key});

  @override
  State<FilterTest> createState() => _FilterTestState();
}

class _FilterTestState extends State<FilterTest> {
  static List<String> categories = ['General', 'Account', 'Service', 'Payment'] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


          ],
        ),
      ),
    );
  }
}
