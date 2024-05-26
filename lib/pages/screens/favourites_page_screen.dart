import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_eccomerce_app/counter_model.dart';

import 'package:minimal_eccomerce_app/products_models/products.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    bool horizontalOrientation =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (favouritesProdusts.isEmpty) {
      return const Center(
        child: Text('Корзина пуста'),
      );
    }

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: favouritesProdusts.length,
              itemBuilder: (BuildContext context, int index) {
                if (favouritesProdusts[index].length == 2) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          onPressed: (BuildContext context) {
                            favouritesProdusts
                                .remove(favouritesProdusts[index]);
                            setState(() {});
                          },
                          icon: Icons.delete,
                        )
                      ],
                    ),
                    child: FavouriteProductCard(
                      productInfo: favouritesProdusts[index][0],
                      memorySize: favouritesProdusts[index][1],
                    ),
                  );
                } else {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          onPressed: (BuildContext context) {
                            favouritesProdusts
                                .remove(favouritesProdusts[index]);

                            setState(() {});
                          },
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: FavouriteProductCard(
                      productInfo: favouritesProdusts[index][0],
                    ),
                  );
                }
              },
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: horizontalOrientation ? 0 : 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Цена:'),
                      Text(
                        '${Provider.of<CounterModel>(context).totalPrice().toInt()}\$',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF48d861),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: horizontalOrientation ? 0 : 15),
                        child: Text(
                          'Оплатить',
                          style: GoogleFonts.inter(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class FavouriteProductCard extends StatefulWidget {
  final ProductInfo productInfo;
  final int? memorySize;

  const FavouriteProductCard({
    super.key,
    required this.productInfo,
    this.memorySize,
  });

  @override
  State<FavouriteProductCard> createState() => _FavouriteProductCardState();
}

class _FavouriteProductCardState extends State<FavouriteProductCard> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SizedBox(
      height: 135,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 120,
                  width: 100,
                  child: Image.asset(
                    widget.productInfo.image,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productInfo.model,
                      style: GoogleFonts.inter(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    widget.memorySize == null
                        ? Text(
                            '${widget.productInfo.color}',
                            style: GoogleFonts.inter(
                                color:
                                    const Color.fromARGB(255, 156, 156, 156)),
                          )
                        : Text(
                            '${widget.memorySize} ГБ',
                            style: GoogleFonts.inter(
                              color: const Color.fromARGB(255, 156, 156, 156),
                            ),
                          ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '\$${widget.productInfo.price}',
                          style: GoogleFonts.inter(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ButtonCountProduct(
                          borderColor: const Color.fromARGB(255, 175, 175, 175),
                          text: '-',
                          textColor: isDarkMode ? Colors.white : Colors.black,
                          onTap: () {
                            Provider.of<CounterModel>(context, listen: false)
                                .decrement(widget.productInfo);
                          },
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${widget.productInfo.number}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        const SizedBox(width: 6),
                        ButtonCountProduct(
                          borderColor: const Color(0xFF48d861),
                          text: '+',
                          textColor: const Color(0xFF48d861),
                          onTap: () {
                            Provider.of<CounterModel>(context, listen: false)
                                .increment(widget.productInfo);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color.fromARGB(255, 39, 39, 39)
                    : const Color.fromARGB(255, 240, 240, 240),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonCountProduct extends StatelessWidget {
  final void Function() onTap;
  final Color borderColor;
  final String text;
  final Color textColor;
  const ButtonCountProduct({
    super.key,
    required this.borderColor,
    required this.text,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 15, color: textColor),
          )),
        ),
      ),
    );
  }
}
