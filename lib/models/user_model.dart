
class UserModel {
  String fName = '';
  String lName = '';
  String userName = '';
  String password = '';

  UserModel({required this.fName,required this.lName,required this.userName,required this.password});

  UserModel.fromJson(Map<String,dynamic> json){
    fName = json['fname'] ?? '';
    lName = json['lname'] ?? '';
    userName = json['username'] ?? '';
    password = json['password'] ?? '';

  }

  Map<String, dynamic> toJson() => {
    'fname' : fName,
    'lname' : lName,
    'username' : userName,
    'password' : password,
  };
}