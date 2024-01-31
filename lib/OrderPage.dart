import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/GioHang.dart';
import 'package:thiketthuchocphan_mobile/Bean/LichSuMua.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/Dao/GioHangDao.dart';
import 'package:thiketthuchocphan_mobile/Dao/LichSuMuaDao.dart';
import 'package:thiketthuchocphan_mobile/Dao/UserDao.dart';
import 'package:thiketthuchocphan_mobile/HistoryPage.dart';
import 'package:thiketthuchocphan_mobile/HomePage.dart';

class OrderPage extends StatelessWidget {
  final User user;
  late LichSuMua? ls;
  List<GioHang> list;
  OrderPage({this.ls,required this.user, required this.list,super.key});

  TextEditingController HoTenController = TextEditingController();
  TextEditingController SoDienThoaiController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController DiaChiController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    if(user!= null){
      HoTenController.text = user!.hoten;
      SoDienThoaiController.text = user!.sodienthoai;
      EmailController.text = user!.email;
      DiaChiController.text = user!.diachinhan;
    }
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(20),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 22,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Địa chỉ nhận hàng",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(162, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(0.9),
                          spreadRadius: 1,
                          blurRadius: 5
                        )
                      ],
                    ),
                    width: 370,
                    child: TextFormField(
                      controller: HoTenController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tên người nhận",
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.indigo.withOpacity(0.9),
                            spreadRadius: 1,
                            blurRadius: 5
                        )
                      ],
                    ),
                    width: 370,
                    child: TextFormField(
                      controller: SoDienThoaiController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Số điện thoại",
                          hintStyle: TextStyle(fontSize: 20)
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.indigo.withOpacity(0.9),
                            spreadRadius: 1,
                            blurRadius: 5
                        )
                      ],
                    ),
                    width: 370,
                    child: TextFormField(
                      controller: EmailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 20)
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.indigo.withOpacity(0.9),
                            spreadRadius: 1,
                            blurRadius: 5
                        )
                      ],
                    ),
                    width: 370,
                    child: TextFormField(
                      controller: DiaChiController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Địa chỉ chi tiết",
                          hintStyle: TextStyle(fontSize: 20)
                      ),
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  InkWell(
                    onTap: () async {
                      if(validateRequite(HoTenController.text) == false){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường họ tên!!!")));
                      }else{
                        if(validateRequite(SoDienThoaiController.text)== false){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường số điện thoại!!!")));
                        }else{
                          if(validateSoDienThoai(SoDienThoaiController.text)==false){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Trường số điện thoại không hợp lệ!!!")));
                          }else{
                            if(validateRequite(EmailController.text)== false){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường email!!!")));
                            }else{
                              if(validateEmail(EmailController.text)== false){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Trường email không hợp lệ!!!")));
                              }else{
                                if(validateRequite(DiaChiController.text)== false){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường địa chỉ!!!")));
                                }else{
                                  final User u = User(id: user?.id,hoten: user!.hoten, sodienthoai: user!.sodienthoai, email: user!.email, diachi: user!.diachi, diachinhan: DiaChiController.value.text, taikhoan: user!.taikhoan, matkhau: user!.matkhau);
                                  await UserDao.updateUser(u);
                                  int slHang = list.length;
                                  for(int i=0; i<slHang; i++){
                                    final LichSuMua lichsu= LichSuMua(id: ls?.id,soluong: list[i].soluong, idkhachhang: list[i].idkhachhang, diachinhan: DiaChiController.text, idsanpham: list[i].idsanpham, tensanpham: list[i].tensanpham, giacu: list[i].giacu, giamoi: list[i].giamoi, img: list[i].img, tendanhmuc: list[i].tendanhmuc);
                                    await LichSuMuaDao.insertLichSuMua(lichsu);
                                  }
                                  for(int i=0; i<slHang; i++){
                                    await GioHangDao.deleteGioHang(list[i]);
                                  }
                                  int sh = await GioHangDao.getSoLuongSpTrongGio(user.id!);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(user: user, shtg: sh,)));
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cảm ơn bạn đã mua sản phẩm của chúng tôi.")));
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Đặt hàng",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
  bool validateRequite(String value) {
    if (value == null || value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool validateEmail(String value) {
    RegExp regex = new RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)){
      return false;
    }else{
      return true;
    }
  }

  bool validateSoDienThoai(String value) {
    RegExp regex = new RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    if (!regex.hasMatch(value)){
      return false;
    }else{
      return true;
    }
  }
}
