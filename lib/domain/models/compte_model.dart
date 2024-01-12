class CompteModel {
  int? id;
  String? email;
  String? phoneNumber;
  bool? isActive;
  String? role;

  CompteModel(
      {this.id, this.email, this.phoneNumber, this.isActive, this.role});

  CompteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isActive = json['isActive'];
    role = json['role'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'isActive': isActive,
      'role': role
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'id: $id, email: $email, phoneNumber: $phoneNumber, isActive: $isActive, role: $role';
  }
}
