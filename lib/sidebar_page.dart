// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_const, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animated_sidebar/animated_sidebar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activeTab = 0;

  final List<SidebarItem> items = [
    SidebarItem(
      icon: Icons.home,
      text: 'Home',
    ),
    SidebarItem(
      icon: Icons.notifications,
      text: 'Notifications',
    ),
    SidebarItem(
      icon: Icons.person,
      text: 'Management',
      children: [
        SidebarChildItem(
          icon: Icons.person,
          text: 'Users',
        ),
        SidebarChildItem(
          icon: Icons.verified_user,
          text: 'Roles',
        ),
        SidebarChildItem(
          icon: Icons.key,
          text: 'Permissions',
        ),
      ],
    ),
    SidebarItem(
      icon: Icons.abc,
      text: 'Integrations',
    ),
    SidebarItem(
      icon: Icons.settings,
      text: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Row(
          children: [
            AnimatedSidebar(
              margin: const EdgeInsets.fromLTRB(16, 24, 0, 24),
              expanded: MediaQuery.of(context).size.width > 600,
              items: items,
              // use this to set the active tab if you want to control it from outside
              // combined with autoSelectedIndex set to false
              // if you don't set autoSelectedIndex to false, the widget will
              // automatically set the active tab and selected item is used only
              // to set the initial value
              selectedIndex: activeTab,
              autoSelectedIndex: false,
              onItemSelected: (index) => setState(() => activeTab = index),
              duration: const Duration(milliseconds: 1000),
              frameDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.repeated,
                  colors: [
                    Color.fromRGBO(66, 66, 74, 1),
                    Color.fromRGBO(25, 25, 25, 1),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(66, 66, 66, 0.75),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              minSize: 90,
              maxSize: 250,
              itemIconSize: 26,
              itemIconColor: Colors.white,
              itemHoverColor: Colors.grey.withOpacity(0.3),
              itemSelectedColor: Colors.grey.withOpacity(0.3),
              itemTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
              itemSelectedBorder: const BorderRadius.all(
                Radius.circular(5),
              ),
              itemMargin: 16,
              itemSpaceBetween: 10,
              headerIcon: Icons.ac_unit_sharp,
              headerIconSize: 30,
              headerIconColor: Colors.amberAccent,
              headerTextStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              headerText: ' Example',
            ),
            Expanded(
              child: _buildPage(activeTab),
            ),
          ],
        ),
      ),
    );
  }

  //minimal version
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //     body: Row(
  //       children: [
  //         AnimatedSidebar(
  //           expanded: MediaQuery.of(context).size.width > 600,
  //           items: items,
  //           selectedIndex: activeTab,
  //           onItemSelected: (index) =>
  //               setState(() => activeTab = index),
  //           headerIcon: Icons.ac_unit_sharp,
  //           headerIconColor: Colors.amberAccent,
  //           headerText: 'Example',
  //         ),
  //         Center(
  //           child: Text(
  //             'Page: $activeTab',
  //             style: Theme.of(context).textTheme.headline3,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildPage(int idx) {
    // return a page full of skeleton cards
    return Wrap(
      children: List.generate(8, (index) {
        double width = idx % 2 == 0 ? double.infinity : 500;
        int count = Random().nextInt(2) + 3;
        return Container(
            margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            width: width,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            // create a skeleton card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < count; i++)
                  Container(
                    width: Random().nextInt(100).toDouble() + 200,
                    height: i == 0 ? 30 : 20,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
              ],
            ));
      }),
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final _advancedDrawerController = AdvancedDrawerController();

