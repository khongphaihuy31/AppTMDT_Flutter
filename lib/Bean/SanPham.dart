class SanPham {
  final int? id;
  final String tensanpham;
  final int giacu;
  final int giamoi;
  final String img;
  final String tendanhmuc;

  const SanPham({
    this.id,
    required this.tensanpham,
    required this.giacu,
    required this.giamoi,
    required this.img,
    required this.tendanhmuc
  });

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'tensanpham':tensanpham,
      'giacu':giacu,
      'giamoi':giamoi,
      'img':img,
      'tendanhmuc':tendanhmuc
    };
  }
}