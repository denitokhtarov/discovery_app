import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String category;
  final String model;
  final List<int> memory;
  final String description;
  final String image;
  final double price;
  final Color? color;
  final int counts;
  final String rating;
  const ProductCard({
    super.key,
    required this.category,
    required this.model,
    required this.memory,
    required this.description,
    required this.image,
    required this.price,
    this.color,
    required this.counts,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: isDarkMode
                ? const Color.fromARGB(255, 20, 20, 20)
                : const Color.fromARGB(255, 238, 238, 238),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              child: Image.asset(
                image,
                fit: category == 'смартфоны' && model[0] == 'i'
                    ? BoxFit.cover
                    : BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  model,
                  style: GoogleFonts.inter(
                    color: const Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.star,
              color: Color.fromARGB(255, 255, 209, 59),
              size: 17,
            ),
            Text(
              rating,
              style: GoogleFonts.inter(fontWeight: FontWeight.w900),
            )
          ],
        ),
        Text(
          '\$${price.toInt()}',
          style: GoogleFonts.inter(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
