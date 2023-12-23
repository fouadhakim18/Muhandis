import 'package:flutter/material.dart';

class MoreDeatils extends StatelessWidget {
  const MoreDeatils({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: 400,
                  child: PageView.builder(
                    itemCount: 1,
                    controller:
                        PageController(initialPage: 0, viewportFraction: 1),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/internship2.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 31, 25, 106)
                                    .withOpacity(0.5),
                              ),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Spacer(),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Column(children: [
                                        Text(
                                          'Web development',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              // letterSpacing: 4,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '2months',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              'Work from Home',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '\$5000',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            )
                                          ],
                                        )
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                    color: Color(0xFF000000),
                    child: Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    ),

                    // text styles/heading 1
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "About",

                    // text styles/heading 3
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    maxLines: 3,

                    "En septembre 2007, lors du l'automobile de Franc\nfort, Peugeot présente au grand public la 308, ainsi qu\nrrosserie coupé 2 ",

                    // text styles/paragraph small
                    style: TextStyle(
                      color: Color(0xFF6F6F6F),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        'Field',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        height: 21,
                        width: 165,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFD9D9D9)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            "Computer Science",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Text(
                    'Requirements and skills',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 7),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(
                                  0xFFD9D9D9), // Set your desired border color here
                              width: 2, // Set the border width
                            ),
                            borderRadius: BorderRadius.circular(19),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0, right: 14),
                          child: Text(
                            "Html / CSS",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 7),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(
                                  0xFFD9D9D9), // Set your desired border color here
                              width: 2, // Set the border width
                            ),
                            borderRadius: BorderRadius.circular(19),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0, right: 14),
                          child: Text(
                            "Html / CSS",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 7),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(
                                  0xFFD9D9D9), // Set your desired border color here
                              width: 2, // Set the border width
                            ),
                            borderRadius: BorderRadius.circular(19),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0, right: 14),
                          child: Text(
                            "Html / CSS",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 7),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(
                                  0xFFD9D9D9), // Set your desired border color here
                              width: 2, // Set the border width
                            ),
                            borderRadius: BorderRadius.circular(19),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0, right: 14),
                          child: Text(
                            "Html / CSS",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Row(
                    children: [
                      Text(
                        'Duration',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          "30 Jours ",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        'Start date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          "Septembre 2023 ",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          "Sidi Bel Abbés",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 171.0, // Adjust the height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width:
                              151.0, // Adjust the width of each item as needed
                          margin: EdgeInsets.all(8.0),

                          child: Center(
                            child: Text(
                              'Item $index',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30),
            //   child: Text(
            //     "Field",

            //     // text styles/paragraph large
            //     style: TextStyle(
            //       fontSize: 16,
            //       color: Color(0xFF6F6F6F),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
