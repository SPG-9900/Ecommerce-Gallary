import 'package:chilltest/constants/shoe_data.dart';
import 'package:chilltest/screens/details_screen.dart';
import 'package:chilltest/screens/shoecard_screen.dart';
import 'package:flutter/material.dart';

class ShoeGridViewScreen extends StatelessWidget {
  const ShoeGridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe Gallery'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: ShoeData.shoeImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoeDetailScreen(
                    imagePath: ShoeData.shoeImages[index],
                    brandName: ShoeData.brandNames[index],
                    rating: ShoeData.ratings[index],
                    price: ShoeData.prices[index],
                  ),
                ),
              );
              print('Tapped on shoe at index $index');
            },
            child: ShoeCard(
              imagePath: ShoeData.shoeImages[index],
              brandName: ShoeData.brandNames[index],
              rating: ShoeData.ratings[index],
              price: ShoeData.prices[index],
            ),
          );
        },
      ),
    );
  }
}