//   @override
//   Widget build(BuildContext context) {
//     return AdvancedDrawer(
//       backdrop: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
//           ),
//         ),
//       ),
//       controller: _advancedDrawerController,
//       animationCurve: Curves.easeInOut,
//       animationDuration: const Duration(milliseconds: 300),
//       animateChildDecoration: true,
//       rtlOpening: false,
//       // openScale: 1.0,
//       disabledGestures: false,
//       childDecoration: const BoxDecoration(
//         // NOTICE: Uncomment if you want to add shadow behind the page.
//         // Keep in mind that it may cause animation jerks.
//         // boxShadow: <BoxShadow>[
//         //   BoxShadow(
//         //     color: Colors.black12,
//         //     blurRadius: 0.0,
//         //   ),
//         // ],
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Advanced Drawer Example'),
//           leading: IconButton(
//             onPressed: _handleMenuButtonPressed,
//             icon: ValueListenableBuilder<AdvancedDrawerValue>(
//               valueListenable: _advancedDrawerController,
//               builder: (_, value, __) {
//                 return AnimatedSwitcher(
//                   duration: Duration(milliseconds: 250),
//                   child: Icon(
//                     value.visible ? Icons.clear : Icons.menu,
//                     key: ValueKey<bool>(value.visible),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         body: Container(),
//       ),
//       drawer: SafeArea(
//         child: Container(
//           child: ListTileTheme(
//             textColor: Colors.white,
//             iconColor: Colors.white,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   width: 128.0,
//                   height: 128.0,
//                   margin: const EdgeInsets.only(
//                     top: 24.0,
//                     bottom: 64.0,
//                   ),
//                   clipBehavior: Clip.antiAlias,
//                   decoration: BoxDecoration(
//                     color: Colors.black26,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     'assets/background.png',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.home),
//                   title: Text('Home'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.account_circle_rounded),
//                   title: Text('Profile'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.favorite),
//                   title: Text('Favourites'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.settings),
//                   title: Text('Settings'),
//                 ),
//                 const Spacer(),
//                 DefaultTextStyle(
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.white54,
//                   ),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                       vertical: 16.0,
//                     ),
//                     child: const Text('Terms of Service | Privacy Policy'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _handleMenuButtonPressed() {
//     _advancedDrawerController.showDrawer();
//   }
// }







// // ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

// import 'dart:math' as math show pi;

// import 'package:collapsible_sidebar/collapsible_sidebar.dart';
// import 'package:flutter/material.dart';

// class SidebarPage extends StatefulWidget {
//   @override
//   _SidebarPageState createState() => _SidebarPageState();
// }

// class _SidebarPageState extends State<SidebarPage> {
//   late List<CollapsibleItem> _items;
//   late String _headline;
//   // AssetImage _avatarImg = AssetImage('assets/man.png');

//   @override
//   void initState() {
//     super.initState();
//     _items = _generateItems;
//     _headline = _items.firstWhere((item) => item.isSelected).text;
//   }

