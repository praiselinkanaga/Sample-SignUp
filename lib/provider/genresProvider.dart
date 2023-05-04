import "package:flutter/material.dart";
import 'package:signup/model/getGenresModel.dart';
import 'package:signup/provider/genresService.dart';

class GenresProvider extends ChangeNotifier {
  List<String> filters = <String>[];
  GetGenresModel getGenresModel = GetGenresModel();

  getGenresModelProvider() async {
    getGenresModel = (await GenresService().getGenresApi())!;
    notifyListeners();
  }

  void addOrRemoveGenres({val}) {
    filters = val;
    notifyListeners();
  }

  clearFilterGenres({del}) {
    filters.remove(del);
    notifyListeners();
  }
}
