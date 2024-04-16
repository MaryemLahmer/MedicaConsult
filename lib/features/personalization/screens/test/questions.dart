class Question {
  final String question;
  final String answer;
  final String? category;

  const Question({
    required this.question,
    required this.answer,
    this.category,
  });
}

const allQuestions = [
  Question(
      question: 'How to use MedicaConsult ?',
      answer: 'Answer to How to use MedicaConsult ?',
      category: 'General'),
  Question(
      question: 'How to pay for MedicaConsult ?',
      answer: 'Answer to How to use MedicaConsult ?',
      category: 'Payment'),
  Question(
      question: 'How to delete my Medica Account ?',
      answer: 'Answer to How to use MedicaConsult ?',
      category: 'Account'),
  Question(
      question: 'How to stop showing notifications from MedicaConsult ?',
      answer: 'Answer to How to use MedicaConsult ?',
      category: 'General'),
  Question(
      question: 'How to use MedicaConsult ?',
      answer: 'Answer to How to use MedicaConsult ?',
      category: 'General'),
  Question(
      question: 'How to pay for MedicaConsult ?',
      answer: 'Answer to How to use MedicaConsult ?',
      category: 'Payment'),
  Question(
      question: 'How to delete my Medica Account ?',
      answer: 'Answer to How to use MedicaConsult ?',
      category: 'Account'),
  Question(
      question: 'How to stop showing notifications from MedicaConsult ?',
      answer: 'Answer to How to use MedicaConsult ?',
      category: 'Service'),
];
