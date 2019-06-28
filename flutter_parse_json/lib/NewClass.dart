class NewClass {
  String id;
  String name;
  int score;

  NewClass({this.id, this.name, this.score});

  NewClass.fromJson(Map<String, dynamic> json) {    
    this.id = json['id'];
    this.name = json['name'];
    this.score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['score'] = this.score;
    return data;
  }

}
