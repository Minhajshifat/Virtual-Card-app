import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:virtual_card/pages/Scanpage.dart';

class Homepage extends StatefulWidget {
  static const String routername = "/";
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(Scanpage.routername);
        },
        shape: CircleBorder(),

        //clipBehavior: Clip.antiAlias,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        notchMargin: 9,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: selectedindex,
          backgroundColor: Colors.blue[100],
          onTap: (value) {
            setState(() {
              selectedindex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Personal",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
          ],
        ),
      ),
    );
  }
}
