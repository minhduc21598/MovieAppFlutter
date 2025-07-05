class GenreModel {
  final int? id;
  final String? name;

  GenreModel({this.id, this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(id: json['id'], name: json['name']);
  }
}
