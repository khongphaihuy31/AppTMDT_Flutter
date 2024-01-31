import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/Dao/GioHangDao.dart';
import 'package:thiketthuchocphan_mobile/Dao/UserDao.dart';
import 'package:thiketthuchocphan_mobile/HomePage.dart';
import 'package:thiketthuchocphan_mobile/MyselfPage.dart';

class InfoUser extends StatefulWidget {
  late User user;
  InfoUser({required this.user,super.key});

  @override
  State<InfoUser> createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  TextEditingController HoTenController = TextEditingController();

  TextEditingController SoDienThoaiController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController DiaChiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(widget.user != null){
      HoTenController.text = widget.user.hoten;
      SoDienThoaiController.text = widget.user.sodienthoai;
      EmailController.text = widget.user.email;
      DiaChiController.text = widget.user.diachi;
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
                      "Thông tin",
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
                    controller: HoTenController,
                    decoration: InputDecoration(
                        hintText: "Họ tên",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person, color: Colors.black.withOpacity(0.8),),
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                    ),
                    style: TextStyle(fontSize: 22),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15,),
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
                    controller: SoDienThoaiController,
                    decoration: InputDecoration(
                        hintText: "Số điện thoại",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone, color: Colors.black.withOpacity(0.8),),
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
              SizedBox(height: 15,),
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
                    controller: EmailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, color: Colors.black.withOpacity(0.8),),
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
              SizedBox(height: 15,),
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
                        hintText: "Địa chỉ",
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
                  if(validateRequite(HoTenController.text) == false){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường họ tên!!!")));
                  }else{
                    if(validateRequite(SoDienThoaiController.text)== false){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường số điện thoại!!!")));
                    }else{
                      if(validateSoDienThoai(SoDienThoaiController.text)== false){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Trường số điện thoại không hợp lệ!!!")));
                      }else{
                        if(validateRequite(EmailController.text)== false){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường email!!!")));
                        }else{
                          if(validateEmail(EmailController.text)== false){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Trường email không hợp lệ!!!")));
                          }else{
                            if(validateRequite(DiaChiController.text)==false){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường địa chỉ!!!")));
                            }else{
                              final User u = User(id: widget.user?.id,hoten: HoTenController.value.text, sodienthoai: SoDienThoaiController.value.text, email: EmailController.value.text, diachi: DiaChiController.value.text, diachinhan: widget.user.diachinhan, taikhoan: widget.user.taikhoan, matkhau: widget.user.matkhau);
                              await UserDao.updateUser(u);
                              int sh = await GioHangDao.getSoLuongSpTrongGio(u.id!);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(user: u, shtg: sh,)));
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cập nhật thành công")));
                            }
                          }
                        }
                      }
                    }
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
