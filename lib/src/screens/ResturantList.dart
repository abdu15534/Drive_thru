import 'package:drive_thru/src/screens/OldDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:drive_thru/src/screens/AddResturant.dart';
import 'package:drive_thru/src/screens/HomePage.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';
import './Timerpage.dart';
import 'package:page_transition/page_transition.dart';


class ResturantList extends StatefulWidget {
  final String pageTitle;

  ResturantList({Key key, this.pageTitle}) : super(key: key);

  @override
  _ResturantListState createState() => _ResturantListState();
}

class _ResturantListState extends State<ResturantList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      Text('Tab2'),
      Text('Tab3'),
      Text('Tab4'),
      Text('Tab5'),
    ];

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: AddResturant()));
            },
            iconSize: 21,
            icon: Icon(Icons.add,color: white,)
          ),
          backgroundColor: primaryColor,
          title:
              Text('Virtual DriveThru', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                    FirebaseAuth.instance.signOut().then((value){
                      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: HomePage()));
                    }).catchError((e){print(e);});
                  },
                color: primaryColor,
                padding: EdgeInsets.all(2),
               shape: CircleBorder(),
                child: Icon(Icons.delete, color: white),
            )
          ],
        ),
        drawer: new Drawer(  
        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Virtual DriveThru', style: logoWhiteStyle, textAlign: TextAlign.center),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Home Page'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('My Cart'),
              
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Store'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Add restaurant'),
              onTap: () {
                Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: AddResturant()));
              },
            ),
            ListTile(
              title: Text('Settings'),
              
              onTap: () {
                Navigator.pop(context);
                
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value){
                Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRightWithFade, child: HomePage()));
                }).catchError((e){print(e);});
              },
            ),
          ],
        ),
      ),
        );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget storeTab(BuildContext context) {

  // will pick it up from here
  // am to start another template
  List<Product> foods = [
    Product(
        name: "Hamburger",
        image: "images/3.png",
        price: "\$25.00",
        userLiked: true,
        discount: 10),
        
    Product(
        name: "Pasta",
        image: "images/5.png",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Akara",
      image: 'images/2.png',
      price: '\$10.99',
      userLiked: false,
    ),
    Product(
        name: "Strawberry",
        image: "images/1.png",
        price: '\$50.00',
        userLiked: true,
        discount: 14)
  ];

  List<Product> drinks = [
    Product(
        name: "Coca-Cola",
        image: "images/6.png",
        price: "\$45.12",
        userLiked: true,
        discount: 2),
    Product(
        name: "Lemonade",
        image: "images/7.png",
        price: "\$28.00",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Vodka",
        image: "images/8.png",
        price: "\$78.99",
        userLiked: false),
    Product(
        name: "Tequila",
        image: "images/9.png",
        price: "\$168.99",
        userLiked: true,
        discount: 3.4)
        
  ];
  duration: Duration(seconds: 10);

  return ListView(children: <Widget>[
    // headerTopCategories(),
    deals('Rsturnts', onViewMore: () {}, items: <Widget>[
      rest(foods[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new OldDashboard();
            },
          ),
        );
      }, onLike: () {}),
      rest(foods[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new OldDashboard();
            },
          ),
        );
      }, imgWidth: 250, onLike: () {
        
      }),
      rest(foods[2], onTapped: () {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new OldDashboard();
            },
          ),
        );
      }, imgWidth: 200, onLike: () {
       
      }),
      rest(foods[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new OldDashboard();
            },
          ),
        );
      }, onLike: () {}),
      rest(drinks[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new OldDashboard();
            },
          ),
        );
      }, onLike: () {}, imgWidth: 60),
      rest(drinks[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new OldDashboard();
            },
          ),
        );
      }, onLike: () {}, imgWidth: 75),
      rest(drinks[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
             return new OldDashboard();
            },
          ),
        );
      }, imgWidth: 110, onLike: () {}),
      rest(drinks[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new OldDashboard();
            },
          ),
        );
      }, onLike: () {}),
    ]),
    
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all ›', style: contrastText),
        ),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('All Categories', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Frieds', Fryo.dinner, onPressed: () {}),
            headerCategoryItem('Fast Food', Fryo.food, onPressed: () {}),
            headerCategoryItem('Creamery', Fryo.poop, onPressed: () {}),
            headerCategoryItem('Hot Drinks', Fryo.coffee_cup, onPressed: () {}),
            headerCategoryItem('Vegetables', Fryo.leaf, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 400,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
