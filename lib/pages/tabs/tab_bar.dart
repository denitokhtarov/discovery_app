import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/products_models/products.dart';
import 'package:minimal_eccomerce_app/tabs_model.dart';
import 'package:provider/provider.dart';

class HomePageTabBar extends StatelessWidget {
  final List<ProductInfo> products;
  const HomePageTabBar({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    TabsModel provider = Provider.of<TabsModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TabBar(
        onTap: provider.onTap,
        dividerColor: Colors.transparent,
        physics: const BouncingScrollPhysics(),
        tabAlignment: TabAlignment.center,
        labelStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        isScrollable: true,
        labelColor: Colors.white,
        enableFeedback: true,
        splashBorderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: const Color(0xFF48d861),
          border: Border.all(width: 2, color: Colors.transparent),
          borderRadius: BorderRadius.circular(18),
        ),
        tabs: provider.tabs,
      ),
    );
  }
}
