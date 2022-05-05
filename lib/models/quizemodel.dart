class Quizes {
  int? id;
  String? name;
  String? description;
  String? image;
  String? slug;
  int? questionsCount;

  Quizes(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.slug,
      this.questionsCount});

  Quizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    slug = json['slug'];
    questionsCount = json['questions_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['slug'] = slug;
    data['questions_count'] = questionsCount;
    return data;
  }
}
