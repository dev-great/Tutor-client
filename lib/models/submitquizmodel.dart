class SubmitQuiz {
  int? id;
  QuiztakerSet? quiztakerSet;
  List<QuestionSet>? questionSet;
  String? name;
  String? description;
  String? image;
  String? slug;
  bool? rollOut;
  String? timestamp;

  SubmitQuiz(
      {this.id,
      this.quiztakerSet,
      this.questionSet,
      this.name,
      this.description,
      this.image,
      this.slug,
      this.rollOut,
      this.timestamp});

  SubmitQuiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quiztakerSet = json['quiztaker_set'] != null
        ? QuiztakerSet.fromJson(json['quiztaker_set'])
        : null;
    if (json['question_set'] != null) {
      questionSet = <QuestionSet>[];
      json['question_set'].forEach((v) {
        questionSet!.add(QuestionSet.fromJson(v));
      });
    }
    name = json['name'];
    description = json['description'];
    image = json['image'];
    slug = json['slug'];
    rollOut = json['roll_out'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (quiztakerSet != null) {
      data['quiztaker_set'] = quiztakerSet!.toJson();
    }
    if (questionSet != null) {
      data['question_set'] = questionSet!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['slug'] = slug;
    data['roll_out'] = rollOut;
    data['timestamp'] = timestamp;
    return data;
  }
}

class QuiztakerSet {
  int? id;
  List<UsersanswerSet>? usersanswerSet;
  int? score;
  bool? completed;
  String? timestamp;
  String? dateCompleted;
  int? user;
  int? quiz;

  QuiztakerSet(
      {this.id,
      this.usersanswerSet,
      this.score,
      this.completed,
      this.timestamp,
      this.dateCompleted,
      this.user,
      this.quiz});

  QuiztakerSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['usersanswer_set'] != null) {
      usersanswerSet = <UsersanswerSet>[];
      json['usersanswer_set'].forEach((v) {
        usersanswerSet!.add(UsersanswerSet.fromJson(v));
      });
    }
    score = json['score'];
    completed = json['completed'];
    timestamp = json['timestamp'];
    dateCompleted = json['date_completed'];
    user = json['user'];
    quiz = json['quiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (usersanswerSet != null) {
      data['usersanswer_set'] = usersanswerSet!.map((v) => v.toJson()).toList();
    }
    data['score'] = score;
    data['completed'] = completed;
    data['timestamp'] = timestamp;
    data['date_completed'] = dateCompleted;
    data['user'] = user;
    data['quiz'] = quiz;
    return data;
  }
}

class UsersanswerSet {
  int? id;
  int? quizTaker;
  int? question;
  int? answer;

  UsersanswerSet({this.id, this.quizTaker, this.question, this.answer});

  UsersanswerSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizTaker = json['quiz_taker'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quiz_taker'] = quizTaker;
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}

class QuestionSet {
  int? id;
  List<AnswerSet>? answerSet;
  String? label;
  int? order;
  int? quiz;

  QuestionSet({this.id, this.answerSet, this.label, this.order, this.quiz});

  QuestionSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['answer_set'] != null) {
      answerSet = <AnswerSet>[];
      json['answer_set'].forEach((v) {
        answerSet!.add(AnswerSet.fromJson(v));
      });
    }
    label = json['label'];
    order = json['order'];
    quiz = json['quiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (answerSet != null) {
      data['answer_set'] = answerSet!.map((v) => v.toJson()).toList();
    }
    data['label'] = label;
    data['order'] = order;
    data['quiz'] = quiz;
    return data;
  }
}

class AnswerSet {
  int? id;
  int? question;
  String? label;

  AnswerSet({this.id, this.question, this.label});

  AnswerSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['label'] = label;
    return data;
  }
}
