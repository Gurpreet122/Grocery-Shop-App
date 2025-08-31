import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodorderapp/pages/details.dart';
import 'package:foodorderapp/service/database.dart';

import '../Widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;

  Stream? foodItemStream;

  onTheLoad() async {
    foodItemStream = await DatabaseMethod().getFoodItem("Salad");
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();

  }

  Widget allItemVertically() {
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      detail: ds['Detail'],
                                      name: ds['Name'],
                                      price: ds['Price'],
                                      image: ds['Image'],
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                Column(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds["Name"],
                                        style:
                                            AppWidget.semiboldTextFeildStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "Honey chees",
                                        style:
                                            AppWidget.lightLineTextFeildStyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds["Price"],
                                        style:
                                            AppWidget.lightLineTextFeildStyle(),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator();
        });
  }

  Widget allItem() {
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      detail: ds['Detail'],
                                      name: ds['Name'],
                                      price: ds['Price'],
                                      image: ds['Image'],
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.network(
                                      ds["Image"],
                                      height: 115,
                                      width: 115,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    ds['Name'],
                                    style: AppWidget.semiboldTextFeildStyle(),
                                  ),
                                  Text(
                                    "Fresh Pizza",
                                    style: AppWidget.lightLineTextFeildStyle(),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    ds["Price"],
                                    style: AppWidget.semiboldTextFeildStyle(),
                                  )
                                ],
                              ),
                            )),
                      ),
                    );
                  })
              : const CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Food Cafe", style: AppWidget.boldTextFeildStyle(),),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(8)),
                  // child: const Icon(Icons.shopping_cart_outlined,
                  //     color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text("Delicious Food", style: AppWidget.headLineTextFeildStyle()),
            Text("Discover and Get Great Food",
                style: AppWidget.lightLineTextFeildStyle()),
            const SizedBox(
              height: 5,
            ),
            Container(
                margin: const EdgeInsets.only(right: 10), child: showItem()),
            const SizedBox(
              height:8,
            ),
            SizedBox(height: 230, child: allItem()),
            const SizedBox(
              height: 10,
            ),
             SizedBox(height:270,child: allItemVertically()),
            const SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            foodItemStream = await DatabaseMethod().getFoodItem("Ice-cream");
            setState(() {});
          },
          child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: icecream ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset("images/686407.png",
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                    color: icecream ? Colors.indigo: Colors.black),
              )),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            foodItemStream = await DatabaseMethod().getFoodItem("Pizza");
            setState(() {});
          },
          child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: pizza ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset("images/pizza.png",
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                    color: pizza ? Colors.deepPurpleAccent : Colors.black),
              )),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            foodItemStream = await DatabaseMethod().getFoodItem("Salad");
            setState(() {});
          },
          child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: salad ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset("images/salad1.png",
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                    color: salad ? Colors.lightBlue : Colors.black),
              )),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            foodItemStream = await DatabaseMethod().getFoodItem("Burger");
            setState(() {});
          },
          child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: burger ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: Image.asset("images/burger.png",
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                    color: burger ? Colors.green : Colors.black),
              )),
        ),
      ],
    );
  }
}
