class Categories {
  List<Subcategories> subcategories;
  List<Allproducts> allproducts;

  Categories({this.subcategories, this.allproducts});

  // Categories.fromJson(Map<String, dynamic> json) {
  //   if (json['subcategories'] != null) {
  //     subcategories = new List<Subcategories>();
  //     json['subcategories'].forEach((v) {
  //       subcategories.add(new Subcategories.fromJson(v));
  //     });
  //   }
  //   if (json['allproducts'] != null) {
  //     allproducts = new List<Allproducts>();
  //     json['allproducts'].forEach((v) {
  //       allproducts.add(new Allproducts.fromJson(v));
  //     });
  //   }
  // }
  factory Categories.fromJson(Map<String, dynamic> json) {
    var subcategories = json['subcategories'] as List;
    List<Subcategories> subCategories = subcategories != null
        ? subcategories.map((i) => Subcategories.fromJson(i)).toList()
        : null;
    print('--------All Product--------');
    print(json['allproducts']);
    print('--------All Product--------');
    var allproducts = json['allproducts'] as List;
    List<Allproducts> allProducts = allproducts != null
        ? allproducts.map((i) => Allproducts.fromJson(i)).toList()
        : null;
    return (Categories(subcategories: subCategories, allproducts: allProducts));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories.map((v) => v.toJson()).toList();
    }
    if (this.allproducts != null) {
      data['allproducts'] = this.allproducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  int id;
  int mainCategoryId;
  String imagePath;
  String name;
  String createdAt;
  String updatedAt;

  Subcategories(
      {this.id,
      this.mainCategoryId,
      this.imagePath,
      this.name,
      this.createdAt,
      this.updatedAt});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainCategoryId = json['main_category_id'];
    imagePath = json['image_path'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main_category_id'] = this.mainCategoryId;
    data['image_path'] = this.imagePath;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Allproducts {
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
 // Null publishedAt;
  String createdAt;
  String updatedAt;
  bool addedToWishList;
  Image1 image;
  List<Thumbnails> thumbnails;

  Allproducts(
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
   //   this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.addedToWishList,
      this.image,
      this.thumbnails});

  Allproducts.fromJson(Map<String, dynamic> json) {
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
 //   publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addedToWishList = json['addedToWishList'];
    image = json['image'] != null ? new Image1.fromJson(json['image']) : null;
    if (json['thumbnails'] != null) {
      thumbnails = new List<Thumbnails>();
      json['thumbnails'].forEach((v) {
        thumbnails.add(new Thumbnails.fromJson(v));
      });
    }
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
  //  data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['addedToWishList'] = this.addedToWishList;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.thumbnails != null) {
      data['thumbnails'] = this.thumbnails.map((v) => v.toJson()).toList();
    }
    return data;
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
