class MyQuizes {
  int? id;
  String? name;
  String? description;
  String? image;
  String? slug;
  int? questionsCount;
  bool? completed;
  int? score;
  int? progress;

  MyQuizes(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.slug,
      this.questionsCount,
      this.completed,
      this.score,
      this.progress});

  MyQuizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    slug = json['slug'];
    questionsCount = json['questions_count'];
    completed = json['completed'];
    score = json['score'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['slug'] = slug;
    data['questions_count'] = questionsCount;
    data['completed'] = completed;
    data['score'] = score;
    data['progress'] = progress;
    return data;
  }
}
