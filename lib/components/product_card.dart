import 'package:flutter/material.dart';

class MyProductCard extends StatelessWidget {
  final int id;
  final String productName;
  final String authorName;
  final double price;
  final String imageUrl;

  const MyProductCard({
    required this.id,
    required this.productName,
    required this.authorName,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(2),
      color: Colors.white10,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white30,),

              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                productName,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              authorName,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              '${price.toString()}₺',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
