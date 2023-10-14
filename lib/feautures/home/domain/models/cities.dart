class Cities {
  List<String>? ciudades;
  String? departamento;
  int? id;

  Cities({this.ciudades, this.departamento, this.id});

  Cities.fromJson(Map<String, dynamic> json) {
    ciudades = json['ciudades'].cast<String>();
    departamento = json['departamento'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ciudades'] = ciudades;
    data['departamento'] = departamento;
    data['id'] = id;
    return data;
  }
}
