import 'package:flutter/material.dart';

import '../utils/constants/image_strings.dart';

List<int> ratings = [1, 2, 3, 4, 5];
List<int> distances = [600, 1000];

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
    'profileImage': MedicaImages.user2,
    'name': 'Dr. John Doe',
    'speciality': 'General',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.user3,
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
    'image': MedicaImages.user1,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.user2,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.user3,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.user1,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.user2,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
  {
    'image': MedicaImages.user3,
    'title':
        "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
    'date': DateTime.now(),
    'length': 5,
  },
];
