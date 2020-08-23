class ProductDetails {
  int id;
  String name;
  num price;
  int mainCategoryId;
  int categoryId;
  String primarySku;
  String secondarySku;
  num grossWeight;
  String designCode;
  num netWeight;
  num tagPrice;
  num pieces;
  String articleNecklace;
  num pearlWeight;
  num kundanStones;
  num carat;
  num diamondSet;
  num diamondWeight;
  num diamondPieces;
  num colorStoneWeight;
  String colorStonePieces;
  num polkiWeight;
  String polkiPieces;
  Null publishedAt;

  Image image;
  List<Thumbnails> thumbnails;
  ProductDetails(
      {this.id,
      this.name,
      this.price,
      this.mainCategoryId,
      this.categoryId,
      this.primarySku,
      this.secondarySku,
      this.grossWeight,
      this.designCode,
      this.netWeight,
      this.tagPrice,
      this.pieces,
      this.articleNecklace,
      this.pearlWeight,
      this.kundanStones,
      this.carat,
      this.diamondSet,
      this.diamondWeight,
      this.diamondPieces,
      this.colorStoneWeight,
      this.colorStonePieces,
      this.polkiWeight,
      this.polkiPieces,
     // this.publishedAt,
      this.image,
      this.thumbnails});
  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    List<Thumbnails> thumbnails = json["thumbnails"] != null
        ? json["upcomingDesigns"].map((i) => Thumbnails.fromJson(i)).toList()
        : null;
    Image image = json["image"] != null ? Image.fromJson(json["image"]) : null;
    return ProductDetails(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        mainCategoryId: json['main_category_id'],
        categoryId: json['category_id'],
        primarySku: json['primary_sku'],
        secondarySku: json['secondary_sku'],
        grossWeight: json['gross_weight'],
        designCode: json['design_code'],
        netWeight: json['net_weight'],
        tagPrice: json['tag_price'],
        pieces: json['pieces'],
        articleNecklace: json['article_necklace'],
        pearlWeight: json['pearl_weight'],
        kundanStones: json['kundan_stones'],
        carat: json['carat'],
        diamondSet: json['diamond_set'],
        diamondWeight: json['diamond_weight'],
        diamondPieces: json['diamond_pieces'],
        colorStoneWeight: json['color_stone_weight'],
        colorStonePieces: json['color_stone_pieces'],
        polkiWeight: json['polki_weight'],
        polkiPieces: json['polki_pieces'],
        //publishedAt: json['published_at'],
        thumbnails: thumbnails,
        image: image);
  }
}
class Thumbnails {
  String url;
  Thumbnails({this.url});
  Thumbnails.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
class Image {
  String url;
  Image({this.url});
  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
