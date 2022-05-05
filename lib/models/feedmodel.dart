class Feeds {
  int? id;
  String? body;
  String? postImage;
  String? publisheddate;
  String? updateddate;

  Feeds(
      {this.id,
      this.body,
      this.postImage,
      this.publisheddate,
      this.updateddate});

  Feeds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    postImage = json['PostImage'];
    publisheddate = json['publisheddate'];
    updateddate = json['updateddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    data['PostImage'] = postImage;
    data['publisheddate'] = publisheddate;
    data['updateddate'] = updateddate;
    return data;
  }
}

class FeedVideo {
  int? id;
  String? body;
  String? video;
  String? publisheddate;
  String? updateddate;

  FeedVideo(
      {this.id, this.body, this.video, this.publisheddate, this.updateddate});

  FeedVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    video = json['video'];
    publisheddate = json['publisheddate'];
    updateddate = json['updateddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    data['video'] = video;
    data['publisheddate'] = publisheddate;
    data['updateddate'] = updateddate;
    return data;
  }
}
