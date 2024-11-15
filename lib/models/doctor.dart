class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String availableTime;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.availableTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      availableTime: json['available_time'],
    );
  }
}
