import 'package:flutter/material.dart';

import '/core/_core.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {}

  void navigateToDetailScreen() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToDetailScreen,
      child: Column(
        spacing: 10,
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the day',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 235,
            child: Image.network(
              '',
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.topLeft,
            child: const Text(
              '\$100',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            child: const Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Constants.categoryImages
                  .map(
                    (e) => Image.asset(
                      e['image'] ?? "",
                      fit: BoxFit.fitWidth,
                      width: 100,
                      height: 100,
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              'See all deals',
              style: TextStyle(
                color: Colors.cyan[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
