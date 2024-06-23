import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/util/shared_preferences.dart';
import 'package:myapp/view/analisis/analisis_list.dart';
import 'package:myapp/view/analisis/evaluacion_view.dart';
import 'package:myapp/view/auth/login_view.dart';
import 'package:myapp/view/auth/register_view.dart';
import 'package:myapp/view/home/home_view.dart';
import 'package:myapp/view/parcela/parcela_list_view.dart';
import 'package:myapp/view/parcela/parcela_maps_view.dart';

void main() async{
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    '/home': (context) => HomeView(),
    '/login': (context) => LoginView(),
    '/signup': (context) => RegisterView(),
    '/parcela': (context) => ParcelaListView(),
    '/mapsParcelas': (context) => ParcelaMapsView(),
    '/analisis': (context) => AnalisisListView(),
    '/evaluacion': (context) => EvaluacionView(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/login',
      routes: _routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}