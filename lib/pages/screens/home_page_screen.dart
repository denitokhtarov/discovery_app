import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minimal_eccomerce_app/elements/product_card.dart';
import 'package:minimal_eccomerce_app/elements/sales_banner.dart';
import 'package:minimal_eccomerce_app/pages/tabs/tab_bar.dart';
import 'package:minimal_eccomerce_app/products_models/products.dart';
import 'package:minimal_eccomerce_app/tabs_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    super.key,
    required this.products,
  });

  final List<ProductInfo> products;

  final List<ProductInfo> tabProducts = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 35),
            const SearchBarWidget(),
            const SizedBox(height: 30),
            const SalesCard(),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Все',
                      style: TextStyle(color: Color(0xFF48d861), fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            HomePageTabBar(products: products),
            const SizedBox(height: 15),
            const ProductsView()
          ],
        ),
      ),
    );
  }
}

class ProductsView extends StatefulWidget {
  const ProductsView({
    super.key,
  });

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    List<ProductInfo> products = Provider.of<TabsModel>(context).products;
    return SizedBox(
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 24,
            crossAxisCount: 2,
            childAspectRatio: 0.75),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              final product = products[index];
              Navigator.pushNamed(context, '/product_page', arguments: product);
            },
            child: ProductCard(
              category: products[index].category,
              model: products[index].model,
              memory: products[index].memory,
              description: products[index].description,
              image: products[index].image,
              price: products[index].price,
              counts: products[index].counts,
              rating: products[index].rating,
            ),
          );
        },
      ),
    );
  }
}

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  FocusNode myFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color.fromARGB(255, 20, 20, 20)
            : const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          focusNode: myFocus,
          onTap: () {
            myFocus.unfocus();
            Navigator.pushNamed(context, '/search_page');
          },
          decoration: const InputDecoration(
            labelText: 'Поиск',
            suffixIcon: Icon(Iconsax.search_normal_1),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
