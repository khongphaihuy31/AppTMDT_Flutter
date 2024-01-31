import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/SanPham.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/CartPage.dart';
import 'package:thiketthuchocphan_mobile/ContentHomePage.dart';
import 'package:thiketthuchocphan_mobile/CustomSearch.dart';
import 'package:thiketthuchocphan_mobile/Dao/UserDao.dart';
import 'package:thiketthuchocphan_mobile/HistoryPage.dart';
import 'package:thiketthuchocphan_mobile/MyselfPage.dart';
import 'package:thiketthuchocphan_mobile/widgets/HomeBottonBar.dart';
import 'package:thiketthuchocphan_mobile/widgets/HomePageProduct.dart';

class HomePage extends StatefulWidget {
  final User user;
  int shtg;
  HomePage({required this.shtg,required this.user, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final tab =[
      ContentHomePage(user: widget.user, shtg: widget.shtg,),
      HistoryPage(user: widget.user, shtg: widget.shtg,),
      MySelfPage(user: widget.user, shtg: widget.shtg,)
    ];
    return Scaffold(
        body: tab[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
            color: Colors.indigo.withOpacity(0.9),
            height: 70,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              CurvedNavigationBarItem(
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                  ),
                label: "Trang chủ",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                )
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.history,
                  size: 30,
                  color: Colors.white,
                ),
                  label: "Lịch sử",
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  )
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
                label: "Tôi",
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  )
              ),
            ]
        )
    );
  }
}
