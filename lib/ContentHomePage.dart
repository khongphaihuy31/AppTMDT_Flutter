import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/CartPage.dart';
import 'package:thiketthuchocphan_mobile/CustomSearch.dart';
import 'package:thiketthuchocphan_mobile/widgets/HomePageProduct.dart';
import 'package:thiketthuchocphan_mobile/widgets/HomePageProductAoKhoac.dart';
import 'package:thiketthuchocphan_mobile/widgets/HomePageProductAoPolo.dart';
import 'package:thiketthuchocphan_mobile/widgets/HomePageProductAoSoMi.dart';
import 'package:thiketthuchocphan_mobile/widgets/HomePageProductAoThun.dart';
import 'package:thiketthuchocphan_mobile/widgets/HomePageProductQuanJean.dart';
import 'package:thiketthuchocphan_mobile/widgets/HomePageProductQuanShorts.dart';

class ContentHomePage extends StatefulWidget {
  final User user;
  int shtg;
  ContentHomePage({required this.shtg,required this.user,super.key});

  @override
  State<ContentHomePage> createState() => _ContentHomePageState();
}

class _ContentHomePageState extends State<ContentHomePage> {
  List<String> imgListUuDai = [
    "assets/images/slider/slide1.jpg",
    "assets/images/slider/slide5.jpg",
    "assets/images/slider/slide4.jpg"
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tab =[
      HomePageProduct(user: widget.user),
      HomePageProductAoThun(user: widget.user),
      HomePageProductAoPolo(user: widget.user),
      HomePageProductAoKhoac(user: widget.user),
      HomePageProductAoSoMi(user: widget.user),
      HomePageProductQuanJean(user: widget.user),
      HomePageProductQuanShorts(user: widget.user)
    ];
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex=0;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 224, 224),
                          boxShadow: [
                            BoxShadow(
                                color:
                                Colors.indigo.withOpacity(0.5),
                                blurRadius: 5,
                                spreadRadius: 5)
                          ]),
                      child: Image.asset(
                        "assets/images/logo/logo1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //appBar tìm kiếm
                  InkWell(
                    onTap: () {
                      showSearch(context: context, delegate: CustomSearch(user: widget.user));
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFFF7F8FA),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                              )
                            ]),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.search,
                                size: 30, color: Colors.black54),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Tìm kiếm sản phẩm",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black54),
                            ),
                          ],
                        )),
                  ),
                  //Icon giỏ hàng
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(user: widget.user)));
                    },
                    child: Badge(
                        backgroundColor: Colors.red,
                        label: Text(
                          "${widget.shtg}",
                          style: TextStyle(fontSize: 15),
                        ),
                        largeSize: 20,
                        child: Icon(
                          Icons.shopping_cart,
                          size: 40,
                          color: Colors.indigo.withOpacity(0.9),
                        )),
                  ),
                ],
              ),
            ),
            // ảnh chuyển động

            Container(
              child: CarouselSlider(
                items: imgListUuDai
                    .map((item) => Container(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        item,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  for (int i = 1; i < 7; i++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = i;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5)
                            ]),
                        child: Image.asset(
                          "assets/images/category/$i.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                ],
              ),
            ),
            tab[_currentIndex]
            // HomePageProduct(user: widget.user),
          ],
        ),
      ),
    );
  }
}
