class CastModel {
  final int? id;
  final List<Cast>? cast;
  final List<Crew>? crew;

  CastModel({this.id, this.cast, this.crew});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'],
      cast: (json['cast'] as List).map((item) => Cast.fromJson(item)).toList(),
      crew: (json['crew'] as List).map((item) => Crew.fromJson(item)).toList(),
    );
  }
}

class Crew {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? creditId;
  final String? department;
  final String? job;

  Crew(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }
}

class Cast {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final int? castId;
  final String? profilePath;
  final String? creditId;
  final String? character;
  final int? order;

  Cast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.creditId,
      this.character,
      this.order});

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      castId: json['cast_id'],
      creditId: json['credit_id'],
      character: json['character'],
      order: json['order'],
    );
  }
}
