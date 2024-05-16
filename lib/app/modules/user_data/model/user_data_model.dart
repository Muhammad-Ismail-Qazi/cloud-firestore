class UserModel{
  late  String name;
  late  String email;
  late  String contact ;
  late  String age;
  late  String profileURL;

  UserModel( {
    required this.name, required this.email,required this.contact,required this.age,required this.profileURL
});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'contact': contact,
      'age': age,
      'profileURL': profileURL,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ,
      email: map['email'],
      contact: map['contact'] ,
      age: map['age'] ,
      profileURL:map['profileURL'],
    );
  }
}