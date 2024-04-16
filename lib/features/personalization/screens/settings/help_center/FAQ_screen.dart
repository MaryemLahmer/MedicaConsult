import 'package:flutter/material.dart';
import 'package:medica_consult/features/personalization/screens/test/questions.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../../../common/widgets/buttons/color_changing_button.dart';
import '../widgets/expansion_tile.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final controller = TextEditingController();
  static List<String> options = ['General', 'Account', 'Service', 'Payment'];
  List<String> pressedOptions = [];
  static List<Question> listOfQuestions = allQuestions;
  List<Question> displayList = List.from(listOfQuestions);

  void updateList(String value) {
    setState(() {
        displayList = listOfQuestions
            .where(
                (q) => q.question.toLowerCase().contains(value.toLowerCase()))
            .toList();
       if (pressedOptions != []){
         displayList = (listOfQuestions.where((q) => pressedOptions.contains(q.category)).toList());
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            children: [
              /// list of filters
              SizedBox(
                height: 80,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: options.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      return Row(
                        children: [
                          ColorChangingElevatedButton(
                            activeColor: MedicaColors.primary,
                            inactiveColor: MedicaColors.grey,
                            text: options[i],
                            selectedList: pressedOptions,
                          )
                        ],
                      );
                    }),
              ),

              /// search Bar
              TextField(
                controller: controller,
                onChanged: (value) => updateList(value),
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MedicaColors.lightGrey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    borderSide: const BorderSide(color: MedicaColors.accent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    borderSide:
                        const BorderSide(color: MedicaColors.borderPrimary),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintStyle: const TextStyle(
                    color: MedicaColors.textSecondary,
                  ), // Adding the search icon using Icon widget
                ),
                cursorColor: MedicaColors.black,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Scaffold(
                  body: ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) {
                        final questionWithAnswer = displayList[index];
                        return MedicaExpansionTile(
                            question: questionWithAnswer.question,
                            answer: questionWithAnswer.answer);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
