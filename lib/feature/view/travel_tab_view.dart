import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/view/travel_view.dart';

enum _TravelPages { home, bookmark, notification, profile }

class TravelTabBarView extends StatelessWidget {
  const TravelTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _TravelPages.values.length,
      child: const Scaffold(
          bottomNavigationBar: BottomAppBar(
              child: TabBar(tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.bookmark_add_outlined)),
            Tab(icon: Icon(Icons.notification_add_outlined)),
            Tab(icon: Icon(Icons.person)),
          ])),
          body: TabBarView(children: [
            TravelView(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ])),
    );
  }
}
