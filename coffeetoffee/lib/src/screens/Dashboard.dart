import 'package:flutter/material.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/fryo_icons.dart';
import './ProductPage.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';
import 'dart:ui' as ui;

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      Text('Tab2'),
      favTab(context),
      profileTab(context),
      Text('Tab5'),
    ];

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Fryo.funnel),
          ),
          backgroundColor: primaryColor,
          title:
              Text('CoffeeToffee', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Fryo.magnifier),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Fryo.alarm),
            )
          ],
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Fryo.shop),
                title: Text(
                  'Store',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.cart),
                title: Text(
                  'My Cart',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.heart_1),
                title: Text(
                  'Favourites',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.user_1),
                title: Text(
                  'Profile',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Fryo.cog_1),
                title: Text(
                  'Settings',
                  style: tabLinkStyle,
                ))
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green[600],
          onTap: _onItemTapped,
        ));
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
  List<Product> drinks = [
    Product(
        name: "Caffè Latte",
        image: "images/10.png",
        price: "Rp30.000",
        userLiked: true,
        discount: 10),
    Product(
        name: "Cold Brew",
        image: "images/10.png",
        price: "Rp35.000",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Coffee Frappuccino",
      image: 'images/10.png',
      price: 'Rp35.000',
      userLiked: false,
    ),
    Product(
        name: "Tea Latte",
        image: "images/10.png",
        price: 'Rp30.000',
        userLiked: true,
        discount: 14)
  ];

  List<Product> foods = [
    Product(
        name: "Beef Filone",
        image: "images/sandwich.png",
        price: "Rp25.000",
        userLiked: true,
        discount: 2),
    Product(
        name: "Trio Mixed Roll",
        image: "images/sandwich.png",
        price: "Rp20.000",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Oreo Cheesecake",
        image: "images/cake.png",
        price: "Rp25.000",
        userLiked: false),
    Product(
        name: "Batik Cake",
        image: "images/cake.png",
        price: "Rp25.000",
        userLiked: true,
        discount: 3.4)
  ];

  return ListView(children: <Widget>[
    headerTopCategories(),
    deals('Hot Deals', onViewMore: () {}, items: <Widget>[
      foodItem(drinks[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[0],
              );
            },
          ),
        );
      }, onLike: () {}),
      foodItem(drinks[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[1],
              );
            },
          ),
        );
      }, onLike: () {
        
      }),
      foodItem(drinks[2], onTapped: () {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[2],
              );
            },
          ),
        );
      }, onLike: () {
       
      }),
      foodItem(drinks[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: drinks[3],
              );
            },
          ),
        );
      }, onLike: () {
        
      }),
    ]),
    deals('Foods', onViewMore: () {}, items: <Widget>[
      foodItem(foods[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[0],
              );
            },
          ),
        );
      }, onLike: () {}),
      foodItem(foods[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[1],
              );
            },
          ),
        );
      }, onLike: () {}),
      foodItem(foods[2], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[2],
              );
            },
          ),
        );
      }, onLike: () {}),
      foodItem(foods[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: foods[3],
              );
            },
          ),
        );
      }, onLike: () {}),
    ])
  ]);
}

Widget profileTab(BuildContext context) {
    
    Icon ofericon = new Icon(
      Icons.edit,
      color: Colors.black38,
    );
    Icon keyloch = new Icon(
      Icons.vpn_key,
      color: Colors.black38,
    );
    Icon clear = new Icon(
      Icons.history,
      color: Colors.black38,
    );
    Icon logout = new Icon(
      Icons.do_not_disturb_on,
      color: Colors.black38,
    );

    Icon menu = new Icon(
      Icons.more_vert,
      color: Colors.black38,
    );

    //List<address> addresLst = loadAddress() as List<address> ;
    return new Scaffold(
      body: new Container(
          child: SingleChildScrollView(
            child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(7.0),
            alignment: Alignment.topCenter,
            height: 280.0,
            child: new Card(
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  new Container(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        margin: const EdgeInsets.all(10.0),
                        // padding: const EdgeInsets.all(3.0),
                        child: ClipOval(
                          child: Image.network(
                              'https://www.fakenamegenerator.com/images/sil-female.png'),
                        ),
                      )),

                  new FlatButton(
                    onPressed: null,
                    child: Text(
                      'Change',
                      style:
                          TextStyle(fontSize: 13.0, color: Colors.brown),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.brown)),
                  ),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(
                            left: 10.0, top: 20.0, right: 5.0, bottom: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Text(
                              'Yee',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            _verticalDivider(),
                            new Text(
                              '084939283928',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            ),
                            _verticalDivider(),
                            new Text(
                              'yee@apps.ipb.ac.id',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: ofericon,
                            color: Colors.blueAccent,
                            onPressed: null),
                      )
                    ],
                  ),
                  // VerticalDivider(),
                ],
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              elevation: 1.0,
              child: Row(
                children: <Widget>[
                  new IconButton(icon: keyloch, onPressed: null),
                  _verticalD(),
                  new Text(
                    'Change Password',
                    style: TextStyle(fontSize: 15.0, color: Colors.black87),
                  )
                ],
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              elevation: 1.0,
              child: Row(
                children: <Widget>[
                  new IconButton(icon: clear, onPressed: null),
                  _verticalD(),
                  new Text(
                    'Clear History',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              elevation: 1.0,
              child: Row(
                children: <Widget>[
                  new IconButton(icon: logout, onPressed: null),
                  _verticalD(),
                  new Text(
                    'Deactivate Account',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
          )
      ),
    );
  }

_verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

_verticalD() => Container(
      margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
    );

Widget favTab(BuildContext context) {

  // will pick it up from here
  // am to start another template
  List<Product> favorited = [
    Product(
        name: "Caffè Latte",
        image: "images/10.png",
        price: "Rp30.000",
        userLiked: true,
        discount: 10),
    Product(
        name: "Tea Latte",
        image: "images/10.png",
        price: 'Rp30.000',
        userLiked: true,
        discount: 14),
    Product(
        name: "Beef Filone",
        image: "images/sandwich.png",
        price: "Rp25.000",
        userLiked: true,
        discount: 2),
    Product(
        name: "Batik Cake",
        image: "images/cake.png",
        price: "Rp25.000",
        userLiked: true,
        discount: 3.4)
  ];

  return ListView(children: <Widget>[
    deals('Your Favorites', onViewMore: () {}, items: <Widget>[
      foodItem(favorited[0], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: favorited[0],
              );
            },
          ),
        );
      }, onLike: () {}),
      foodItem(favorited[1], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: favorited[1],
              );
            },
          ),
        );
      }, onLike: () {
        
      }),
      foodItem(favorited[2], onTapped: () {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: favorited[2],
              );
            },
          ),
        );
      }, onLike: () {
       
      }),
      foodItem(favorited[3], onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: favorited[3],
              );
            },
          ),
        );
      }, onLike: () {
        
      }),
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
      sectionHeader('Top Categories', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Espresso', Fryo.coffee_cup, onPressed: () {}),
            headerCategoryItem('Brewed', Fryo.coffee_cup, onPressed: () {}),
            headerCategoryItem('Blended', Fryo.coffee_cup, onPressed: () {}),
            headerCategoryItem('Milk & Choc', Fryo.coffee_cup, onPressed: () {}),
            headerCategoryItem('Teas', Fryo.coffee_cup, onPressed: () {}),
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
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
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
