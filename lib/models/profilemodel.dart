class Profile {
  int? id;
  int? phonenumber;
  String? address;
  String? profilepix;
  String? timestamp;
  int? user;

  Profile(
      {this.id,
      this.phonenumber,
      this.address,
      this.profilepix,
      this.timestamp,
      this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phonenumber = json['phonenumber'];
    address = json['address'];
    profilepix = json['profilepix'];
    timestamp = json['timestamp'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phonenumber'] = phonenumber;
    data['address'] = address;
    data['profilepix'] = profilepix;
    data['timestamp'] = timestamp;
    data['user'] = user;
    return data;
  }
}
