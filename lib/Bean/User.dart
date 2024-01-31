class User {
  final int? id;
  final String hoten;
  final String sodienthoai;
  final String email;
  final String diachi;
  final String diachinhan;
  final String taikhoan;
  final String matkhau;

  const User({
    this.id,
    required this.hoten,
    required this.sodienthoai,
    required this.email,
    required this.diachi,
    required this.diachinhan,
    required this.taikhoan,
    required this.matkhau
  });

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'hoten':hoten,
      'sodienthoai':sodienthoai,
      'email':email,
      'diachi':diachi,
      'diachinhan':diachinhan,
      'taikhoan':taikhoan,
      'matkhau':matkhau
    };
  }
}