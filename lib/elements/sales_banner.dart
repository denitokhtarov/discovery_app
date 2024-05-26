import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SalesCard extends StatelessWidget {
  const SalesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: const Color(0xFF48d861),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clearance',
                  style: GoogleFonts.montserrat(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Sales',
                  style: GoogleFonts.montserrat(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white),
                      elevation: MaterialStatePropertyAll(0),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          size: 18,
                          Icons.percent,
                          color: Color(0xFF48d861),
                        ),
                        Text(
                          '    До 50%',
                          style: TextStyle(
                            color: Color(0xFF48d861),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            width: 180,
            height: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                'assets/iphone15promax.png',
                isAntiAlias: true,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
