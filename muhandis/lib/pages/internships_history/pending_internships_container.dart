import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../consts/colors.dart';
import '../../main.dart';

class PendingInternshipsContainer extends StatelessWidget {
  // Internships Internships;
  BuildContext ctx;
  final String img;
  final String title;
  final String field;
  final String duration;
  PendingInternshipsContainer({
    Key? key,
    // required this.Internships,
    required this.ctx,
    required this.img,
    required this.title,
    required this.field,
    required this.duration,
  }) : super(key: key);

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 5, right: 15),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      img,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                "Title",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                "Field",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  field,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                "Duration",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  duration,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ])));
  }

  Future<void> _cancel(String? id, BuildContext ctx) async {
    // showDialog(
    //   context: navigatorKey.currentContext!,
    //   barrierDismissible: false,
    //   builder: (BuildContext ctx) {
    //     return const Center(child: CircularProgressIndicator());
    //   },
    // );
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      Navigator.pop(ctx, true);
      // showTopSnackBar(
      //     Overlay.of(ctx),
      //     const CustomSnackBar.error(
      //       message: 'Booking canceled',
      //     ));
      await FirebaseFirestore.instance
          .collection("bookings")
          .doc(id)
          .update({'status': 'Canceled'});
    } catch (e) {
      print(e);
      Navigator.pop(ctx, true);

      // showTopSnackBar(
      //     Overlay.of(ctx),
      //     const CustomSnackBar.error(
      //       message: 'Booking non canceled',
      //     ));
    }
  }
}
