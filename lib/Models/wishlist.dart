class Wish {
  String status;
  Data data;

  Wish({this.status, this.data});

  factory Wish.fromJson(Map<String, dynamic> json) {
    // status = json['status'];
    Data data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    return Wish(data: data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int totalWishlistItem;
  List<Wishlist> wishlist;

  Data({this.totalWishlistItem, this.wishlist});

  Data.fromJson(Map<String, dynamic> json) {
    totalWishlistItem = json['total_wishlist_item'];
    if (json['wishlist'] != null) {
      wishlist = new List<Wishlist>();
      json['wishlist'].forEach((v) {
        wishlist.add(new Wishlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_wishlist_item'] = this.totalWishlistItem;
    if (this.wishlist != null) {
      data['wishlist'] = this.wishlist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wishlist {
  int id;
  int productId;
  int userId;
  String createdAt;
  String updatedAt;
  Product product;

  Wishlist(
      {this.id,
      this.productId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.product});

  Wishlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
  int id;
  String name;
  num price;
  int mainCategoryId;
  int categoryId;
  String primarySku;
  String secondarySku;
  num grossWeight; // int
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
  String createdAt;
  String updatedAt;
  Image image;
  Product(
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
      this.image});

  Product.fromJson(Map<String, dynamic> json) {
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
    //publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['main_category_id'] = this.mainCategoryId;
    data['category_id'] = this.categoryId;
    data['primary_sku'] = this.primarySku;
    data['secondary_sku'] = this.secondarySku;
    data['gross_weight'] = this.grossWeight;
    data['design_code'] = this.designCode;
    data['net_weight'] = this.netWeight;
    data['tag_price'] = this.tagPrice;
    data['pieces'] = this.pieces;
    data['article_necklace'] = this.articleNecklace;
    data['pearl_weight'] = this.pearlWeight;
    data['kundan_stones'] = this.kundanStones;
    data['carat'] = this.carat;
    data['diamond_set'] = this.diamondSet;
    data['diamond_weight'] = this.diamondWeight;
    data['diamond_pieces'] = this.diamondPieces;
    data['color_stone_weight'] = this.colorStoneWeight;
    data['color_stone_pieces'] = this.colorStonePieces;
    data['polki_weight'] = this.polkiWeight;
    data['polki_pieces'] = this.polkiPieces;
   // data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Image {
  int id;
  String url;
  int imageableId;
  String imageableType;
  String createdAt;
  String updatedAt;

  Image(
      {this.id,
      this.url,
      this.imageableId,
      this.imageableType,
      this.createdAt,
      this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
