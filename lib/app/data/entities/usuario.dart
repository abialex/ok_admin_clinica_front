class User {
  final int? id;
  final String? password;
  final DateTime? lastLogin;
  final bool? isSuperuser;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? isStaff;
  final bool? isActive;
  final DateTime? dateJoined;
  final bool? isNewPassword;
  final List<dynamic>? groups;
  final List<dynamic>? userPermissions;

  const User({
    this.id,
    this.password,
    this.lastLogin,
    this.isSuperuser,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.isNewPassword,
    this.groups,
    this.userPermissions,
  });

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'],
  //     password: json['password'],
  //     lastLogin: json['last_login'] != null ? DateTime.parse(json['last_login']) : null,
  //     isSuperuser: json['is_superuser'],
  //     username: json['username'],
  //     firstName: json['first_name'],
  //     lastName: json['last_name'],
  //     email: json['email'],
  //     isStaff: json['is_staff'],
  //     isActive: json['is_active'],
  //     dateJoined: json['date_joined'] != null ? DateTime.parse(json['date_joined']) : null,
  //     isNewPassword: json['isNewPassword'],
  //     groups: json['groups'],
  //     userPermissions: json['user_permissions'],
  //   );
  // }
}
