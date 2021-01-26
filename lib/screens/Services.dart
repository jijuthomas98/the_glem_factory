import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/components/service_provider.dart';
import 'package:the_glem_factory/router/package_router.dart' as router;
import 'Cart.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  ServiceProvider serviceData;
  @override
  Widget build(BuildContext context) {
    serviceData = Provider.of<ServiceProvider>(context, listen: false);
    return MaterialApp(
      onGenerateRoute: router.serviceRoutes,
      initialRoute: '/',
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
            'SERVICES',
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
        body: StreamBuilder(
          stream: serviceData.getStreamServices(),
          builder: (context, snapshot) {
            if (snapshot.data == null)
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            return ListView.builder(
              cacheExtent: 800,
              itemCount: snapshot.data.documents.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) {
                DocumentSnapshot service = snapshot.data.documents[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, service['fileName']);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    child: Card(
                      color: Color(int.parse(service['color'])),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    service['title'],
                                    style: TextStyle(
                                      fontFamily: 'inter',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    service['subText'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'inter',
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CachedNetworkImage(
                              imageUrl: service['imgUrl'],
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                      child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              )),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
