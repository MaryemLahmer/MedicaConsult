import 'package:flutter/material.dart';

import '../utils/constants/image_strings.dart';

List<int> ratings = [1, 2, 3, 4, 5];
List<int> distances = [600, 1000];

List<Map<String, dynamic>> messagesArray = [
  {
    'sender': "Alice",
    'content': "Hey, how's it going?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Did you see the latest episode of that show?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "I can't believe what happened in the meeting today!",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "Are you free this weekend?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Remember to bring the documents tomorrow.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "Just wanted to remind you about the party on Friday.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Can you please send me the report ASAP?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Did you hear about the new project we're starting?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "I'm running a bit late, will be there in 10 minutes.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "What do you think about the proposal?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Can we have a quick chat about the client meeting?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Don't forget to RSVP for the event next week.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "Have you tried the new restaurant downtown?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "Let's catch up over coffee sometime.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Could you please review this document for me?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "I'll be out of the office for the rest of the day.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "The deadline for the project is approaching fast.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "Let's plan a team outing for next month.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "Could you give me a hand with this task?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Don't worry, we'll figure it out together.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "I'm so excited about the upcoming conference!",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Let's discuss the agenda for the meeting tomorrow.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "Just wanted to say thanks for your help.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Have a great weekend!",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Did you get a chance to review the presentation?",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Let's aim to finish the project by Friday.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "I'll send you the details later today.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "Don't forget to call the client at 2 PM.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "bob",
    'content': "I'll be in the office early tomorrow.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "Let's schedule a team meeting for next week.",
    'time': DateTime.now(),
    'type': "text",
  },
  {
    'sender': "Alice",
    'content': "Just checking in to see how everything's going.",
    'time': DateTime.now(),
    'type': "text",
  },
];

List<Map<String, dynamic>> doctorCategories = [
  {
    'name': 'General',
    'icon': Icons.local_hospital,
  },
  {
    'name': 'Lungs',
    'icon': Icons.local_hospital,
  },
  {
    'name': 'Dentist',
    'icon': Icons.local_hospital,
  },
  {
    'name': 'Psychiatrist',
    'icon': Icons.local_hospital,
  },
  {
    'name': 'Covid-19',
    'icon': Icons.local_hospital,
  },
  {
    'name': 'Surgeon',
    'icon': Icons.local_hospital,
  },
  {
    'name': 'Cardiologist',
    'icon': Icons.local_hospital,
  },
];

List<String> articleCategories = [
  'Newest',
  'Conditions',
  'Prevention',
  'Nutrition',
  'Fitness',
  'MentalHealth',
  'Wellness',
  'Medication',
  'Treatment',
  'Exercise',
  'Therapy',
];

List<Map<String, dynamic>> notifications = [
  {
    'subject': 'Appointment reminder',
    'type': 'reminder',
    'time': DateTime.now(),
    'content': "click to see all your upcoming appointments."
  },
  {
    'subject': 'Appointment success',
    'type': 'success',
    'time': DateTime.now(),
    'content': "click to check your appointment history."
  },
  {
    'subject': 'Credit card connected',
    'type': 'payment',
    'time': DateTime.now(),
    'content': "click to check you payment settings."
  },
  {
    'subject': 'Appointment canceled',
    'type': 'cancel',
    'time': DateTime.now(),
    'content': "click to check your appointment history."
  },
];

List<Map<String, dynamic>> messages = [
  {
    'senderProfileImage': MedicaImages.user1,
    'senderName': 'Dr. John Doe',
    'time': DateTime.now(),
    'content':
        "I’ve been suffering from headache and cold for 3 days, I took 2 tablets of dolo, but still pain"
  },
  {
    'senderProfileImage': MedicaImages.user2,
    'senderName': 'Dr. John Doe',
    'time': DateTime.now(),
    'content':
        "I’ve been suffering from headache and cold for 3 days, I took 2 tablets of dolo, but still pain"
  },
  {
    'senderProfileImage': MedicaImages.user3,
    'senderName': 'Dr. John Doe',
    'time': DateTime.now(),
    'content':
        "I’ve been suffering from headache and cold for 3 days, I took 2 tablets of dolo, but still pain"
  },
  {
    'senderProfileImage': MedicaImages.user1,
    'senderName': 'Dr. John Doe',
    'time': DateTime.now(),
    'content':
        "I’ve been suffering from headache and cold for 3 days, I took 2 tablets of dolo, but still pain"
  },
];

