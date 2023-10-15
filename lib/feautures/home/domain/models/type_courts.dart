class TypeCourt {
  String? nombre;

  TypeCourt({this.nombre});

  TypeCourt.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nombre'] = nombre;
    return data;
  }
}
