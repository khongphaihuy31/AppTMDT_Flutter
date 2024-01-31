class LichSuMua {
  final int? id;
  final int soluong;
  final int? idkhachhang;
  final String? diachinhan;
  final int? idsanpham;
  final String? tensanpham;
  final int? giacu;
  final int? giamoi;
  final String? img;
  final String? tendanhmuc;

  const LichSuMua({
    this.id,
    required this.soluong,
    required this.idkhachhang,
    required this.diachinhan,
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
      'diachinhan':diachinhan,
      'idsanpham':idsanpham,
      'tensanpham':tensanpham,
      'giacu':giacu,
      'giamoi':giamoi,
      'img':img,
      'tendanhmuc':tendanhmuc
    };
  }
}