import 'package:flutter/material.dart';

import 'feature/view/travel_tab_view.dart';
import 'feature/view/travel_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        
        tabBarTheme: TabBarTheme(labelColor: Colors.brown[400],
        unselectedLabelColor: Colors.grey.withOpacity(0.4),
        indicator: const BoxDecoration()),
        scaffoldBackgroundColor:Colors.white,
        appBarTheme: const AppBarTheme(elevation: 0,backgroundColor:Colors.white),
      ),
      home: const TravelTabBarView(),
    );
  }
}

