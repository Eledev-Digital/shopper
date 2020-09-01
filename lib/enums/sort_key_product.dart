enum ProductSortKey {
  TITLE,
  PRODUCT_TYPE,
  VENDOR,
  UPDATED_AT,
  CREATED_AT,
  BEST_SELLING,
  PRICE,
  ID,
  RELEVANCE,
}

extension ProductSortKeyExtention on ProductSortKey {
  String get string => this.toString().split('.')[1];
}
