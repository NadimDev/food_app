import 'package:flutter/material.dart';
import '../utils/text_format.dart';
import 'food_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool iceCream = false, pizza = false, burger = false, salad = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello Nadim,',
                    style: TextFile.bodyTextStyle(),
                  ),
                  const Icon(Icons.shopping_cart)
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Delicious Food',
                style: TextFile.headerTextStyle(),
              ),
              Text(
                'Discover and Get Start Food',
                style: TextFile.header1LightText(),
              ),
              const SizedBox(height: 16),
              showItem(),
              const SizedBox(
                height: 32,
              ),
              showFoodHorizontal(),
              const SizedBox(
                height: 16,
              ),
              showFoodVertical(),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded showFoodVertical() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/salad3.png',
                            height: 120,
                            width: 120,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Stuffed Bell Peppers',
                                  style: TextFile.header2Text(),
                                ),
                                Text(
                                  'Fresh and healthy',
                                  style: TextFile.header2LightText(),
                                ),
                                Text(
                                  "\$24",
                                  style: TextFile.header2Text(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            );
          }),
    );
  }

  SizedBox showFoodHorizontal() {
    return SizedBox(
      height: 280,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FoodDetails()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/salad2.png',
                              height: 150,
                              width: 150,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Stuffed Bell Peppers',
                                  style: TextFile.header2Text(),
                                ),
                                Text(
                                  'Fresh and healthy',
                                  style: TextFile.header2LightText(),
                                ),
                                Text(
                                  "\$24",
                                  style: TextFile.header2Text(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            );
          }),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            iceCream = true;
            pizza = false;

            burger = false;
            salad = false;
            setState(() {});
          },
          child: Material(
            color: iceCream ? Colors.indigoAccent.shade100 : Colors.white,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset('assets/images/ice-cream_938012.png',
                  height: 40, width: 40),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = true;

            burger = false;
            salad = false;
            setState(() {});
          },
          child: Material(
            color: pizza ? Colors.indigoAccent.shade100 : Colors.white,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(8),
              child:
                  Image.asset('assets/images/pizza.png', height: 40, width: 40),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = false;

            burger = true;
            salad = false;
            setState(() {});
          },
          child: Material(
            color: burger ? Colors.indigoAccent.shade100 : Colors.white,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset('assets/images/burger.png',
                  height: 40, width: 40),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = false;

            burger = false;
            salad = true;
            setState(() {});
          },
          child: Material(
            color: salad ? Colors.indigoAccent.shade100 : Colors.white,
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(8),
              child:
                  Image.asset('assets/images/salad.png', height: 40, width: 40),
            ),
          ),
        ),
      ],
    );
  }
}
