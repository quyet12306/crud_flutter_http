class Persion {
  final String firstname;
  final String lastname;
  final String id;
  final String message;

  const Persion({
    required this.firstname,
    required this.lastname,
    required this.id,
    required this.message,
  });

  factory Persion.fromJson(Map<String, dynamic> json) {
    return Persion(
      firstname: json['first_name'],
      lastname: json['last_name'],
      id: json['id'],
      message: json['message'],
    );
  }
}
