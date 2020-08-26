class ProductList {
     List<PList> productlist;
     ProductList({this.productlist});
     List<PList> getProducts() {return this.productlist;
  }
  factory ProductList.fromJson(List<dynamic> json) {
    print(json);
    List<PList> productListt = json.map((i) => PList.fromJson(i)).toList();
    print("PList created");
    return ProductList(productlist: productListt);
  }
}
class PList {
  int id;
  String name;
  num price;
  num mainCategoryId;
  num categoryId;
  String primarySku;
  String secondarySku;
  num grossWeight; // int
  String designCode;
  num netWeight;
  num tagPrice;
  num pieces;
  String articleNecklace;
  num pearlWeight; //double
  num kundanStones;
  num carat;
  num diamondSet;
  num diamondWeight;
  num diamondPieces;
  num colorStoneWeight; //double
  String colorStonePieces;
  num polkiWeight; //double
  String polkiPieces;
  String publishedAt;
  String createdAt;
  String updatedAt;
  Image image;
  bool addedToWishList;
  List<Thumbnails> thumbnails;
  PList(
      {
        this.id,
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
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.addedToWishList,
      this.thumbnails});
  factory PList.fromJson(Map<String, dynamic> json) {
    print(json);
    print("....-----");
    Image image =
    json['image'] != null ? new Image.fromJson(json['image']) : null;
    var thumbNails = json["thumbnails"] as List;
    List<Thumbnails> thumbnails = thumbNails != null
        ? thumbNails.map((i) => Thumbnails.fromJson(i)).toList()
        : null;
    print("Images.....");
    return PList(
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
        publishedAt: json['published_at'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        image: image,
        addedToWishList: json['addedToWishList'],
        thumbnails: thumbnails);
  }
}
class Image {
  String url;
  Image({this.url});
  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
class Thumbnails {
  String url;
  Thumbnails({this.url});
  Thumbnails.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}