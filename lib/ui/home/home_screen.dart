import 'package:flutter/material.dart';
import '../utils/text_format.dart';
import 'food_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
static const String name='/homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'iceCream',
      'image': 'assets/images/ice-cream_938012.png',
    },
    {'name': 'pizza', 'image': 'assets/images/pizza.png'},
    {'name': 'burger', 'image': 'assets/images/burger.png'},
    {'name': 'salad', 'image': 'assets/images/salad.png'},
  ];

  String selectedItem = '';

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FoodDetails()));
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
                              Text('Stuffed Bell Peppers',
                                  style: TextFile.header2Text()),
                              Text('Fresh and healthy',
                                  style: TextFile.header2LightText()),
                              Text("\$24", style: TextFile.header2Text()),
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
        },
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        items.length,
        (index) {
          String name = items[index]['name'];
          String image = items[index]['image'];

          return GestureDetector(
            onTap: () {
              selectedItem = name;
              setState(() {});
            },
            child: Material(
              color: selectedItem == name ? Colors.blue.shade100 : Colors.white,
              elevation: 4.0,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Image.asset(image, height: 40, width: 40),
              ),
            ),
          );
        },
      ),
    );
  }
}
