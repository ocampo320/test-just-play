import 'pagination.dart';
import 'player_data.dart';

class PlayerResponse {
  List<Data>? data;
  Pagination? pagination;
  String? timezone;

  PlayerResponse(
      {this.data,
      this.pagination,
      this.timezone});

  PlayerResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    data['timezone'] = timezone;
    return data;
  }
}
