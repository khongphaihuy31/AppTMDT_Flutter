import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/LichSuMua.dart';
import 'package:thiketthuchocphan_mobile/Bean/SanPham.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/CartPage.dart';
import 'package:thiketthuchocphan_mobile/Dao/LichSuMuaDao.dart';
import 'package:thiketthuchocphan_mobile/widgets/ProductDetail.dart';

class HistoryPage extends StatelessWidget {
  final User user;
  int shtg;
  HistoryPage({required this.shtg,required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 0,
                  ),
                  Text(
                    'Lịch sử mua hàng',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  //Icon giỏ hàng
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(user: user)));
                    },
                    child: Badge(
                        backgroundColor: Colors.red,
                        label: Text(
                          "${shtg}",
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
            SizedBox(height: 20,),
            FutureBuilder<List<LichSuMua?>>(
                future: LichSuMuaDao.getAllListLichSuMua(user.id),
                builder: (context, AsyncSnapshot<List<LichSuMua?>> snapshot){
                  if(snapshot.data != null){
                    return GridView.builder(
                      reverse: true,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.6,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          height: 225,
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 224, 224, 224),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.indigo.withOpacity(0.5),
                                              blurRadius: 5,
                                              spreadRadius: 1)
                                        ]),
                                    child: Image.asset(
                                      snapshot.data![index]!.img.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    height: 100,
                                    // padding: EdgeInsets.symmetric(
                                    //   vertical: 10,
                                    // ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 15,),
                                          Text(
                                            snapshot.data![index]!.tensanpham.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black.withOpacity(0.7),
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:[
                                                Text(
                                                  snapshot.data![index]!.giamoi.toString() + 'đ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.indigo.withOpacity(0.9)),
                                                ),
                                                SizedBox(width: 10,),
                                                Text('x '+ snapshot.data![index]!.soluong.toString(), style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400
                                                ),)
                                              ]
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Thành tiền:',
                                    style: TextStyle(
                                        fontSize: 23
                                    ),
                                  ),
                                  Text((snapshot.data![index]!.giamoi!.toInt() * snapshot.data![index]!.soluong!.toInt()).toString()+'đ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.indigo.withOpacity(0.9),
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 15,),
                              InkWell(
                                onTap: () {
                                  SanPham sp = SanPham(id: snapshot.data?[index]?.id,tensanpham: snapshot.data![index]!.tensanpham!, giacu: snapshot.data![index]!.giacu!, giamoi: snapshot.data![index]!.giamoi!, img: snapshot.data![index]!.img!, tendanhmuc: snapshot.data![index]!.tendanhmuc!);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                            user: user, sp: sp,
                                          )));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                                  decoration: BoxDecoration(
                                      color: Colors.indigo.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    "Mua lại",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                        color: Colors.white.withOpacity(0.9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        itemCount: snapshot.data!.length,
                    );
                  }else{
                   return Text("Chưa có sản phẩm nào",
                    style: TextStyle(
                      fontSize: 20, color: Colors.indigo.withOpacity(0.9), fontWeight: FontWeight.bold
                    ),
                   );
                  }
                }
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
