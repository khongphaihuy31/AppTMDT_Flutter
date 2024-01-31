import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/Dao/GioHangDao.dart';
import 'package:thiketthuchocphan_mobile/Dao/UserDao.dart';
import 'package:thiketthuchocphan_mobile/HomePage.dart';
import 'package:thiketthuchocphan_mobile/MyselfPage.dart';

class DiaChiNhan extends StatefulWidget {
  late User user;
  DiaChiNhan({required this.user,super.key});

  @override
  State<DiaChiNhan> createState() => _InfoUserState();
}

class _InfoUserState extends State<DiaChiNhan> {

  TextEditingController DiaChiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(widget.user != null){
      DiaChiController.text = widget.user.diachinhan;
    }
    return SafeArea(
        child: Scaffold(
            body: ListView(
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
                        "Địa chỉ nhận",
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Icon(
                            Icons.more_horiz,
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.all(10),
                //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //     boxShadow: [
                //       BoxShadow(
                //           color:
                //           Colors.indigo.withOpacity(0.5),
                //           blurRadius: 5,
                //           spreadRadius: 1)
                //     ],
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Họ tên:",
                //         style: TextStyle(
                //             fontSize: 23,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.indigo.withOpacity(0.9)),
                //       ),
                //       Text(
                //         user.hoten,
                //         style: TextStyle(
                //             fontSize: 23,
                //             fontWeight: FontWeight.w400,
                //             color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: DiaChiController,
                      decoration: InputDecoration(
                          hintText: "Địa chỉ nhận",
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.location_on, color: Colors.black.withOpacity(0.8),),
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          )
                      ),
                      style: TextStyle(fontSize: 22),
                      cursorColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: () async {
                    if(validateRequite(DiaChiController.text)==false){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường địa chỉ nhận!!!")));
                    }else{
                      final User u = User(id: widget.user?.id,hoten: widget.user.hoten, sodienthoai: widget.user.sodienthoai, email: widget.user.email, diachi: widget.user.diachi, diachinhan: DiaChiController.value.text, taikhoan: widget.user.taikhoan, matkhau: widget.user.matkhau);
                      await UserDao.updateUser(u);
                      int sh = await GioHangDao.getSoLuongSpTrongGio(u.id!);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(user: u, shtg: sh,)));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cập nhật thành công")));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                        child: Text(
                          "Cập nhật",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 2,
                              letterSpacing: 1,
                              color: Colors.white
                          ),
                        )
                    ),
                  ),
                ),
              ],
            )
        )
    );
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

  bool validateRequite(String value) {
    if (value == null || value.isEmpty){
      return false;
    }else{
      return true;
    }
  }
}
