import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/GioHang.dart';
import 'package:thiketthuchocphan_mobile/Bean/SanPham.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/Dao/GioHangDao.dart';
import 'package:thiketthuchocphan_mobile/OrderPage.dart';
import 'package:thiketthuchocphan_mobile/widgets/CartProduct.dart';

class CartPage extends StatefulWidget {
  final User user;
  CartPage({required this.user, super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> ListCostProduct = [500000, 260000, 340000];
  bool checkedValue = false;


  int tongTien = 0;
  List<GioHang> listGH = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 22,
                        ),
                      ),
                    ),
                    Text(
                      "Giỏ hàng",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.more_horiz,
                          size: 22,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  child: Column(
                children: [
                  FutureBuilder<List<GioHang?>>(
                    future:
                        GioHangDao.getAllListGioHang(widget.user?.id?.toInt()),
                    builder: (context, AsyncSnapshot<List<GioHang?>> snapshot) {
                      if (snapshot.data != null) {
                        tongTien = 0;
                        listGH.clear();
                        for (int i = 0; i < snapshot.data!.length; i++) {
                          WidgetsBinding.instance!.addPostFrameCallback((_) {
                            setState(() {
                              tongTien += (snapshot.data![i]!.soluong * snapshot.data![i]!.giamoi!.toInt());
                            });
                          });
                          listGH.add(snapshot.data![i]!);
                        }
                        return GridView.builder(
                          reverse: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 3.6,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // ListView.builder(
                          // scrollDirection: Axis.vertical,
                          //   shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                            height: 80,
                            // margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.only(
                                right: 10, top: 10, bottom: 10, left: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                // Checkbox(
                                //   activeColor: Colors.indigo.withOpacity(0.9),
                                //     value: checkedValue,
                                //     onChanged: (value){
                                //     setState(() {
                                //       checkedValue = value!;
                                //     });
                                //     }
                                // ),
                                Container(
                                  height: 70,
                                  width: 70,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 224, 224, 224),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.indigo.withOpacity(0.5),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ]),
                                  child: Image.asset(
                                    snapshot.data![index]!.img.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  width: 150,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data![index]!.tensanpham
                                              .toString()
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          snapshot.data![index]!.giamoi
                                                  .toString() +
                                              "đ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.indigo
                                                  .withOpacity(0.9)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                listGH.clear();
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Bạn có chắc chắn muốn xóa sản phẩm này không?'),
                                                  actions: [
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .red)),
                                                      onPressed: () async {
                                                        await GioHangDao
                                                            .deleteGioHang(
                                                                snapshot.data![
                                                                    index]!);
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      },
                                                      child: const Text('Có'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child:
                                                          const Text('Không'),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        child: Icon(Icons.delete,
                                            color:
                                                Colors.indigo.withOpacity(0.9)),
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              int sl = snapshot
                                                  .data![index]!.soluong;
                                              if (sl > 1) {

                                                sl = sl - 1;
                                                int? idsanpham = snapshot
                                                    .data?[index]?.idsanpham
                                                    ?.toInt();
                                                int? idkhachhang = snapshot
                                                    .data?[index]?.idkhachhang
                                                    ?.toInt();
                                                GioHang? giohang =
                                                    await GioHangDao.getGioHang(
                                                        idsanpham!,
                                                        idkhachhang!);
                                                final GioHang gh = GioHang(
                                                    id: giohang?.id,
                                                    soluong: sl,
                                                    idkhachhang:
                                                        giohang?.idkhachhang,
                                                    idsanpham:
                                                        giohang?.idsanpham,
                                                    tensanpham:
                                                        giohang?.tensanpham,
                                                    giacu: giohang?.giacu,
                                                    giamoi: giohang?.giamoi,
                                                    img: giohang?.img,
                                                    tendanhmuc:
                                                        giohang?.tendanhmuc);
                                                await GioHangDao.updateGioHang(
                                                    gh);

                                                setState(() {});
                                                listGH.clear();
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFF7F8FA),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.indigo
                                                            .withOpacity(0.5),
                                                        spreadRadius: 1,
                                                        blurRadius: 9)
                                                  ]),
                                              child: Icon(
                                                CupertinoIcons.minus,
                                                size: 20,
                                                color: Colors.indigo
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            snapshot.data![index]!.soluong
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              int sl = snapshot.data![index]!.soluong;
                                              sl = sl + 1;
                                              int? idsanpham = snapshot.data?[index]?.idsanpham?.toInt();
                                              int? idkhachhang = snapshot.data?[index]?.idkhachhang?.toInt();
                                              GioHang? giohang =
                                                  await GioHangDao.getGioHang(
                                                      idsanpham!, idkhachhang!);
                                              final GioHang gh = GioHang(
                                                  id: giohang?.id,
                                                  soluong: sl,
                                                  idkhachhang:
                                                      giohang?.idkhachhang,
                                                  idsanpham: giohang?.idsanpham,
                                                  tensanpham:
                                                      giohang?.tensanpham,
                                                  giacu: giohang?.giacu,
                                                  giamoi: giohang?.giamoi,
                                                  img: giohang?.img,
                                                  tendanhmuc:
                                                      giohang?.tendanhmuc);
                                              await GioHangDao.updateGioHang(
                                                  gh);
                                              setState(() {});
                                              listGH.clear();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFF7F8FA),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.indigo
                                                            .withOpacity(0.5),
                                                        spreadRadius: 1,
                                                        blurRadius: 9)
                                                  ]),
                                              child: Icon(
                                                CupertinoIcons.add,
                                                size: 20,
                                                color: Colors.indigo
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          itemCount: snapshot.data!.length,
                        );
                      } else {
                        return Text('Giỏ hàng trống');
                      }
                    },
                  ),
                ],
              )

                  // CartProduct(user: widget.user),
                  ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.indigo.withOpacity(0.9),
                          blurRadius: 5,
                          spreadRadius: 1)
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phí giao hàng:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "0đ",
                          style: TextStyle(
                              color: Colors.indigo.withOpacity(0.9),
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tổng tiền:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${tongTien}đ",
                          // layTongTien(listGH)+ 'đ',
                          style: TextStyle(
                              color: Colors.indigo.withOpacity(0.9),
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print(listGH.length);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderPage(
                                user: widget.user,list: listGH,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Thanh toán",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
