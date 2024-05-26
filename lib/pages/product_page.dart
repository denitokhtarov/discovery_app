import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:minimal_eccomerce_app/products_models/products.dart';

class ProductPage extends StatefulWidget {
  final ProductInfo product;
  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Color selectedColor = const Color(0xFF48d861);
  int selected = 0;
  Color likeIconColor = Colors.red;
  bool likeButtonSelected = false;

  Widget memoryButtons(String text, int index) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return InkWell(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 30),
        decoration: BoxDecoration(
          color: selected == index ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected == index
                ? selectedColor
                : isDarkMode
                    ? const Color.fromARGB(255, 196, 196, 196)
                    : Colors.black,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            '  $text GB  ',
            style: TextStyle(
              color: selected == index
                  ? Colors.white
                  : isDarkMode
                      ? const Color.fromARGB(255, 196, 196, 196)
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color iconBorderColor = isDarkMode
        ? Colors.transparent
        : const Color.fromARGB(255, 236, 236, 236);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: iconBorderColor),
                              ),
                              child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Iconsax.arrow_left_2)),
                            ),
                            const Spacer(),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: iconBorderColor),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  if (!likeButtonSelected) {
                                    if (widget.product.memory.isNotEmpty) {
                                      favouritesProdusts.add([
                                        widget.product,
                                        widget.product.memory[selected]
                                      ]);
                                    } else {
                                      favouritesProdusts.add([widget.product]);
                                    }
                                  } else {
                                    favouritesProdusts.removeLast();
                                  }

                                  likeButtonSelected = !likeButtonSelected;
                                  setState(() {});
                                },
                                icon: const Icon(Iconsax.heart5),
                                color: likeButtonSelected
                                    ? likeIconColor
                                    : Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 10),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: iconBorderColor),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Iconsax.export)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 400,
                      child: Image.asset(
                        widget.product.image,
                        fit: widget.product.category == 'смартфоны' &&
                                widget.product.model[0] == 'i'
                            ? BoxFit.cover
                            : BoxFit.contain,
                        isAntiAlias: true,
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color.fromARGB(255, 29, 29, 29)
                          : const Color.fromARGB(255, 245, 245, 245),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.model,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: isDarkMode ? Colors.white : Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  width: 1.2,
                                  color:
                                      const Color.fromARGB(255, 196, 196, 196),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Color.fromARGB(255, 236, 177, 0),
                                    ),
                                    const SizedBox(width: 7),
                                    Text(
                                      widget.product.rating,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 7),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  width: 1.2,
                                  color:
                                      const Color.fromARGB(255, 196, 196, 196),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    Icon(
                                      Iconsax.like_15,
                                      color: Color(0xFF48d861),
                                      size: 18,
                                    ),
                                    SizedBox(width: 7),
                                    Text('94%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '117 reviews',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 196, 196, 196)),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          widget.product.description,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.product.memory.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: memoryButtons(
                                  widget.product.memory[index].toString(),
                                  index,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          height: 0.5,
                          color: Color.fromARGB(255, 196, 196, 196),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '\$${widget.product.price}',
                              style: GoogleFonts.inter(
                                fontSize: 27,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: const Color(0xFF48d861),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Text(
                                  'Добавить',
                                  style: GoogleFonts.inter(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
