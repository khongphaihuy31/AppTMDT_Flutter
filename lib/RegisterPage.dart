import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/Dao/UserDao.dart';
import 'package:thiketthuchocphan_mobile/LoginPage.dart';

class RegisterPage extends StatefulWidget {
  late User? user;
  RegisterPage({this.user,super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController HoTenController = TextEditingController();
  TextEditingController SoDienThoaiController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController DiaChiController = TextEditingController();
  TextEditingController TaiKhoanController = TextEditingController();
  TextEditingController MatKhauController = TextEditingController();
  TextEditingController NhapLaiMatKhauController = TextEditingController();

  bool _isObscure = true;
  bool _isObscureReup = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Image.asset("assets/images/login/register1.png"),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                            )
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: TaiKhoanController,
                        decoration: InputDecoration(
                            hintText: "Tài khoản",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person, color: Colors.black.withOpacity(0.8),),
                            hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            )
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: MatKhauController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            hintText: "Mật khẩu",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock, color: Colors.black.withOpacity(0.8),),
                            hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.black.withOpacity(0.8),),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }
                            ),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: NhapLaiMatKhauController,
                        obscureText: _isObscureReup,
                        decoration: InputDecoration(
                            hintText: "Nhập lại mật khẩu",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock, color: Colors.black.withOpacity(0.8),),
                            hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscureReup ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.black.withOpacity(0.8),),
                                onPressed: () {
                                  setState(() {
                                    _isObscureReup = !_isObscureReup;
                                  });
                                }
                            ),
                        ),
                        cursorColor: Colors.black,
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
                                  if(validateRequite(TaiKhoanController.text) == false){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường tài khoản!!!")));
                                  }else{
                                    if(validateRequite(MatKhauController.text)==false){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường mật khẩu!!!")));
                                    }else{
                                      if(validateRequite(NhapLaiMatKhauController.text)==false){
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập trường nhập lại mật khẩu!!!")));
                                      }else{
                                        if(validateNhapLaiMatKhau(NhapLaiMatKhauController.text, MatKhauController.text)==false){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Nhập lại mật khẩu không khớp!!!")));
                                        }else{
                                          String taikhoan = TaiKhoanController.text;
                                          if(await UserDao.kiemTraDangKy(taikhoan)== false){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Đã có người đăng ký tài khoản này!!!")));
                                          }else{
                                            final User u = User(id: widget.user?.id,hoten: HoTenController.value.text, sodienthoai: SoDienThoaiController.value.text, email: EmailController.value.text, diachi: DiaChiController.value.text, diachinhan: '', taikhoan: TaiKhoanController.value.text, matkhau: MatKhauController.value.text);
                                            await UserDao.insertUser(u);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Đăng ký thành công")));
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                          child: Text(
                            "Đăng ký",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 2,
                                letterSpacing: 1,
                                color: Colors.black87
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn đã có tài khoản?",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LoginPage()
                          ));
                        },
                        child: Text(
                          "Đăng nhập",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo.withOpacity(0.9)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60,),
                ],
              ),
            ),
          ),
        ),
      ),
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

  bool validateNhapLaiMatKhau(String value, String valueMatKhau) {
    if (value != valueMatKhau){
      return false;
    }else{
      return true;
    }
  }
}
