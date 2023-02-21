import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://media.istockphoto.com/photos/natural-beauty-portrait-of-young-asian-woman-picture-id1287548628?k=20&m=1287548628&s=612x612&w=0&h=5EsJWzMGjKzMZCQnc4AXDBObp7SEPK0rM970eieDfWM=";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  // decoration: BoxDecoration(color: Colors.orange),
                  accountName: Text("Korean beauty"),
                  accountEmail: Text("silentkiller8128@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text(
                  "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                color: Colors.white
              ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text(
                "Mail me",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),),
            )
          ],
        ),
      ),
    );
  }
}
