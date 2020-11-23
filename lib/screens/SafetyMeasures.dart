import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Cart.dart';

class SafetyMeasures extends StatefulWidget {
  @override
  _SafetyMeasuresState createState() => _SafetyMeasuresState();
}

class _SafetyMeasuresState extends State<SafetyMeasures> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onTap: () => Navigator.pop(context),
          ),
          title: Text(
            'SAFETY MEASURES',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.shoppingBag,
                color: Colors.black54,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              // 1st
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1 of 5',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Usage of masks, gloves and Sanitizers',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Providers use fresh masks , gloves and sanitizers. Before each appointment provider shares an image with SM which is validated via image processing for usage of these items.',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image(
                            image: ResizeImage(
                                AssetImage(
                                    'asset/images/icons/SaftyMeasures/Mask.png'),
                                height: 80,
                                width: 80),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                              image: ResizeImage(
                            AssetImage(
                                'asset/images/icons/SaftyMeasures/Gloves.png'),
                            height: 80,
                            width: 80,
                          ))
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              //2nd
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image(
                            image: ResizeImage(
                          AssetImage(
                              'asset/images/icons/SaftyMeasures/Thermometer.png'),
                          height: 80,
                          width: 80,
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2 of 5',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Mandatory daily temperature checks',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Service Providers are requires to take their temperature and upload a thermometer image everyday. This temperature reading is verified via image processing and a manual audit is done for 5% of providers',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              //3rd
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3 of 5',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Hygiene training on WHO guidelines',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Mandatory 7- day hygiene training to all our professionals on washing hands, protecting themselves & customers and ensuring low contact during service',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image(
                              image: ResizeImage(
                            AssetImage(
                                'asset/images/icons/SaftyMeasures/HandSanitizing.png'),
                            height: 80,
                            width: 80,
                          ))
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              // 4th
              margin: EdgeInsets.all(15),

              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image(
                            image: ResizeImage(
                          AssetImage(
                              'asset/images/icons/SaftyMeasures/Calender.png'),
                          height: 80,
                          width: 80,
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '4 of 5',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Suraksha Holidays',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'A special grant for partners, to cover their living and medical expenses when they fall sick.',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              //5th
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '5 of 5',
                          style: TextStyle(color: Colors.black54),
                        ),
                        Text(
                          'Low Contact Service Experience',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Professionals are trained to adopt low - contact protocols during the service delivery',
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image(
                            image: ResizeImage(
                                AssetImage(
                                    'asset/images/icons/SaftyMeasures/Chair.png'),
                                height: 80,
                                width: 80),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