//   List<CollapsibleItem> get _generateItems {
//     return [
//       CollapsibleItem(
//           text: 'Dashboard',
//           icon: Icons.assessment,
//           onPressed: () => setState(() => _headline = 'DashBoard'),
//           onHold: () => ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: const Text("Dashboard"))),
//           isSelected: true,
//           subItems: [
//             CollapsibleItem(
//               text: 'Menu',
//               icon: Icons.menu_book,
//               onPressed: () => setState(() => _headline = 'Menu'),
//               onHold: () => ScaffoldMessenger.of(context)
//                   .showSnackBar(SnackBar(content: const Text("Menu"))),
//               isSelected: true,
//             ),
//             CollapsibleItem(
//                 text: 'Shop',
//                 iconImage: AssetImage("assets/shop_icon.png"),
//                 icon: Icons.ac_unit,
//                 onPressed: () => setState(() => _headline = 'Shop'),
//                 onHold: () => ScaffoldMessenger.of(context)
//                     .showSnackBar(SnackBar(content: const Text("Shop"))),
//                 isSelected: true,
//                 subItems: [
//                   CollapsibleItem(
//                     text: 'Cart',
//                     icon: Icons.shopping_cart,
//                     onPressed: () => setState(() => _headline = 'Cart'),
//                     onHold: () => ScaffoldMessenger.of(context)
//                         .showSnackBar(SnackBar(content: const Text("Cart"))),
//                     isSelected: true,
//                   )
//                 ]),
//           ]),
//       CollapsibleItem(
//         text: 'Search',
//         icon: Icons.search,
//         onPressed: () => setState(() => _headline = 'Search'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Search"))),
//       ),
//       CollapsibleItem(
//         text: 'Notifications',
//         icon: Icons.notifications,
//         onPressed: () => setState(() => _headline = 'Notifications'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Notifications"))),
//       ),
//       CollapsibleItem(
//         text: 'Settings',
//         icon: Icons.settings,
//         onPressed: () => setState(() => _headline = 'Settings'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Settings"))),
//       ),
//       CollapsibleItem(
//         text: 'Alarm',
//         icon: Icons.access_alarm,
//         onPressed: () => setState(() => _headline = 'Alarm'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Alarm"))),
//       ),
//       CollapsibleItem(
//         text: 'Eco',
//         icon: Icons.eco,
//         onPressed: () => setState(() => _headline = 'Eco'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Eco"))),
//       ),
//       CollapsibleItem(
//         text: 'Event',
//         icon: Icons.event,
//         onPressed: () => setState(() => _headline = 'Event'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Event"))),
//       ),
//       CollapsibleItem(
//         text: 'No Icon',
//         onPressed: () => setState(() => _headline = 'No Icon'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("No Icon"))),
//       ),
//       CollapsibleItem(
//         text: 'Email',
//         icon: Icons.email,
//         onPressed: () => setState(() => _headline = 'Email'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Email"))),
//       ),
//       CollapsibleItem(
//           text: 'News',
//           iconImage: NetworkImage(
//               "https://cdn-icons-png.flaticon.com/512/330/330703.png"),
//           onPressed: () => setState(() => _headline = 'News'),
//           onHold: () => ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: const Text("News"))),
//           subItems: [
//             CollapsibleItem(
//               text: 'Old News',
//               icon: Icons.elderly,
//               onPressed: () => setState(() => _headline = 'Old News'),
//               onHold: () => ScaffoldMessenger.of(context)
//                   .showSnackBar(SnackBar(content: const Text("Old News"))),
//             ),
//             CollapsibleItem(
//                 text: 'Current News',
//                 icon: Icons.yard_outlined,
//                 onPressed: () => setState(() => _headline = 'Current News'),
//                 onHold: () => ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: const Text("Current News"))),
//                 subItems: [
//                   CollapsibleItem(
//                     text: 'News 1',
//                     icon: Icons.one_k,
//                     onPressed: () => setState(() => _headline = 'News 1'),
//                     onHold: () => ScaffoldMessenger.of(context)
//                         .showSnackBar(SnackBar(content: const Text("News 1"))),
//                   ),
//                   CollapsibleItem(
//                       text: 'News 2',
//                       icon: Icons.two_k,
//                       onPressed: () => setState(() => _headline = 'News 2'),
//                       onHold: () => ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: const Text("News 2"))),
//                       subItems: [
//                         CollapsibleItem(
//                           text: 'News 2 Detail',
//                           icon: Icons.two_k_outlined,
//                           onPressed: () =>
//                               setState(() => _headline = 'News 2 Detail'),
//                           onHold: () => ScaffoldMessenger.of(context)
//                               .showSnackBar(SnackBar(
//                                   content: const Text("News 2 Detail"))),
//                         )
//                       ]),
//                   CollapsibleItem(
//                     text: 'News 3',
//                     icon: Icons.three_k,
//                     onPressed: () => setState(() => _headline = 'News 3'),
//                     onHold: () => ScaffoldMessenger.of(context)
//                         .showSnackBar(SnackBar(content: const Text("News 3"))),
//                   )
//                 ]),
//             CollapsibleItem(
//               text: 'New News',
//               icon: Icons.account_balance,
//               onPressed: () => setState(() => _headline = 'New News'),
//               onHold: () => ScaffoldMessenger.of(context)
//                   .showSnackBar(SnackBar(content: const Text("New News"))),
//             ),
//           ]),
//       CollapsibleItem(
//         text: 'Face',
//         icon: Icons.face,
//         onPressed: () => setState(() => _headline = 'Face'),
//         onHold: () => ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: const Text("Face"))),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: CollapsibleSidebar(
//         isCollapsed: MediaQuery.of(context).size.width <= 800,
//         items: _items,
//         collapseOnBodyTap: false,
//         // avatarImg: _avatarImg,
//         title: 'John Smith',
//         onTitleTap: () {
//           ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
//         },
//         body: _body(size, context),
//         backgroundColor: Colors.black,
//         selectedTextColor: Colors.limeAccent,
//         textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
//         titleStyle: TextStyle(
//             fontSize: 20,
//             fontStyle: FontStyle.italic,
//             fontWeight: FontWeight.bold),
//         toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         sidebarBoxShadow: const [
//           BoxShadow(
//             color: Colors.indigo,
//             blurRadius: 20,
//             spreadRadius: 0.01,
//             offset: Offset(3, 3),
//           ),
//           BoxShadow(
//             color: Colors.green,
//             blurRadius: 50,
//             spreadRadius: 0.01,
//             offset: Offset(3, 3),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _body(Size size, BuildContext context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       color: Colors.blueGrey[50],
//       child: Center(
//         child: Transform.rotate(
//           angle: math.pi / 2,
//           child: Transform.translate(
//             offset: Offset(-size.height * 0.3, -size.width * 0.23),
//             child: Text(
//               _headline,
//               style: Theme.of(context).textTheme.displayLarge,
//               overflow: TextOverflow.visible,
//               softWrap: false,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
