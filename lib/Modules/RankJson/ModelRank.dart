class RankJson {
  int? position;
  String? pontos;
  String? level;
  String? tempo;
  String? date;

  RankJson({this.position, this.pontos, this.level, this.tempo, this.date});

  RankJson.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    pontos = json['pontos'];
    level = json['level'];
    tempo = json['tempo'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['pontos'] = this.pontos;
    data['level'] = this.level;
    data['tempo'] = this.tempo;
    data['date'] = this.date;
    return data;
  }
}
