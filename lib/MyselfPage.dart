import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/CartPage.dart';
import 'package:thiketthuchocphan_mobile/InfoUser.dart';
import 'package:thiketthuchocphan_mobile/LoginPage.dart';
import 'package:thiketthuchocphan_mobile/widgets/DiaChiNhan.dart';
import 'package:thiketthuchocphan_mobile/widgets/DoiMatKhau.dart';

class MySelfPage extends StatelessWidget {
  final User user;
  int shtg;
  MySelfPage({required this.shtg,required this.user,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                        color:
                        Colors.indigo.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  // borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(user: user)));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Badge(
                                backgroundColor: Colors.red,
                                label: Text(
                                  "$shtg",
                                  style: TextStyle(fontSize: 15),
                                ),
                                largeSize: 20,
                                child: Icon(
                                  Icons.shopping_cart,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        Icon(Icons.account_circle, color: Colors.white,size: 80,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.hoten, style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 15,),
                            Text(user.email,style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                            ),)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 256,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding:
                EdgeInsets.only(right: 10, top: 10, bottom: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color:
                        Colors.indigo.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 1)
                  ],
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoUser(user: user,)));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person, size: 25,color: Colors.indigo.withOpacity(0.9),),
                                SizedBox(width: 10,),
                                Text(
                                  "Thông tin tài khoản",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Icon(Icons.navigate_next, size: 25,color: Colors.indigo.withOpacity(0.9),),
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: 1,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DiaChiNhan(user: user,)
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 25,color: Colors.indigo.withOpacity(0.9),),
                                SizedBox(width: 10,),
                                Text(
                                  "Địa chỉ nhận hàng",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Icon(Icons.navigate_next, size: 25,color: Colors.indigo.withOpacity(0.9),),
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: 1,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoiMatKhau(
                                  user: user
                                )));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.border_color_outlined, size: 25,color: Colors.indigo.withOpacity(0.9),),
                                SizedBox(width: 10,),
                                Text(
                                  "Đổi mật khẩu",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Icon(Icons.navigate_next, size: 25,color: Colors.indigo.withOpacity(0.9),),
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: 1,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.logout, size: 25,color: Colors.indigo.withOpacity(0.9),),
                                SizedBox(width: 10,),
                                Text(
                                  "Đăng xuất",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
