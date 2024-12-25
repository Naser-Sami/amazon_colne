import 'package:flutter/material.dart';

import '../screen/_screens.dart';
import 'admin_app_bar.dart';

class AdminBottomNavigationBar extends StatefulWidget {
  const AdminBottomNavigationBar({super.key});

  @override
  State<AdminBottomNavigationBar> createState() => _AdminBottomNavigationBarState();
}

class _AdminBottomNavigationBarState extends State<AdminBottomNavigationBar> {
  int _page = 0;

  List<Widget> pages = [
    const ProductsScreen(),
    const Center(child: Text("Analytics Page")),
    const Center(child: Text("Orders Page")),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminAppBar(),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: updatePage,
        currentIndex: _page,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
          // POSTS
          BottomNavigationBarItem(
            icon: Container(
              width: _page == 0 ? 40 : 30,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: _page == 0
                        ? Theme.of(context).colorScheme.secondaryContainer
                        : Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          // ANALYTICS
          BottomNavigationBarItem(
            icon: Container(
              width: _page == 0 ? 40 : 30,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: _page == 1
                        ? Theme.of(context).colorScheme.secondaryContainer
                        : Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),
              child: const Icon(
                Icons.analytics_outlined,
              ),
            ),
            label: '',
          ),
          // ORDERS
          BottomNavigationBarItem(
            icon: Container(
              width: _page == 0 ? 40 : 30,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 2,
                    color: _page == 2
                        ? Theme.of(context).colorScheme.secondaryContainer
                        : Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),
              child: const Icon(
                Icons.all_inbox_outlined,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
