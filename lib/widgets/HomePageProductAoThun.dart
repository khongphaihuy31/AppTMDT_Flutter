import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thiketthuchocphan_mobile/Bean/SanPham.dart';
import 'package:thiketthuchocphan_mobile/Bean/User.dart';
import 'package:thiketthuchocphan_mobile/Dao/SanPhamDao.dart';
import 'package:thiketthuchocphan_mobile/widgets/ProductDetail.dart';

class HomePageProductAoThun extends StatelessWidget {
  final User user;
  HomePageProductAoThun({required this.user,super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.all(20),
      // margin: EdgeInsets.all(25),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.3),
      //       spreadRadius: 1,
      //       blurRadius: 5
      //     )
      //   ]
      // ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Sản Phẩm Áo Thun",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 15,),

          FutureBuilder<List<SanPham?>>(
              future: SanPhamDao.getAllListSanPham('aothun'),
              builder: (context, AsyncSnapshot<List<SanPham?>> snapshot){
                if(snapshot.data != null){
                  return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        Container(
                          // padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xFFF7F5F8),
                              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.indigo.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5
                                )
                              ]
                          ),
                          child: InkWell(
                            onTap: (){
                              SanPham? sp = snapshot.data![index];
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(user: user, sp: sp!)));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  snapshot.data![index]!.img,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    snapshot.data![index]!.tensanpham,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "${snapshot.data![index]?.giamoi}đ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo.withOpacity(0.9)
                                      ),
                                    ),
                                    Text(
                                      "Đã bán 25k",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                    itemCount: snapshot.data!.length,
                  );
                }else{
                  return Text("Không có sản phẩm");
                }
              }
          ),
        ],
      ),
    );
  }
}
