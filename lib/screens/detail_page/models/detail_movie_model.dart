class BelongsToCollection {
  final int? id;
  final String? name;
  final String? backdropPath;
  final String? posterPath;

  BelongsToCollection({this.id, this.name, this.backdropPath, this.posterPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      name: json['name'],
      posterPath: json['poster_path'],
    );
  }
}

class Genres {
  final int? id;
  final String? name;

  Genres({
    this.id,
    this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompany {
  final int? id;
  final String? name;
  final String? logoPath;
  final String? originCountry;

  ProductionCompany({this.id, this.name, this.logoPath, this.originCountry});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logoPath: json['name'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountry {
  final String? iso31661;
  final String? name;

  ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

class SpokenLanguage {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguage({this.englishName, this.iso6391, this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
        iso6391: json['iso_639_1'],
        name: json['name'],
        englishName: json['english_name']);
  }
}

class DetailMovieModel {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genres>? genres;
  final String? homepage;
  final String? imdbId;
  final List<String>? originCountry;
  final List<ProductionCompany>? productionCompanies;
  final List<dynamic>? productionCountries;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;

  DetailMovieModel(
      {this.adult,
      this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.imdbId,
      this.originCountry,
      this.productionCompanies,
      this.productionCountries,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline});

  factory DetailMovieModel.fromJson(Map<String, dynamic> json) {
    return DetailMovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? BelongsToCollection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'],
      genres: (json['genres'] as List)
          .map((item) => Genres.fromJson(item))
          .toList(),
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country']),
      productionCompanies: (json['production_companies'] as List)
          .map((item) => ProductionCompany.fromJson(item))
          .toList(),
      productionCountries: (json['production_countries'] as List)
          .map((item) => ProductionCountry.fromJson(item))
          .toList(),
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: (json['spoken_languages'] as List)
          .map((item) => SpokenLanguage.fromJson(item))
          .toList(),
      status: json['status'],
      tagline: json['tagline'],
    );
  }
}
