class Appointment {
  int _appointmentId;
  String _instructions;
  DateTime _date;

  Appointment({
    required int appointmentId,
    required String instructions,
    required DateTime date,
  })  : _appointmentId = appointmentId,
        _instructions = instructions,
        _date = date;

  int get getAppointmentId => _appointmentId;
  set setAppointmentId(int value) {
    _appointmentId = value;
  }

  String get getInstructions => _instructions;
  set setInstructions(String value) {
    _instructions = value;
  }

  DateTime get getDate => _date;
  set setDate(DateTime value) {
    _date = value;
  }
}
