class Data {
  int? id;
  int? sportId;
  int? countryId;
  int? nationalityId;
  int? positionId;
  int? detailedPositionId;
  int? typeId;
  String? commonName;
  String? firstname;
  String? lastname;
  String? name;
  String? displayName;
  String? imagePath;
  int? height;
  int? weight;
  String? dateOfBirth;
  String? gender;

  Data(
      {this.id,
      this.sportId,
      this.countryId,
      this.nationalityId,
      this.positionId,
      this.detailedPositionId,
      this.typeId,
      this.commonName,
      this.firstname,
      this.lastname,
      this.name,
      this.displayName,
      this.imagePath,
      this.height,
      this.weight,
      this.dateOfBirth,
      this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportId = json['sport_id'];
    countryId = json['country_id'];
    nationalityId = json['nationality_id'];

    positionId = json['position_id'];
    detailedPositionId = json['detailed_position_id'];
    typeId = json['type_id'];
    commonName = json['common_name'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    name = json['name'];
    displayName = json['display_name'];
    imagePath = json['image_path'];
    height = json['height'];
    weight = json['weight'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sport_id'] =sportId;
    data['country_id'] = countryId;
    data['nationality_id'] = nationalityId;

    data['position_id'] = positionId;
    data['detailed_position_id'] =detailedPositionId;
    data['type_id'] = typeId;
    data['common_name'] = commonName;
    data['firstname'] =firstname;
    data['lastname'] = lastname;
    data['name'] = name;
    data['display_name'] = displayName;
    data['image_path'] = imagePath;
    data['height'] = height;
    data['weight'] = weight;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    return data;
  }
}