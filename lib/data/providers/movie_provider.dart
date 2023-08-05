import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prov/data/models/movie_list_model.dart';

import '../const/const.dart';

class MovieProvide extends ChangeNotifier{
  MovieProvide({required this.dio});

  final Dio dio;

  MovieListModel? data;

  Future<void> getMovie(String name)async {
  try{ final response = await dio.get('', queryParameters: {
      'apikey': Consts.apiKey, 's': name,
    },
    );
    data = MovieListModel.fromJson(response.data);
  }catch(e) {
    print(e.toString(),
    );
  }
  notifyListeners();
}
}