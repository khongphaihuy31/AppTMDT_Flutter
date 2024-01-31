import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thiketthuchocphan_mobile/Bean/GioHang.dart';
import 'package:thiketthuchocphan_mobile/Bean/SanPham.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/CartPage.dart';
import 'package:thiketthuchocphan_mobile/Dao/GioHangDao.dart';
import 'package:thiketthuchocphan_mobile/HomePage.dart';
import 'package:thiketthuchocphan_mobile/widgets/CustomBottomSheet.dart';

class ProductDetail extends StatelessWidget {
  late GioHang? giohang;
  final SanPham sp;
  final User user;
  ProductDetail({required this.user,required this.sp, this.giohang,super.key});
  List size = [
    'S','M','L','XL','XXL'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(sp.img),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.indigo.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 9
                      )
                    ]
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            int sh = await GioHangDao.getSoLuongSpTrongGio(user.id!);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(user: user, shtg: sh,)));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.indigo.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 22,
                            ),
                          ),
                        ),
                        // Hình trái tim bên góc phải màn hình
                        // InkWell(
                        //   onTap: (){
                        //     Navigator.pop(context);
                        //   },
                        //   child: Container(
                        //     padding: EdgeInsets.all(10),
                        //     decoration: BoxDecoration(
                        //       color: Colors.indigo.withOpacity(0.5),
                        //       borderRadius: BorderRadius.circular(30),
                        //     ),
                        //     child: Icon(
                        //       Icons.favorite,
                        //       color: Colors.red,
                        //       size: 22,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8,left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.monetization_on,
                              size: 30,
                              color: Colors.indigo.withOpacity(0.9),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              sp.giamoi.toString()+"đ",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo.withOpacity(0.9)
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              sp.giacu.toString()+"đ",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.withOpacity(0.9),
                                decoration: TextDecoration.lineThrough
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // padding: EdgeInsets.only(right: 5),
                        child: Text(
                          sp.tensanpham,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 15,),
                      RatingBar.builder(
                        unratedColor: Color.fromARGB(255, 223, 221, 221),
                          itemSize: 28,
                          initialRating: 3.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating){},
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "- Áo dáng suông Staple, thuộc bộ sưu tập Open Air, mang hơi thở đường phố Mỹ với các gam màu rất nổi bật.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54
                        ),
                      ),
                      Text(
                        "- Chất liệu 100% cotton, mỏng nhẹ, thoáng mát.",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54
                        ),
                      ),
                      Text(
                        "- Thời gian giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày.",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54
                        ),
                      ),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () async {
                              int? idsanpham = sp?.id?.toInt();
                              int?  idkhachhang = user.id?.toInt();
                              if(await GioHangDao.kiemTraSanPham(idsanpham!, idkhachhang!)){
                                int soluong = await GioHangDao.getSoLuong(idsanpham!, idkhachhang!);
                                int SLuong= soluong+1;
                                GioHang? giohang = await GioHangDao.getGioHang(idsanpham!, idkhachhang!);
                                final GioHang gh = GioHang(id: giohang?.id,soluong: SLuong, idkhachhang: giohang?.idkhachhang, idsanpham: giohang?.idsanpham, tensanpham: giohang?.tensanpham, giacu: giohang?.giacu, giamoi: giohang?.giamoi, img: giohang?.img, tendanhmuc: giohang?.tendanhmuc);
                                await GioHangDao.updateGioHang(gh);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Thêm sản phẩm vào giỏ hàng thành công.")));
                                int sh = await GioHangDao.getSoLuongSpTrongGio(user.id!);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(user: user, shtg: sh,)));
                              }else {
                                final GioHang gh = GioHang(id: giohang?.id,soluong: 1, idkhachhang: user?.id, idsanpham: sp?.id, tensanpham: sp.tensanpham, giacu: sp.giacu, giamoi: sp.giamoi, img: sp.img, tendanhmuc: sp.tendanhmuc);
                                await GioHangDao.insertGioHang(gh);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Thêm sản phẩm vào giỏ hàng thành công.")));
                                int sh = await GioHangDao.getSoLuongSpTrongGio(user.id!);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(user: user, shtg: sh,)));
                              }

                            },
                            child: Container(
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F8FA),
                                borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.indigo.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 9
                                    )
                                  ]
                              ),
                              child: Icon(
                                Icons.shopping_cart,
                                size: 30,
                                color: Colors.indigo.withOpacity(0.9),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context){
                                //   Bắt đầu CustomBottomSheet
                                return CustomBottomSheet(user: user,sp: sp);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 70),
                              decoration: BoxDecoration(
                                  color: Colors.indigo.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.indigo.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 9
                                    )
                                  ]
                              ),
                              child: Text(
                                "Mua ngay",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                  color: Colors.white.withOpacity(0.8)
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50,)
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
