import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class MedicaSearchBar extends StatelessWidget {
  const MedicaSearchBar({
    super.key, required this.hintText,
  });

  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: MedicaColors.lightGrey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.0),
          borderSide:
          const BorderSide(color: MedicaColors.accent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(36.0),
          borderSide: const BorderSide(
              color: MedicaColors.borderPrimary),
        ),
        hintText: hintText,
        // Added search icon in the hint text
        hintStyle: const TextStyle(
          color: MedicaColors.textSecondary,
        ),
        prefixIcon: const Icon(Icons
            .search), // Adding the search icon using Icon widget
      ),
      cursorColor: MedicaColors.black,
    );
  }
}
