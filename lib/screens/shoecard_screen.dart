import 'package:chilltest/screens/details_screen.dart';
import 'package:chilltest/screens/ratings.dart';
import 'package:flutter/material.dart';

class ShoeCard extends StatelessWidget {
  final String imagePath;
  final String brandName;
  final double rating;
  final double price;

  const ShoeCard({
    Key? key,
    required this.imagePath,
    required this.brandName,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ShoeDetailScreen(
              imagePath: imagePath,
              brandName: brandName,
              rating: rating,
              price: price,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.grey.shade300,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Hero(
              tag: imagePath,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Hero(
                          tag: 'brand_${brandName}',
                          child: Text(
                            brandName, // Brand name
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Hero(
                          tag: 'price_${price}',
                          child: Text(
                            '\$$price', // Price
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Hero(
                          tag: 'rating_${rating}',
                          child: Text(
                            '$rating', // Rating
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        RatingStars(rating: rating),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
