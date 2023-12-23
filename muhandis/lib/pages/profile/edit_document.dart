import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class EditDocument extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<EditDocument> {
  List<Widget> documentContainers = [
    DocumentContainer(title: 'Upload Certificate'),
    DocumentContainer(title: 'Upload CV'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:   Text(
                  "Edit Document",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),),
      body: SafeArea(
        child: Column(
          children: [
          
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                'My documents',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                padding: EdgeInsets.all(16.0),
                childAspectRatio: 1.0,
                children: [
                  ...documentContainers,
                  InkWell(
                    onTap: () => setState(() {
                      documentContainers
                          .add(DocumentContainer(title: 'Add Other Document'));
                    }),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12.0),
                          color: Color(0xFF3159E4),
                          dashPattern: [15, 8],
                          child: Container(
                            child: Center(
                                child: Text(
                              "Upload more\ndocuments",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF3159E4),
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentContainer extends StatelessWidget {
  final String title;

  const DocumentContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Positioned(
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(12.0),
            color: Color(0xFFC6C6C6),
            dashPattern: [15, 8],
            child: Container(
              child: Center(child: Text('')),
            ),
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/Remove_fill.jpg'),
          backgroundColor: Colors.white,
          radius: 12,
        )
      ],
    );
  }
}
