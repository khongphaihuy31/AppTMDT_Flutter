import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/GioHang.dart';
import 'package:thiketthuchocphan_mobile/Bean/SanPham.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/CartPage.dart';
import 'package:thiketthuchocphan_mobile/Dao/GioHangDao.dart';

class CustomBottomSheet extends StatefulWidget {
  late GioHang? giohang;
  final SanPham? sp;
  final User user;
  CustomBottomSheet({this.giohang,required this.user,required this.sp, super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  List size = [
    'S','M','L','XL','XXL'
  ];

  int sl= 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, bottom: 50, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 223, 221, 221),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Text(
                "Size: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 30,),
              for(int i=0; i<size.length;i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(8),
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
                  child: Text(size[i], style: TextStyle(fontSize: 18),),
                )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Text(
                "Màu: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 30,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Text(
                "Số lượng:",
                style: TextStyle(
                fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(width: 30,),
              InkWell(
                onTap: (){
                  if(sl>1){
                    setState(() {
                      sl--;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.indigo.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 9
                        )
                      ]
                  ),
                  child: Icon(
                    CupertinoIcons.minus,
                    size: 20,
                    color: Colors.indigo.withOpacity(0.9),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Text(
                sl.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(width: 10,),
              InkWell(
                onTap: (){
                  setState(() {
                    sl++;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.indigo.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 9
                        )
                      ]
                  ),
                  child: Icon(
                    CupertinoIcons.add,
                    size: 20,
                    color: Colors.indigo.withOpacity(0.9),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Tổng tiền:",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                ((widget.sp?.giamoi)! * sl).toString()+"đ",
                style: TextStyle(
                  color: Colors.indigo.withOpacity(0.9),
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
          SizedBox(height: 40,),
          InkWell(
            onTap: () async {
              int? idsanpham = widget.sp?.id?.toInt();
              int?  idkhachhang = widget.user.id?.toInt();
              if(await GioHangDao.kiemTraSanPham(idsanpham!, idkhachhang!)== true){
                int soluong = await GioHangDao.getSoLuong(idsanpham!, idkhachhang!);
                int SLuong= soluong+sl;
                GioHang? giohang = await GioHangDao.getGioHang(idsanpham!, idkhachhang!);
                final GioHang gh = GioHang(id: giohang?.id,soluong: SLuong, idkhachhang: giohang?.idkhachhang, idsanpham: giohang?.idsanpham, tensanpham: giohang?.tensanpham, giacu: giohang?.giacu, giamoi: giohang?.giamoi, img: giohang?.img, tendanhmuc: giohang?.tendanhmuc);
                await GioHangDao.updateGioHang(gh);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Thêm sản phẩm vào giỏ hàng thành công.")));
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => CartPage(user: widget.user)
                )
                );
              }else {
                final GioHang gh = GioHang(id: widget.giohang?.id,soluong: sl, idkhachhang: widget.user?.id, idsanpham: widget.sp?.id, tensanpham: widget.sp?.tensanpham, giacu: widget.sp?.giacu, giamoi: widget.sp?.giamoi, img: widget.sp?.img, tendanhmuc: widget.sp?.tendanhmuc);
                await GioHangDao.insertGioHang(gh);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Thêm sản phẩm vào giỏ hàng thành công.")));
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => CartPage(user: widget.user)
                )
                );
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text(
                "Mua ngay",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: Colors.white.withOpacity(0.9)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
