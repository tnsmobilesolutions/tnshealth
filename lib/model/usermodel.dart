class Data {
  String? uid;
  String? name;
  String? phonenumber;
  String? email;
  String? gender;
  String? bloodgroup;
  String? maritialstatus;
  String? height;
  String? weight;
  String? adress;

  Data({
    this.uid,
    this.name,
    this.phonenumber,
    this.email,
    // this.gender,
    // this.bloodgroup,
    // this.maritialstatus,
    // this.height,
    // this.weight,
    // this.adress
  });
//data from server
  factory Data.frommap(Map) {
    return Data(
        uid: Map['Chunu'],
        name: Map['Amrutanshu'],
        phonenumber: Map[8249090924],
        email: Map['amrutanshup@gmail.com']);
  }
  //data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phonenumber': phonenumber,
      'email': email
    };
  }
}
