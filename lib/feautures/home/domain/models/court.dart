class Court {
  String? court;
  String? date;
  String? user;
  int? count;
  String ?playType;
  String ?citie;

  Court(
      {this.court,
      this.date,
      this.user,
      this.count,
      this.playType,
      this.citie});

  Court.fromJson(Map<String, dynamic> json) {
    court = json['court'];
    date = json['date'];
    user = json['user'];
    count = json['count'];
    playType = json['playType'];
    citie = json['citie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['court'] = court;
    data['date'] = date;
    data['user'] = user;
    data['count'] = count;
    data['playType'] = playType;
    data['citie'] = citie;
    return data;
  }
}
