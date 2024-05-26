import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_eccomerce_app/pages/screens/favourites_page_screen.dart';
import 'package:minimal_eccomerce_app/pages/screens/home_page_screen.dart';
import 'package:minimal_eccomerce_app/pages/screens/profile_page_screen.dart';
import 'package:minimal_eccomerce_app/pages/screens/search_page_screen.dart';
import 'package:minimal_eccomerce_app/products_models/products.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minimal_eccomerce_app/tabs_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<ProductInfo> products = shopProducts;
  List<Widget> body = [
    MainScreen(products: shopProducts),
    const SearchPageTab(),
    const FavouritesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Provider.of<TabsModel>(context).tabs.length,
      child: Scaffold(
        key: const PageStorageKey(''),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).canvasColor,
          title: Text(
            'Discovery',
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: IconButton(
                onPressed: () => (),
                icon: Icon(
                  Iconsax.bag_2,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            )
          ],
        ),
        body: body[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          selectedItemColor: const Color(0xFF48d861),
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Iconsax.home_15), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.search_normal_1), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.heart), label: 'Favourites'),
            BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
