class SuggestKeywordModel {
  final int? id;
  final String? name;

  SuggestKeywordModel({this.id, this.name});

  factory SuggestKeywordModel.fromJson(Map<String, dynamic> json) {
    return SuggestKeywordModel(id: json['id'], name: json['name']);
  }
}
