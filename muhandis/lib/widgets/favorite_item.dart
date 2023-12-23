import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  final String name;
  final String field;
  final String duration;
  final String imageUrl;

  FavoriteItem({
    required this.name,
    required this.field,
    required this.duration,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract the first word of the name
    print(imageUrl);
    String firstName = name.split(" ").first;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: Colors.black.withOpacity(0.7)),
        child: Stack(
          children: [
            // Display image
            ClipRRect(
              borderRadius: BorderRadius.circular(22.0),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black
                      .withOpacity(0.4), // Adjust opacity for darkness level
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Display internship information
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                // color: Colors.black.withOpacity(0.7), // Darken the background color
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display name with ellipsis
                    Text(
                      '$firstName...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Display field
                    Text(
                      field,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    // Display duration
                    Text(
                      " $duration",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
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
