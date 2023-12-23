import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 38),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                SizedBox(
                  child: Center(
                    child: CircleAvatar(
                      radius: 47,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ContainerWithBorder(
                  child:
                      ListTileWithIcon(icon: Icons.edit, title: 'Edit Profile'),
                ),
                ContainerWithBorder(
                  child: ListTileWithIcon(
                    icon: Icons.description,
                    title: 'Edit Document',
                  ),
                ),
                ContainerWithBorder(
                  child: ListTileWithIcon(
                    icon: Icons.work,
                    title: 'Internship History',
                  ),
                ),
                ContainerWithBorder(
                  child: ListTileWithIcon(
                    icon: Icons.school,
                    title: 'Courses History',
                  ),
                ),
                ContainerWithBorder(
                  child: ListTileWithIcon(
                    icon: Icons.feedback,
                    title: 'Feedbacks',
                  ),
                ),
                ContainerWithBorder(
                  child: ListTileWithIcon(
                    icon: Icons.report,
                    title: 'Reports',
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 50,
                  width: 320,
                  child: Container(
                    color: Colors.blue, // Blue background color
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          // Add your logout logic here
                          // For example, you can show a confirmation dialog and then log the user out
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerWithBorder extends StatelessWidget {
  final Widget child;

  const ContainerWithBorder({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffB3B3B3))),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      margin: EdgeInsets.fromLTRB(25, 5, 25, 0),
      child: child,
    );
  }
}

class ListTileWithIcon extends StatelessWidget {
  final IconData icon;
  final String title;

  const ListTileWithIcon({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to details screen here
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(title: title),
          ),
        );
      },
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String title;

  const DetailsScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details for $title'),
      ),
    );
  }
}