List<Map<String, dynamic>> appointmentData = [
  {
    'doctorProfileImage': MedicaImages.user1,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Confirmed"
  },
  {
    'doctorProfileImage': MedicaImages.user2,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Pending"
  },
  {
    'doctorProfileImage': MedicaImages.user3,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Canceled"
  },
  {
    'doctorProfileImage': MedicaImages.user1,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Completed"
  },
  {
    'doctorProfileImage': MedicaImages.user1,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Confirmed"
  },
  {
    'doctorProfileImage': MedicaImages.user2,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Pending"
  },
  {
    'doctorProfileImage': MedicaImages.user3,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Canceled"
  },
  {
    'doctorProfileImage': MedicaImages.user1,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Completed"
  },
  {
    'doctorProfileImage': MedicaImages.user1,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Confirmed"
  },
  {
    'doctorProfileImage': MedicaImages.user2,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Pending"
  },
  {
    'doctorProfileImage': MedicaImages.user3,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Canceled"
  },
  {
    'doctorProfileImage': MedicaImages.user1,
    'doctorName': 'Dr. John Doe',
    'doctorSpeciality': 'Cardiologist',
    'date': DateTime.now(),
    'time': DateTime.now(),
    'status': "Completed"
  },
];

List<Map<String, dynamic>> medicineData = [
  {
    'medicineImage': MedicaImages.medicine1,
    'name': 'aspirine',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': true
  },
  {
    'medicineImage': MedicaImages.medicine2,
    'name': 'viagra',
    'quantity': 4,
    'type': 'tablet',
    'price': 20.99,
    'rating': 4.5,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine3,
    'name': 'panadol',
    'quantity': 4,
    'type': 'tablet',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine1,
    'name': 'aspirine',
    'quantity': 4,
    'type': 'tablet',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine2,
    'name': 'viagra',
    'quantity': 4,
    'type': 'tablet',
    'price': 20.99,
    'rating': 4.5,
    'description': "heeeeyel",
    'onSale': true
  },
  {
    'medicineImage': MedicaImages.medicine3,
    'name': 'panadol',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine1,
    'name': 'aspirine',
    'quantity': 4,
    'type': 'tablet',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine2,
    'name': 'viagra',
    'quantity': 4,
    'type': 'tablet',
    'price': 20.99,
    'rating': 4.5,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine3,
    'name': 'panadol',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': true
  },
  {
    'medicineImage': MedicaImages.medicine1,
    'name': 'aspirine',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine2,
    'name': 'viagra',
    'quantity': 4,
    'type': 'tablet',
    'price': 20.99,
    'rating': 4.5,
    'description': "heeeeyel",
    'onSale': true
  },
  {
    'medicineImage': MedicaImages.medicine3,
    'name': 'panadol',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine1,
    'name': 'aspirine',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': true
  },
  {
    'medicineImage': MedicaImages.medicine2,
    'name': 'viagra',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.5,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine3,
    'name': 'panadol',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine1,
    'name': 'aspirine',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': false
  },
  {
    'medicineImage': MedicaImages.medicine2,
    'name': 'viagra',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.5,
    'description': "heeeeyel",
    'onSale': true
  },
  {
    'medicineImage': MedicaImages.medicine3,
    'name': 'panadol',
    'quantity': 4,
    'type': 'liquid',
    'price': 20.99,
    'rating': 4.8,
    'description': "heeeeyel",
    'onSale': true
  },
];

List<Map<String, dynamic>> doctorData = [
  {
    'profileImage': MedicaImages.user1,
    'name': 'Dr. John Doe',
    'speciality': 'Cardiologist',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.user2,
    'name': 'Dr. Jane Smith',
    'speciality': 'General',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.user3,
    'name': 'Dr. John Doe',
    'speciality': 'Dentist',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.user1,
    'name': 'Dr. Jane Smith',
    'speciality': 'Surgeon',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.user2,
    'name': 'Dr. John Doe',
    'speciality': 'Covid-19',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.user3,
    'name': 'Dr. Jane Smith',
    'speciality': 'Psychiatrist',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.user1,
    'name': 'Dr. Jane Smith',
    'speciality': 'Lungs',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.user3,
    'name': 'Dr. John Doe',
    'speciality': 'General',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.user2,
    'name': 'Dr. Jane Smith',
    'speciality': 'Cardiologist',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.user1,
    'name': 'Dr. Jane Smith',
    'speciality': 'Cardiologist',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.user2,
    'name': 'Dr. John Doe',
    'speciality': 'Desntist',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.user3,
    'name': 'Dr. Jane Smith',
    'speciality': 'Lungs',
    'rating': 4.5,
    'distance': 900.0,
  },
];

List<Map<String, dynamic>> articleData = [
  {
    'image': MedicaImages.fuck_off,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.lemon,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.virus,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.vaccine,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.stethoscope,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.dna,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
];
