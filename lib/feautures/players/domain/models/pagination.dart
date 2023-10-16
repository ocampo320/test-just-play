
class Pagination {
  int? count;
  int? perPage;
  int? currentPage;
  String? nextPage;
  bool? hasMore;

  Pagination(
      {this.count,
      this.perPage,
      this.currentPage,
      this.nextPage,
      this.hasMore});

  Pagination.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    nextPage = json['next_page'];
    hasMore = json['has_more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    data['count'] = count;
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    data['next_page'] = nextPage;
    data['has_more'] = hasMore;
    return data;
  }
}