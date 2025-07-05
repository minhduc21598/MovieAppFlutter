import 'package:movie_world/screens/detail_page/models/cast_model.dart';

class CastAndCrewProvider {
  List<Cast> _listCast = [];
  List<Crew> _listCrew = [];

  static final CastAndCrewProvider _singleton = CastAndCrewProvider._internal();

  factory CastAndCrewProvider() {
    return _singleton;
  }

  CastAndCrewProvider._internal();

  List<Cast> get listCast => _listCast;
  List<Crew> get listCrew => _listCrew;

  void saveListCast(List<Cast> list) {
    _listCast = list;
  }

  void saveListCrew(List<Crew> list) {
    _listCrew = list;
  }
}
