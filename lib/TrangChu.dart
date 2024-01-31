// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'CustomSearch.dart';
//
// class TrangChu extends StatelessWidget {
//   TrangChu({super.key});
//   List<String> listSlider = [
//     "assets/images/slider/slide1.jpg",
//     "assets/images/slider/slide2.jpg",
//     "assets/images/slider/slide3.jpg",
//     "assets/images/slider/slide4.jpg",
//     "assets/images/slider/slide5.jpg",
//     "assets/images/slider/slide6.jpg"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: OutlinedButton(
//               onPressed: () {
//                 showSearch(context: context, delegate: CustomSearch());
//               },
//               style: OutlinedButton.styleFrom(
//                 fixedSize: Size(300, 30),
//                 foregroundColor: Colors.blue,
//                 side: const BorderSide(
//                   width: 2.0,
//                   color: Colors.blue,
//                   style: BorderStyle.solid,
//                 ),
//               ),
//               child: const Row(
//                 children: [
//                   Icon(
//                     Icons.search,
//                     size: 30,
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     'Tìm sản phẩm',
//                     style: TextStyle(fontSize: 18),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Stack(
//             children: [
//               TextButton(
//                   onPressed: () {},
//                   child: Icon(
//                     Icons.shopping_cart,
//                     size: 35,
//                   )),
//               Positioned(
//                 child: Container(
//                   width: 25,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                       border: Border.all(
//                           color: Colors.blue,
//                           width: 2,
//                           style: BorderStyle.solid)),
//                   child: Center(
//                     child: Text(
//                       '1',
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 top: 0,
//                 right: 2,
//               )
//             ],
//           )
//         ],
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(children: [
//                     CarouselSlider(
//                       items: [
//                         Expanded(
//                           child: Container(
//                             margin: EdgeInsets.all(8.0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.0),
//                               image: DecorationImage(
//                                   image: AssetImage(
//                                       "assets/images/slider/slide1.jpg"),
//                                   fit: BoxFit.cover),
//                             ),
//                           ),
//                         )
//                       ],
//                       options: CarouselOptions(
//                         enlargeCenterPage: true,
//                         autoPlay: true,
//                         aspectRatio: 16 / 7,
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enableInfiniteScroll: true,
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                         viewportFraction: 1,
//                       ),
//                     ),
//                   ]),
//                 ),
//               )
//             ],
//           ),
//           scrollDirection: Axis.vertical,
//         ),
//       ),
//       bottomNavigationBar: ConvexAppBar(
//         style: TabStyle.react,
//         items: [
//           TabItem(
//               icon: Icon(
//             Icons.home,
//             size: 35,
//             color: Colors.white,
//           )),
//           TabItem(
//             icon: Icon(
//               Icons.shopping_cart_outlined,
//               size: 35,
//               color: Colors.white,
//             ),
//           ),
//           TabItem(
//             icon: Icon(
//               Icons.history_sharp,
//               size: 35,
//               color: Colors.white,
//             ),
//           ),
//           TabItem(
//               icon: Icon(
//             Icons.account_box_outlined,
//             size: 35,
//             color: Colors.white,
//           )),
//         ],
//         height: 70,
//       ),
//
//       // BottomNavigationBar(
//       //     items: [
//       //       BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'Trang chủ',),
//       //       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,), label: 'Giỏ',),
//       //       BottomNavigationBarItem(icon: Icon(Icons.history_sharp, ), label: 'Lịch sử',),
//       //       BottomNavigationBarItem(icon: Icon(Icons.history_sharp, ), label: 'Lịch sử',)
//       //     ],
//       //   selectedFontSize: 20,
//       //   selectedItemColor: Colors.blue[800],
//       //   unselectedFontSize: 40,
//       //   unselectedItemColor: Colors.black,
//       //   mouseCursor: MouseCursor.defer,
//       //   iconSize: 30,
//       // ),
//     );
//   }
//   // showListSlider(List<String> listSlider){
//   //   return SingleChildScrollView(
//   //     scrollDirection: Axis.horizontal,
//   //     child: Row(
//   //         children: [
//   //           CarouselSlider(
//   //             items: [
//   //               ...listSlider.map((e){
//   //                 return showSlider(e);
//   //               })
//   //             ],
//   //             options: CarouselOptions(
//   //               enlargeCenterPage: true,
//   //               autoPlay: true,
//   //               aspectRatio: 16 / 7,
//   //               autoPlayCurve: Curves.fastOutSlowIn,
//   //               enableInfiniteScroll: true,
//   //               autoPlayAnimationDuration: Duration(milliseconds: 800),
//   //               viewportFraction: 1,
//   //             ),
//   //           ),
//   //         ]
//   //     ),
//   //   );
//   // }
//   //
//   // showSlider(String e){
//   //   return Container(
//   //     margin: EdgeInsets.all(8.0),
//   //     decoration: BoxDecoration(
//   //       borderRadius: BorderRadius.circular(10.0),
//   //       image: DecorationImage(
//   //         image: AssetImage(e),
//   //         fit: BoxFit.cover
//   //       ),
//   //     ),
//   //   );
//   // }
// }
