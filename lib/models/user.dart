class User{
  User({
    required this.uuid,
    required this.name,
    required this.location,
    required this.phoneNumber,
    required this.email,
    required this.age,
    required this.title,
  });

  String uuid;
  String name;
  String location;
  String phoneNumber;
  String email;
  int age;
  String title;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'location': location,
      'phoneNumber': phoneNumber,
      'email': email,
      'age': age,
      'title': title,
    };
  }

}