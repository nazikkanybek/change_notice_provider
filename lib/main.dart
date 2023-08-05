import 'package:flutter/material.dart';
import 'package:prov/data/providers/movie_provider.dart';
import 'package:prov/presentation/dio_settings.dart';
import 'package:prov/presentation/screens/home_page.dart';
import 'package:provider/provider.dart';

void main () {
  runApp(const MyApp()); 
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => MovieProvide(
      dio: DioSettings().dio,
      ),
      child: const MaterialApp(home: HomePage(),
    ),
    );
  }
}