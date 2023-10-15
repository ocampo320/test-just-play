import 'package:kncha_app/feautures/home/domain/models/type_courts.dart';
import 'package:kncha_app/feautures/home/domain/models/type_play.dart';

class Utils {
  static List<String?> convertListToNames(List<TypeCourt> list) {
    return list.map((court) => court.nombre).toList();
  }
  static List<String?> convertListToNamesPlay(List<TypePlay> list) {
    return list.map((court) => court.nombre).toList();
  }
}
