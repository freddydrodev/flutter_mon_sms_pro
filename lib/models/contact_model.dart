class ContactModel {
  final String phone;
  final String? id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? sex; // M | F

  ContactModel({
    required this.phone,
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.sex,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      sex: json['sex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'sex': sex,
    };
  }
}
