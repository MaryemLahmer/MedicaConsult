import 'package:medica_consult/utils/constants/image_strings.dart';

class Doctor {
  String profileImage;
  String name;
  String speciality;
  double rating;
  double distance;

  Doctor({
    required this.profileImage,
    required this.name,
    required this.speciality,
    required this.rating,
    required this.distance,
  });

  List<Doctor> doctorData = [
    Doctor(
      profileImage: MedicaImages.user1,
      name: 'Dr. John Doe',
      speciality: 'Cardiologist',
      rating: 4.8,
      distance: 700.0,
    ),
    Doctor(
      profileImage: MedicaImages.user2,
      name: 'Dr. Jane Smith',
      speciality: 'General',
      rating: 4.5,
      distance: 900.0,
    ),
    Doctor(
      profileImage: MedicaImages.user3,
      name: 'Dr. John Doe',
      speciality: 'Dentist',
      rating: 4.8,
      distance: 700.0,
    ),
    Doctor(
      profileImage: MedicaImages.user1,
      name: 'Dr. Jane Smith',
      speciality: 'Surgeon',
      rating: 4.5,
      distance: 900.0,
    ),
    Doctor(
      profileImage: MedicaImages.user2,
      name: 'Dr. John Doe',
      speciality: 'Covid-19',
      rating: 4.8,
      distance: 700.0,
    ),
    Doctor(
      profileImage: MedicaImages.user3,
      name: 'Dr. Jane Smith',
      speciality: 'Psychiatrist',
      rating: 4.5,
      distance: 900.0,
    ),
    Doctor(
      profileImage: MedicaImages.user1,
      name: 'Dr. Jane Smith',
      speciality: 'Lungs',
      rating: 4.5,
      distance: 900.0,
    ),
    Doctor(
      profileImage: MedicaImages.user3,
      name: 'Dr. John Doe',
      speciality: 'General',
      rating: 4.8,
      distance: 700.0,
    ),
    Doctor(
      profileImage: MedicaImages.user2,
      name: 'Dr. Jane Smith',
      speciality: 'Cardiologist',
      rating: 4.5,
      distance: 900.0,
    ),
    Doctor(
      profileImage: MedicaImages.user1,
      name: 'Dr. Jane Smith',
      speciality: 'Cardiologist',
      rating: 4.5,
      distance: 900.0,
    ),
    Doctor(
      profileImage: MedicaImages.user2,
      name: 'Dr. John Doe',
      speciality: 'Desntist',
      rating: 4.8,
      distance: 700.0,
    ),
    Doctor(
      profileImage: MedicaImages.user3,
      name: 'Dr. Jane Smith',
      speciality: 'Lungs',
      rating: 4.5,
      distance: 900.0,
    ),
  ];
}
