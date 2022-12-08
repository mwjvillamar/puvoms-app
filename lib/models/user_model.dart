class UserObject {
  //class name shouldn't be the same with other packages
  //Flutter is a null-safe framework, check operators and stuff...
  
  final String? uid;
  
  UserObject({this.uid});
  
}

class UserData {
  final String uid;
  final String firstName;
  final String lastName;
  final String role;
  final String phoneNum;
  final String email;
  
  UserData({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.phoneNum,
    required this.email,
  });
}