import 'package:flutter_app_mbj/Models/wishlist.dart';

class Searchmodel {
  String status;
  List<Data> data;

  Searchmodel({this.status, this.data});

  factory Searchmodel.fromJson(Map<String, dynamic> json) {
    var datalist = json['data'] as List;
    List<Data> data = datalist != null
        ? datalist.map((i) => Data.fromJson(i)).toList()
        : null;
    return Searchmodel(data: data, status: json['status']);
  }
}

class Data {
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
  int pieces;
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
  String createdAt;
  String updatedAt;
  bool addedToWishList;
  Image image;
  List<Thumbnails> thumbnails;

  Data(
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
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.addedToWishList,
      this.image,
      this.thumbnails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    mainCategoryId = json['main_category_id'];
    categoryId = json['category_id'];
    primarySku = json['primary_sku'];
    secondarySku = json['secondary_sku'];
    grossWeight = json['gross_weight'];
    designCode = json['design_code'];
    netWeight = json['net_weight'];
    tagPrice = json['tag_price'];
    pieces = json['pieces'];
    articleNecklace = json['article_necklace'];
    pearlWeight = json['pearl_weight'];
    kundanStones = json['kundan_stones'];
    carat = json['carat'];
    diamondSet = json['diamond_set'];
    diamondWeight = json['diamond_weight'];
    diamondPieces = json['diamond_pieces'];
    colorStoneWeight = json['color_stone_weight'];
    colorStonePieces = json['color_stone_pieces'];
    polkiWeight = json['polki_weight'];
    polkiPieces = json['polki_pieces'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addedToWishList = json['addedToWishList'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    if (json['thumbnails'] != null) {
      thumbnails = new List<Thumbnails>();
      json['thumbnails'].forEach((v) {
        thumbnails.add(new Thumbnails.fromJson(v));
      });
    }
  }
}

class Image1 {
  int id;
  String url;
  int imageableId;
  String imageableType;
  String createdAt;
  String updatedAt;

  Image1(
      {this.id,
      this.url,
      this.imageableId,
      this.imageableType,
      this.createdAt,
      this.updatedAt});

  Image1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['imageable_id'] = this.imageableId;
    data['imageable_type'] = this.imageableType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Thumbnails {
  int id;
  int productId;
  String url;
  String createdAt;
  String updatedAt;

  Thumbnails(
      {this.id, this.productId, this.url, this.createdAt, this.updatedAt});

  Thumbnails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
