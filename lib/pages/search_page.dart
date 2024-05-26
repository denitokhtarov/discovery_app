import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minimal_eccomerce_app/products_models/products.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void onChanged(String value) {
    List<ProductInfo> results = [];
    if (value != '') {
      results = shopProducts
          .where((element) =>
              element.model.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      searchProducts = results;
    });
  }

  List<ProductInfo> searchProducts = [];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
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
                        onChanged: onChanged,
                        autofocus: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.search_normal_1),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: const ButtonStyle(),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Отменить',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                itemCount: searchProducts.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Container(
                      height: 1,
                      color: isDarkMode
                          ? const Color.fromARGB(255, 20, 20, 20)
                          : const Color.fromARGB(255, 240, 240, 240),
                    ),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/product_page',
                      arguments: searchProducts[index],
                    ),
                    child: ListTile(
                      title: Text(
                        searchProducts[index].model,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        searchProducts[index].category,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 138, 138, 138),
                          fontSize: 12,
                        ),
                      ),
                      leading: const Icon(Iconsax.clock, color: Colors.grey),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
