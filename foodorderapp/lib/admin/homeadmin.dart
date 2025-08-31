import 'package:flutter/material.dart';

import '../Widget/widget_support.dart';
import 'addFood.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Column(
          children: [
            Center(
              child: Text(
                "Home Admin",
                style: AppWidget.headLineTextFeildStyle(),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AddFood()));
                },
                child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(6),
                                child: Image.asset(
                                  "images/salad.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Add Food Item",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
