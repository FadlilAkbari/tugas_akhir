import 'package:flutter/material.dart';
import 'package:projek/menu/favorite.dart';
import 'package:projek/menu/film.dart';

class HomePage extends StatelessWidget {
  final List<MenuImage> menus = [
    MenuImage(imagePath: 'assets/film.png', label: 'List Film Conan'),
    MenuImage(imagePath: 'assets/favorite.png', label: 'Favorite'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),),
        backgroundColor: Colors.purple[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: menus.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigasi ke halaman terkait berdasarkan menu yang dipilih
                    navigateToPage(context, menus[index]);
                  },
                  child: MenuCard(menu: menus[index]),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  void navigateToPage(BuildContext context, MenuImage menu) {
    // Navigasi ke halaman terkait berdasarkan menu yang dipilih
    if (menu.label == 'List Film Conan') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FilmPage(),
        ),
      );
    } else if (menu.label == 'Favorite') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Favorite(),
        ),
      );
    }
  }
}

class MenuCard extends StatelessWidget {
  final MenuImage menu;

  const MenuCard({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              menu.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            menu.label,
            style: TextStyle(fontSize: 16, fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class MenuImage {
  final String imagePath;
  final String label;

  MenuImage({required this.imagePath, required this.label});
}
