class SaveAns {
  int? id;
  int? quizTaker;
  int? question;
  int? answer;

  SaveAns({this.id, this.quizTaker, this.question, this.answer});

  SaveAns.fromJson(Map<String, dynamic> json) {
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
