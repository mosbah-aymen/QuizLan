class Question {
  int? id;
  String? content;
  List<String>? choices = [""];
  int? correctChoice = -1;
  Question({this.id, this.content, this.choices, this.correctChoice});
}
