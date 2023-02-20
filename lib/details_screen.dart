// ignore_for_file: must_be_immutable, camel_case_types, sort_child_properties_last

import 'package:flower/model/item.dart';
import 'package:flower/shared/Colors.dart';
import 'package:flower/shared/appbare.dart';
import 'package:flutter/material.dart';

class Details_screen extends StatefulWidget {
  Item product;
  Details_screen({super.key, required this.product});
  // const Details_screen({Key? key}) : super(key: key);

  @override
  State<Details_screen> createState() => _Details_screenState();
}

class _Details_screenState extends State<Details_screen> {


  bool isShowMore = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("Details Screen"),
        actions: [

          ProductsAndPrice()
        ],
        // actions: [
        //   Row(
        //     children: [
        //       Stack(
        //         children: [
        //           Container(
        //               padding: const EdgeInsets.all(5),
        //               decoration: const BoxDecoration(
        //                   color: Color.fromARGB(211, 164, 255, 193),
        //                   shape: BoxShape.circle),
        //               child: const Text(
        //                 "8",
        //                 style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        //               )),
        //           IconButton(
        //               onPressed: () {
        //
        //               },
        //               icon:  Icon(Icons.add_shopping_cart)),
        //         ],
        //       ),
        //        Padding(
        //         padding: EdgeInsets.only(right: 12),
        //         child: Text("\$ ${widget.product.price} "),
        //       )
        //     ],
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Image(image: AssetImage(widget.product.imgPath)),
            const SizedBox(
              height: 22,
            ),
             Text(
              "\$ ${widget.product.price} ",
              style:  TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  child: const Text(
                    "New",
                    style: TextStyle(fontSize: 15),
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 129, 129),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Color.fromARGB(255, 255, 191, 0),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 66,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.edit_location,
                      size: 26,
                      color: Color.fromARGB(168, 3, 65, 27),
                      // color: Color.fromARGB(255, 186, 30, 30),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                     Text(
                      widget.product.location,
                      style: const TextStyle(fontSize: 19),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Details :",
                  style: TextStyle(fontSize: 22),

                ),

              ),
            ),
      const SizedBox(
      height: 16,
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
      "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). The biological function of a flower is to facilitate reproduction, usually by providing a mechanism for the union of sperm with eggs. Flowers may facilitate outcrossing (fusion of sperm and eggs from different individuals in a population) resulting from cross-pollination or allow selfing (fusion of sperm and egg from the same flower) when self-pollination occurs.",
      style: const TextStyle(
      fontSize: 18,
      ),
        maxLines: isShowMore ? 3 : null,
        overflow: TextOverflow.fade,
      ),

    ),
          TextButton(onPressed: (){setState(() {
            isShowMore = !isShowMore;
          });}, child:
          Text(  isShowMore ? "Show more" : "Show less",style: const TextStyle(
            fontSize: 18,
          ),
          )),
            ],
        ),
      ),
    );
  }
}
