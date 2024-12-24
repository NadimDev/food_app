import 'package:flutter/material.dart';
import 'package:food_app/ui/utils/text_format.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int price = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          children: [
            Image.asset(
              'assets/images/salad2.png',
              width: size,
              height: size / 1.2,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Health',
                      style: TextFile.headerTextStyle(),
                    ),
                    Text(
                      'Garden Fresh Salad',
                      style: TextFile.header2Text(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (price > 1) {
                            --price;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '$price',
                      style: TextFile.header2Text(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ++price;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
                style: TextFile.header3LightText(),
                'A vibrant mix of crisp lettuce, juicy cherry tomatoes, crunchy cucumbers, shredded carrots, and red onions, topped with a light vinaigrette. This refreshing salad is a perfect side dish or a healthy meal on its own.'),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Time',
                  style: TextFile.header2Text(),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Text('30 min', style: TextFile.header2Text()),
              ],
            ),
            const Spacer(),
            TotalPriceSection(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Row TotalPriceSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Price', style: TextFile.header2Text()),
            Text(
              //in this section when add product then price increase and when remove product then price drecrease
              '\$${price * 25}',
              style: TextFile.bodyTextStyle(),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 5, bottom: 5, right: 8),
            child: Row(
              children: [
                Text(
                  'Add to cart',
                  style: TextFile.header2Text().copyWith(color: Colors.white),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
