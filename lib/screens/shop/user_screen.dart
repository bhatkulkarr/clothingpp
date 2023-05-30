import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/screens/shop/navigations/cart_screen.dart';
import 'package:clothingapp/screens/shop/navigations/category_screen.dart';
import 'package:clothingapp/screens/shop/navigations/home_screen.dart';
import 'package:clothingapp/screens/shop/navigations/profile_screen.dart';
import 'package:flutter/material.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFEFEFE),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Colors.grey,),
                activeIcon: Icon(Icons.home,color: CustomColors.primaryColor),
                label: 'Home',
                //   backgroundColor: CustomColors.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category,color: Colors.grey,),
                activeIcon: Icon(Icons.category,color: CustomColors.primaryColor),
                label: 'Category',
                //  backgroundColor: CustomColors.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart,color: Colors.grey,),
                activeIcon: Icon(Icons.shopping_cart,color: CustomColors.primaryColor),
                label: 'Cart',
                //   backgroundColor: CustomColors.primaryColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,color: Colors.grey,),
                activeIcon: Icon(Icons.person,color: CustomColors.primaryColor),
                label: 'Account',
                //   backgroundColor: CustomColors.primaryColor,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: CustomColors.primaryColor,
            iconSize: 30,
            onTap: _onItemTapped,
            elevation: 2,
            backgroundColor: Color(0xffFEFEFE),
          ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
    );
  }
}
