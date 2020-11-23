import 'package:flutter/material.dart';
import 'package:the_glem_factory/model/Offer_model.dart';
import '../../constant.dart';


class OffersCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Offers For You',
                  style: kHeadingStyle,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'View All',
                        style: TextStyle(fontSize: 15),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                Offer offer = offers[index];
                return Container(
                  width: MediaQuery.of(context).size.height / 5,
                  height: MediaQuery.of(context).size.height / 4,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  child: Stack(
                    children: [
                      Align(
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Image(
                                    image: AssetImage(offer.imgUrl),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            offer.title,
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '60 Min',
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '₹ 470',
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
