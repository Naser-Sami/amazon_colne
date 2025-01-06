import 'package:amazon_clone/features/_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

  void fetchDealOfDay() async {
    context.read<ProductsBloc>().add(GetDealOfDayEvent());
  }

  void navigateToDetailScreen(ProductEntities product) {
    GoRouter.of(context).push(ProductDetailScreen.routeName, extra: product);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsError) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is ProductsLoaded) {
          return GestureDetector(
            onTap: () => navigateToDetailScreen(state.products.first),
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
                    state.products.first.images.first,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\$${state.products.first.price}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
                  child: Text(
                    state.products.first.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: state.products.first.images
                        .map(
                          (e) => Image.network(
                            e,
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
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
