import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:plant_rx/services/disease_provider.dart';
import 'package:plant_rx/src/Login_screen.dart';
import 'package:plant_rx/src/home_page/home.dart';

import 'package:plant_rx/src/home_page/models/disease_model.dart';
import 'package:plant_rx/src/suggestions_page/suggestions.dart';
import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DiseaseAdapter());

  await Hive.openBox<Disease>('plant_diseases');
  await Firebase.initializeApp();

  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DiseaseService>(
      create: (context) => DiseaseService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Disease Identifier_RX',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'SFRegular'),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case Suggestions.routeName:
                    return const Suggestions();
                  case Home.routeName:

                  default:
                    return FirebaseAuth.instance.currentUser!=null?Home():LoginScreen();
                }
              });
        },
      ),
    );
  }
}
