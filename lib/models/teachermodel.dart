class Teacher {
  int? id;
  String? tutor;
  String? email;
  String? phonenumber;
  String? location;
  String? subject;
  String? image;
  String? publisheddate;

  Teacher(
      {this.id,
      this.tutor,
      this.email,
      this.phonenumber,
      this.location,
      this.subject,
      this.image,
      this.publisheddate});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutor = json['tutor'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    location = json['location'];
    subject = json['subject'];
    image = json['image'];
    publisheddate = json['publisheddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tutor'] = tutor;
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['location'] = location;
    data['subject'] = subject;
    data['image'] = image;
    data['publisheddate'] = publisheddate;
    return data;
  }
}
