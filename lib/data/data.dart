
import '../utils/constants/image_strings.dart';

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
    'profileImage': MedicaImages.doctorFemale1,
    'name': 'Dr. John Doe',
    'speciality': 'Cardiologist',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.doctorFemale2,
    'name': 'Dr. Jane Smith',
    'speciality': 'Dermatologist',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.doctorFemale3,
    'name': 'Dr. John Doe',
    'speciality': 'Cardiologist',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.doctorMale1,
    'name': 'Dr. Jane Smith',
    'speciality': 'Dermatologist',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.doctorMale2,
    'name': 'Dr. John Doe',
    'speciality': 'Cardiologist',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.cuteUser,
    'name': 'Dr. Jane Smith',
    'speciality': 'Dermatologist',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.cuteUser1,
    'name': 'Dr. Jane Smith',
    'speciality': 'Dermatologist',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.cuteUser3,
    'name': 'Dr. John Doe',
    'speciality': 'Cardiologist',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.oldUser,
    'name': 'Dr. Jane Smith',
    'speciality': 'Dermatologist',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.user1,
    'name': 'Dr. Jane Smith',
    'speciality': 'Dermatologist',
    'rating': 4.5,
    'distance': 900.0,
  },
  {
    'profileImage': MedicaImages.user2,
    'name': 'Dr. John Doe',
    'speciality': 'Cardiologist',
    'rating': 4.8,
    'distance': 700.0,
  },
  {
    'profileImage': MedicaImages.user3,
    'name': 'Dr. Jane Smith',
    'speciality': 'Dermatologist',
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
