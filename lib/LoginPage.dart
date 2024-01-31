import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/SanPham.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/Dao/GioHangDao.dart';
import 'package:thiketthuchocphan_mobile/Dao/SanPhamDao.dart';
import 'package:thiketthuchocphan_mobile/Dao/UserDao.dart';
import 'package:thiketthuchocphan_mobile/HomePage.dart';
import 'package:thiketthuchocphan_mobile/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  // late User? user;
  final SanPham? sp;

  LoginPage({this.sp, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // User u1 =const User(hoten: 'Tôn Thất Nhật Huy', sodienthoai: '0985243520', email: 'nhathuy@gmail.com ', diachi: '1 Ngô Nhân Tịnh', diachinhan: '1/485 Chi Lăng', taikhoan: 'huy', matkhau: '123');
  // User u2 = const User(hoten: 'Tôn Thất Cảnh Tuệ', sodienthoai: '1234567891', email: 'huy@gmail.com ', diachi: '2 Ngô Nhân Tịnh', diachinhan: '1/485 Chi Lăng', taikhoan: 'tue', matkhau: '123');
  // List<User> tk= [];

  TextEditingController TaiKhoanController = TextEditingController();

  TextEditingController MatKhauController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // tk.add(u2);
    // tk.add(u1);
    // if(widget.user != null){
    //   tk.add(widget.user!);
    //   widget.user = null;
    // }
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/login/login.png"),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: TextFormField(
                            controller: TaiKhoanController,
                            decoration: InputDecoration(
                                hintText: "Tài khoản",
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: TextFormField(
                            controller: MatKhauController,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              hintText: "Mật khẩu",
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              hintStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () async {
                          // final SanPham sp1 = SanPham(id: widget.sp?.id,tensanpham: "Kappa áo thun tay ngắn", giacu: 400000, giamoi: 350000, img: "assets/images/tatca/1.jpg", tendanhmuc: "tatca");
                          // final SanPham sp2 = SanPham(id: widget.sp?.id,tensanpham: "Áo khoác thời trang", giacu: 600000, giamoi: 500000, img: "assets/images/tatca/2.jpg", tendanhmuc: "tatca");
                          // final SanPham sp3 = SanPham(id: widget.sp?.id,tensanpham: "Quần short jean nữ", giacu: 399000, giamoi: 260000, img: "assets/images/tatca/3.jpg", tendanhmuc: "tatca");
                          // final SanPham sp4 = SanPham(id: widget.sp?.id,tensanpham: "Quần short nam vải Kaki", giacu: 499000, giamoi: 340000, img: "assets/images/tatca/4.jpg", tendanhmuc: "tatca");
                          // final SanPham sp5 = SanPham(id: widget.sp?.id,tensanpham: "Quần jean nam dài,dày", giacu: 600000, giamoi: 550000, img: "assets/images/tatca/5.jpg", tendanhmuc: "tatca");
                          // final SanPham sp6 = SanPham(id: widget.sp?.id,tensanpham: "Áo sơ mi có cổ, tay ngắn", giacu: 525000, giamoi: 410000, img: "assets/images/tatca/6.jpg", tendanhmuc: "tatca");
                          // final SanPham sp7 = SanPham(id: widget.sp?.id,tensanpham: "Áo thun nam tay ngắn", giacu: 435000, giamoi: 320000, img: "assets/images/tatca/7.jpg", tendanhmuc: "tatca");
                          // final SanPham sp8 = SanPham(id: widget.sp?.id,tensanpham: "Áo khoác Gucci thời trang", giacu: 435000, giamoi: 240000, img: "assets/images/tatca/8.jpg", tendanhmuc: "tatca");
                          // final SanPham sp9 = SanPham(id: widget.sp?.id,tensanpham: "Quần jean nữ, ống rộng, phong cách", giacu: 355000, giamoi: 190000, img: "assets/images/tatca/9.jpg", tendanhmuc: "tatca");
                          // final SanPham sp10 =SanPham(id: widget.sp?.id,tensanpham: "Quần short nam, lưng dây thun", giacu: 399000, giamoi: 299000, img: "assets/images/tatca/10.jpg", tendanhmuc: "tatca");
                          // await SanPhamDao.insertSanPham(sp1);
                          // await SanPhamDao.insertSanPham(sp2);
                          // await SanPhamDao.insertSanPham(sp3);
                          // await SanPhamDao.insertSanPham(sp4);
                          // await SanPhamDao.insertSanPham(sp5);
                          // await SanPhamDao.insertSanPham(sp6);
                          // await SanPhamDao.insertSanPham(sp7);
                          // await SanPhamDao.insertSanPham(sp8);
                          // await SanPhamDao.insertSanPham(sp9);
                          // await SanPhamDao.insertSanPham(sp10);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn đã thêm sản phẩm thành công!!!")));

                          // final SanPham sp1 = SanPham(id: widget.sp?.id,tensanpham: "Kappa áo thun tay ngắn", giacu: 400000, giamoi: 350000, img: "assets/images/aothun/1.jpg", tendanhmuc: "aothun");
                          // final SanPham sp2 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO THUN TAY NGẮN WOMEN K0C42TD44", giacu: 600000, giamoi: 500000, img: "assets/images/aothun/2.jpg", tendanhmuc: "aothun");
                          // final SanPham sp3 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO THUN TAY NGẮN MEN OF22-90469", giacu: 399000, giamoi: 260000, img: "assets/images/aothun/3.jpg", tendanhmuc: "aothun");
                          // final SanPham sp4 = SanPham(id: widget.sp?.id,tensanpham: "STAPLE ÁO THUN TAY NGẮN MEN 2211C7149", giacu: 499000, giamoi: 340000, img: "assets/images/aothun/4.jpg", tendanhmuc: "aothun");
                          // final SanPham sp5 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO THUN TAY NGẮN MEN 341D8LW", giacu: 600000, giamoi: 550000, img: "assets/images/aothun/5.jpg", tendanhmuc: "aothun");
                          // final SanPham sp6 = SanPham(id: widget.sp?.id,tensanpham: "Kappa áo thun tay ngắn nam/nữ 321679W", giacu: 525000, giamoi: 410000, img: "assets/images/aothun/6.jpg", tendanhmuc: "aothun");
                          // final SanPham sp7 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO THUN TAY NGẮN MEN OF22-90474", giacu: 435000, giamoi: 320000, img: "assets/images/aothun/7.jpg", tendanhmuc: "aothun");
                          // final SanPham sp8 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO THUN TAY NGẮN MEN OF22-90473", giacu: 435000, giamoi: 240000, img: "assets/images/aothun/8.jpg", tendanhmuc: "aothun");
                          // final SanPham sp9 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO THUN TAY NGẮN MEN OF22-90470", giacu: 355000, giamoi: 190000, img: "assets/images/aothun/9.jpg", tendanhmuc: "aothun");
                          // final SanPham sp10 =SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO THUN TAY NGẮN MEN OF22-90471", giacu: 399000, giamoi: 299000, img: "assets/images/aothun/10.jpg", tendanhmuc: "aothun");
                          // await SanPhamDao.insertSanPham(sp1);
                          // await SanPhamDao.insertSanPham(sp2);
                          // await SanPhamDao.insertSanPham(sp3);
                          // await SanPhamDao.insertSanPham(sp4);
                          // await SanPhamDao.insertSanPham(sp5);
                          // await SanPhamDao.insertSanPham(sp6);
                          // await SanPhamDao.insertSanPham(sp7);
                          // await SanPhamDao.insertSanPham(sp8);
                          // await SanPhamDao.insertSanPham(sp9);
                          // await SanPhamDao.insertSanPham(sp10);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn đã thêm sản phẩm thành công!!!")));


                          // final SanPham sp1 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO THUN CÓ CỔ TAY NGẮN MEN 351C33W", giacu: 400000, giamoi: 350000, img: "assets/images/aopolo/1.jpg", tendanhmuc: "aopolo");
                          // final SanPham sp2 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO THUN CÓ CỔ TAY NGẮN WOMEN K0C42PD61", giacu: 600000, giamoi: 500000, img: "assets/images/aopolo/2.jpg", tendanhmuc: "aopolo");
                          // final SanPham sp3 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO THUN CÓ CỔ TAY NGẮN MEN OF22-03177", giacu: 399000, giamoi: 260000, img: "assets/images/aopolo/3.jpg", tendanhmuc: "aopolo");
                          // final SanPham sp4 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO THUN CÓ CỔ TAY NGẮN MEN K0C32PD10", giacu: 499000, giamoi: 340000, img: "assets/images/aopolo/4.jpg", tendanhmuc: "aopolo");
                          // final SanPham sp5 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO THUN CÓ CỔ TAY NGẮN MEN 321F7PW", giacu: 600000, giamoi: 550000, img: "assets/images/aopolo/5.jpg", tendanhmuc: "aopolo");
                          // final SanPham sp6 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO THUN CÓ CỔ TAY NGẮN MEN OF22-03285", giacu: 525000, giamoi: 410000, img: "assets/images/aopolo/6.jpg", tendanhmuc: "aopolo");
                          // final SanPham sp7 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO THUN CÓ CỔ TAY NGẮN MEN 351C35W", giacu: 435000, giamoi: 320000, img: "assets/images/aopolo/7.jpg", tendanhmuc: "aopolo");
                          // final SanPham sp8 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO THUN CÓ CỔ TAY NGẮN MEN K0C32PD65", giacu: 435000, giamoi: 240000, img: "assets/images/aopolo/8.jpg", tendanhmuc: "aopolo");
                          // final SanPham sp9 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO THUN CÓ CỔ TAY NGẮN MEN K0C32PD61", giacu: 355000, giamoi: 190000, img: "assets/images/aopolo/9.jpg", tendanhmuc: "aopolo");
                          // final SanPham sp10 =SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO THUN CÓ CỔ TAY NGẮN MEN OF22-03179", giacu: 399000, giamoi: 299000, img: "assets/images/aopolo/10.jpg", tendanhmuc: "aopolo");
                          // await SanPhamDao.insertSanPham(sp1);
                          // await SanPhamDao.insertSanPham(sp2);
                          // await SanPhamDao.insertSanPham(sp3);
                          // await SanPhamDao.insertSanPham(sp4);
                          // await SanPhamDao.insertSanPham(sp5);
                          // await SanPhamDao.insertSanPham(sp6);
                          // await SanPhamDao.insertSanPham(sp7);
                          // await SanPhamDao.insertSanPham(sp8);
                          // await SanPhamDao.insertSanPham(sp9);
                          // await SanPhamDao.insertSanPham(sp10);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn đã thêm sản phẩm thành công!!!")));


                          // final SanPham sp1 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO KHOÁC MEN IF22-33003", giacu: 400000, giamoi: 350000, img: "assets/images/aokhoacao/1.jpg", tendanhmuc: "aokhoacao");
                          // final SanPham sp2 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO KHOÁC GIÓ MEN 381F5QW", giacu: 600000, giamoi: 500000, img: "assets/images/aokhoacao/2.jpg", tendanhmuc: "aokhoacao");
                          // final SanPham sp3 = SanPham(id: widget.sp?.id,tensanpham: "STAPLE ÁO KHOÁC MEN 2302O7170", giacu: 399000, giamoi: 260000, img: "assets/images/aokhoacao/3.jpg", tendanhmuc: "aokhoacao");
                          // final SanPham sp4 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO KHOÁC GIÓ MEN OS22-07069", giacu: 499000, giamoi: 340000, img: "assets/images/aokhoacao/4.jpg", tendanhmuc: "aokhoacao");
                          // final SanPham sp5 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO KHOÁC GIÓ MEN 351C73W", giacu: 600000, giamoi: 550000, img: "assets/images/aokhoacao/5.jpg", tendanhmuc: "aokhoacao");
                          // final SanPham sp6 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA ÁO KHOÁC THUN WOMEN 381J1SW", giacu: 525000, giamoi: 410000, img: "assets/images/aokhoacao/6.jpg", tendanhmuc: "aokhoacao");
                          // final SanPham sp7 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO KHOÁC GIÓ MEN OS22-07071", giacu: 435000, giamoi: 320000, img: "assets/images/aokhoacao/7.jpg", tendanhmuc: "aokhoacao");
                          // final SanPham sp8 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO KHOÁC MEN IF22-33001", giacu: 435000, giamoi: 240000, img: "assets/images/aokhoacao/8.jpg", tendanhmuc: "aokhoacao");
                          // final SanPham sp9 = SanPham(id: widget.sp?.id,tensanpham: "Kappa nam áo khoác thun 381274W", giacu: 355000, giamoi: 190000, img: "assets/images/aokhoacao/9.jpg", tendanhmuc: "aokhoacao");
                          // final SanPham sp10 =SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO KHOÁC GIÓ MEN OS22-07068", giacu: 399000, giamoi: 299000, img: "assets/images/aokhoacao/10.jpg", tendanhmuc: "aokhoacao");
                          // await SanPhamDao.insertSanPham(sp1);
                          // await SanPhamDao.insertSanPham(sp2);
                          // await SanPhamDao.insertSanPham(sp3);
                          // await SanPhamDao.insertSanPham(sp4);
                          // await SanPhamDao.insertSanPham(sp5);
                          // await SanPhamDao.insertSanPham(sp6);
                          // await SanPhamDao.insertSanPham(sp7);
                          // await SanPhamDao.insertSanPham(sp8);
                          // await SanPhamDao.insertSanPham(sp9);
                          // await SanPhamDao.insertSanPham(sp10);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn đã thêm sản phẩm thành công!!!")));


                          // final SanPham sp1 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO SƠ MI TAY NGẮN MEN OS22-02049", giacu: 400000, giamoi: 350000, img: "assets/images/aosomi/1.jpg", tendanhmuc: "aosomi");
                          // final SanPham sp2 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO SƠ MI TAY NGẮN MEN OS22-02047", giacu: 600000, giamoi: 500000, img: "assets/images/aosomi/2.jpg", tendanhmuc: "aosomi");
                          // final SanPham sp3 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO SƠ MI TAY DÀI MEN OS22-32063", giacu: 399000, giamoi: 260000, img: "assets/images/aosomi/3.jpg", tendanhmuc: "aosomi");
                          // final SanPham sp4 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO SƠ MI TAY DÀI MEN OS22-32061", giacu: 499000, giamoi: 340000, img: "assets/images/aosomi/4.jpg", tendanhmuc: "aosomi");
                          // final SanPham sp5 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO SƠ MI TAY DÀI MEN OS22-32062", giacu: 600000, giamoi: 550000, img: "assets/images/aosomi/5.jpg", tendanhmuc: "aosomi");
                          // final SanPham sp6 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD ÁO SƠ MI TAY NGẮN MEN OS22-02048", giacu: 525000, giamoi: 410000, img: "assets/images/aosomi/6.jpg", tendanhmuc: "aosomi");
                          // await SanPhamDao.insertSanPham(sp1);
                          // await SanPhamDao.insertSanPham(sp2);
                          // await SanPhamDao.insertSanPham(sp3);
                          // await SanPhamDao.insertSanPham(sp4);
                          // await SanPhamDao.insertSanPham(sp5);
                          // await SanPhamDao.insertSanPham(sp6);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn đã thêm sản phẩm thành công!!!")));


                          // final SanPham sp1 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN JEAN NAM MEN SLIM STRAIGHT FIT IS23-35177", giacu: 400000, giamoi: 350000, img: "assets/images/quanjean/1.jpg", tendanhmuc: "quanjean");
                          // final SanPham sp2 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN JEAN NAM MEN TAPPERED FIT IS23-35181", giacu: 600000, giamoi: 500000, img: "assets/images/quanjean/2.jpg", tendanhmuc: "quanjean");
                          // final SanPham sp3 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN JEAN NAM MEN TAPERED FIT IS23-35178", giacu: 399000, giamoi: 260000, img: "assets/images/quanjean/3.jpg", tendanhmuc: "quanjean");
                          // final SanPham sp4 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN JEAN NAM MEN LOOSE CROTCH FIT IS23-35180", giacu: 499000, giamoi: 340000, img: "assets/images/quanjean/4.jpg", tendanhmuc: "quanjean");
                          // final SanPham sp5 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN JEAN NAM MEN SLIM FIT IS23-35168", giacu: 600000, giamoi: 550000, img: "assets/images/quanjean/5.jpg", tendanhmuc: "quanjean");
                          // final SanPham sp6 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN SỌT JEAN NAM MEN IS23-05085", giacu: 525000, giamoi: 410000, img: "assets/images/quanjean/6.jpg", tendanhmuc: "quanjean");
                          // final SanPham sp7 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN NỮ JEANS SKINNY FIT IF22-35109", giacu: 435000, giamoi: 320000, img: "assets/images/quanjean/11.jpg", tendanhmuc: "quanjean");
                          // final SanPham sp8 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN NỮ JEANS SKINNY FIT IF22-35110", giacu: 435000, giamoi: 240000, img: "assets/images/quanjean/8.jpg", tendanhmuc: "quanjean");
                          // final SanPham sp9 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN NỮ JEANS MOM FIT IF22-35108", giacu: 355000, giamoi: 190000, img: "assets/images/quanjean/9.jpg", tendanhmuc: "quanjean");
                          // final SanPham sp10 =SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN NỮ JEANS BOYFRIEND FIT IF22-35107", giacu: 399000, giamoi: 299000, img: "assets/images/quanjean/10.jpg", tendanhmuc: "quanjean");
                          // await SanPhamDao.insertSanPham(sp1);
                          // await SanPhamDao.insertSanPham(sp2);
                          // await SanPhamDao.insertSanPham(sp3);
                          // await SanPhamDao.insertSanPham(sp4);
                          // await SanPhamDao.insertSanPham(sp5);
                          // await SanPhamDao.insertSanPham(sp6);
                          // await SanPhamDao.insertSanPham(sp7);
                          // await SanPhamDao.insertSanPham(sp8);
                          // await SanPhamDao.insertSanPham(sp9);
                          // await SanPhamDao.insertSanPham(sp10);
                          // SanPham? a = await SanPhamDao.getSanPham(57);
                          // await SanPhamDao.deleteSanPham(a!);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn đã thêm sản phẩm thành công!!!")));


                          // final SanPham sp1 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN SHORTS MEN IF22-05006", giacu: 400000, giamoi: 350000, img: "assets/images/quanshorts/1.jpg", tendanhmuc: "quanshorts");
                          // final SanPham sp2 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA QUẦN SHORTS THỂ THAO MEN 351C36W", giacu: 600000, giamoi: 500000, img: "assets/images/quanshorts/2.jpg", tendanhmuc: "quanshorts");
                          // final SanPham sp3 = SanPham(id: widget.sp?.id,tensanpham: "STAPLE QUẦN SHORTS THỂ THAO MEN 2303B7191", giacu: 399000, giamoi: 260000, img: "assets/images/quanshorts/3.jpg", tendanhmuc: "quanshorts");
                          // final SanPham sp4 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN SHORTS MEN IF22-05005", giacu: 499000, giamoi: 340000, img: "assets/images/quanshorts/4.jpg", tendanhmuc: "quanshorts");
                          // final SanPham sp5 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN SHORTS MEN IF22-05001", giacu: 600000, giamoi: 550000, img: "assets/images/quanshorts/5.jpg", tendanhmuc: "quanshorts");
                          // final SanPham sp6 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA QUẦN SHORTS THỂ THAO MEN 351C38W", giacu: 525000, giamoi: 410000, img: "assets/images/quanshorts/11.jpg", tendanhmuc: "quanshorts");
                          // final SanPham sp7 = SanPham(id: widget.sp?.id,tensanpham: "ECKO UNLTD QUẦN SHORTS JEAN NAM MEN IS23-05085", giacu: 435000, giamoi: 320000, img: "assets/images/quanshorts/7.jpg", tendanhmuc: "quanshorts");
                          // final SanPham sp8 = SanPham(id: widget.sp?.id,tensanpham: "Kappa quần shorts thể thao nam 321C53W", giacu: 435000, giamoi: 240000, img: "assets/images/quanshorts/8.jpg", tendanhmuc: "quanshorts");
                          // final SanPham sp9 = SanPham(id: widget.sp?.id,tensanpham: "KAPPA QUẦN SHORTS THỂ THAO MEN 351C37W", giacu: 355000, giamoi: 190000, img: "assets/images/quanshorts/9.jpg", tendanhmuc: "quanshorts");
                          // final SanPham sp10 =SanPham(id: widget.sp?.id,tensanpham: "KAPPA QUẦN SHORTS THỂ THAO MEN 351D1WW", giacu: 399000, giamoi: 299000, img: "assets/images/quanshorts/10.jpg", tendanhmuc: "quanshorts");
                          // await SanPhamDao.insertSanPham(sp1);
                          // await SanPhamDao.insertSanPham(sp2);
                          // await SanPhamDao.insertSanPham(sp3);
                          // await SanPhamDao.insertSanPham(sp4);
                          // await SanPhamDao.insertSanPham(sp5);
                          // await SanPhamDao.insertSanPham(sp6);
                          // await SanPhamDao.insertSanPham(sp7);
                          // await SanPhamDao.insertSanPham(sp8);
                          // await SanPhamDao.insertSanPham(sp9);
                          // await SanPhamDao.insertSanPham(sp10);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn đã thêm sản phẩm thành công!!!")));

                          String taikhoan = TaiKhoanController.text;
                          String matkhau = MatKhauController.text;
                          if(validateRequite(taikhoan)== false){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Bạn chưa nhập trường tài khoản!!!")));
                          }else{
                            if(validateRequite(matkhau)==false){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Bạn chưa nhập trường mật khẩu!!!")));
                            }else{
                              if (await UserDao.kiemTraDangNhap(taikhoan, matkhau) ==false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Đăng nhập thất bại!!!")));
                              } else {
                                User? u;
                                u = await UserDao.getUser(taikhoan, matkhau);
                                if(u!= null){
                                  int sh = await GioHangDao.getSoLuongSpTrongGio(u.id!);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage(user: u!, shtg: sh,)
                                      )
                                  );
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
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 2,
                                letterSpacing: 1,
                                color: Colors.black87),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bạn chưa có tài khoản?",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text(
                              "Đăng ký",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo.withOpacity(0.9)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
}
