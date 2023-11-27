import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:projek/utama/homepage.dart';
import 'package:projek/utama/redirect.dart';
import 'package:projek/helper/sharedPreference.dart';
import 'model/dataModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
  SharedPreference().getLoginStatus().then((status) {
    runApp(MaterialApp

      (debugShowCheckedModeBanner:false,
        home: status ? HomePage() : Redirect()));
  });
  // runApp(const MyApp());
}


void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}

