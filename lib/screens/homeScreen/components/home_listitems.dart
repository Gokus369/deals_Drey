import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../models/home_models.dart';

Widget homeProductGrid({
  required BuildContext context,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.width * 1.45,
    child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: 1.5 / .967,
      padding: const EdgeInsets.only(left: 12, right: 12),
      scrollDirection: Axis.horizontal,
      children: List.generate(
        8,
        (index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Image.asset("assets/images/prd.png"),
                        ),
                        const SizedBox(height: 5.0),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Samsung M2(Red,128GB)',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ColorsData.blackColor,
                                      height: 1.1,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .033,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                              const SizedBox(height: 2.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        height: MediaQuery.of(context).size.width * .05,
                        width: MediaQuery.of(context).size.width * .09,
                        decoration: BoxDecoration(
                            color: const Color(0xff00A73C),
                            borderRadius: BorderRadius.circular(5)),
                        child: const FittedBox(
                          child: Center(
                            child: Text(
                              '10% Off',
                              style: TextStyle(
                                color: ColorsData.whiteColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
