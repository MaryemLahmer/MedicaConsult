import 'package:flutter/material.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/features/personalization/screens/widgets/article_card.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/logging/logger.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Articles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement your options action here
            },
          ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: MedicaSizes.lg,
            right: MedicaSizes.lg,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: articleCategories.asMap().entries.map((entry) {
                    final index = entry.key;
                    final category = entry.value;
                    return TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            return index == _selectedCategoryIndex
                                ? MedicaColors.primary
                                : Colors.transparent;
                          },
                        ),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            return index == _selectedCategoryIndex
                                ? MedicaColors.white
                                : MedicaColors.black;
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                        MedicaLoggerHelper.info(
                            "Sellected category: $category");
                      },
                      child: Text(category),
                    );
                  }).toList(),
                ),
              ),
              Column(
                children: articleData.asMap().entries.map((entry) {
                  final index = entry.key;
                  final data = entry.value;
                  return ArticleCard(
                    image: data['image'],
                    title: data['title'],
                    date: data['date'],
                    length: data['length'],
                    onPressed: () {
                      MedicaLoggerHelper.info("Index: $index");
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
