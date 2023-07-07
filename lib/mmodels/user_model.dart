class UserModel {
  String? uid;
  String? fullName;
  String? email;
  UserModel({this.uid, this.fullName, this.email});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullName = map["fullName"];
    email = map["email"];
  }
  
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullName": fullName,
      "email": email,
    };
  }
}
