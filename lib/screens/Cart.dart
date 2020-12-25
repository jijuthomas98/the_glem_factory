import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/model/cart_model.dart';
import 'package:the_glem_factory/screens/DateAndTime.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

CartItem cartData;

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    cartData = Provider.of<CartItem>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
          title: Text(
            'CART',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cartData.itemCount,
                itemBuilder: (BuildContext context, index) {
                  //CartModel cartModel = cart[index];
                  return Dismissible(
                    onDismissed: (direction) {
                      setState(() {
                        cartData.removeItem(
                            cartData.items.values.toList()[index].title);
                      });
                    },
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                      child: Icon(FontAwesomeIcons.trash),
                    ),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm"),
                              content: const Text(
                                  "Are you sure you wish to delete this item?"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text("DELETE")),
                                FlatButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text("CANCEL"),
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(8),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 160,
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          bottom: 10,
                                          right: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartData.items.values
                                                .toList()[index]
                                                .title,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: 'inter',
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '₹ ${cartData.items.values.toList()[index].currentPrice}',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                '₹ ${cartData.items.values.toList()[index].previousPrice}',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 15,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              )
                                            ],
                                          ),
                                          Text(
                                              'Total: ₹ ${cartData.items.values.toList()[index].currentPrice * cartData.items.values.toList()[index].quantity}'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipOval(
                                            child: Material(
                                              color: Color(
                                                  0xffff7d85), // button color
                                              child: InkWell(
                                                splashColor:
                                                    Colors.red, // inkwell color
                                                child: SizedBox(
                                                    width: 40,
                                                    height: 40,
                                                    child: Icon(Icons.add)),
                                                onTap: () {
                                                  cartData.addSingleItem(
                                                      cartData.items.values
                                                          .toList()[index]
                                                          .title);
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              cartData.items.values
                                                  .toList()[index]
                                                  .quantity
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          ClipOval(
                                            child: Material(
                                              color: Color(
                                                  0xffff7d85), // button color
                                              child: InkWell(
                                                splashColor:
                                                    Colors.red, // inkwell color
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: Icon(
                                                    FontAwesomeIcons.minus,
                                                    size: 15,
                                                  ),
                                                ),
                                                onTap: () {
                                                  cartData.removeSingleItem(
                                                      cartData.items.values
                                                          .toList()[index]
                                                          .title);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Swipe to Delete',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffff7d85),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PRICE DETAILS',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Total',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '₹ ${cartData.totalOrder()}',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '₹ ${cartData.totalDiscount()}',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        '₹ ${cartData.totalAmount()}',
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        cartData.clear();
                      },
                      child: Container(
                        height: 60,
                        color: Color(0xffff7d85),
                        child: Center(
                            child: Text(
                          'CLEAR CART',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (cartData.totalAmount() != 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DateAndTime(
                                        total: cartData.totalAmount(),
                                        finalString:
                                            cartData.bundleItemsTitle(),
                                      )));
                        } else {
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Warning"),
                                  content: const Text(
                                      "Cant proceed, cart is empty!"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text("OK"),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child: Container(
                          height: 60,
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(
                              'CHECKOUT',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
