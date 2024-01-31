class GioHang {
  final int? id;
  final int soluong;
  final int? idkhachhang;
  final int? idsanpham;
  final String? tensanpham;
  final int? giacu;
  final int? giamoi;
  final String? img;
  final String? tendanhmuc;

  const GioHang({
    this.id,
    required this.soluong,
    required this.idkhachhang,
    required this.idsanpham,
    required this.tensanpham,
    required this.giacu,
    required this.giamoi,
    required this.img,
    required this.tendanhmuc
  });

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'soluong':soluong,
      'idkhachhang':idkhachhang,
      'idsanpham':idsanpham,
      'tensanpham':tensanpham,
      'giacu':giacu,
      'giamoi':giamoi,
      'img':img,
      'tendanhmuc':tendanhmuc
    };
  }
}