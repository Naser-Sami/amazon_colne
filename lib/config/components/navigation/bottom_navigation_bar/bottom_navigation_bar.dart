import 'package:flutter/material.dart';

import '/features/_features.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({super.key});

  @override
  State<BottomNavigationBarComponent> createState() => _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState extends State<BottomNavigationBarComponent> {
  int _page = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Scaffold(body: Center(child: Text("Cart"))),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: updatePage,
        currentIndex: _page,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
          // HOME
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

          // ACCOUNT
          BottomNavigationBarItem(
            icon: Container(
              width: _page == 1 ? 40 : 30,
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
                Icons.person_outline_outlined,
              ),
            ),
            label: '',
          ),

          // CART
          BottomNavigationBarItem(
            icon: Container(
              width: _page == 2 ? 40 : 30,
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
              child: Badge.count(
                count: 9,
                textColor: Colors.white,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
