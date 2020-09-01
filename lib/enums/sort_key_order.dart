enum OrderSortKey { PROCESSED_AT, TOTAL_PRICE, ID, RELEVANCE }

extension ParseToStringOrder on OrderSortKey {
  String get string => this.toString().split('.')[1];
}
