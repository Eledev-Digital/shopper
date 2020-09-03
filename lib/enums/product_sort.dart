enum ProductSort {
  BEST_SELLING,
  FEATURED,
  LOWEST_PRICE,
  HIGHEST_PRICE,
  ALPHABETICALLY_AZ,
  ALPHABETICALLY_ZA,
  DATE_NEW,
  DATE_OLD
}

extension SortExtension on ProductSort {
  String get description {
    switch (this) {
      case ProductSort.BEST_SELLING:
        return "best selling";
      case ProductSort.FEATURED:
        return "featured";
        break;
      case ProductSort.LOWEST_PRICE:
        return "lowest price";
        break;
      case ProductSort.HIGHEST_PRICE:
        return "highest price";
        break;
      case ProductSort.ALPHABETICALLY_AZ:
        return "alphabetically, a-z";
        break;
      case ProductSort.ALPHABETICALLY_ZA:
        return "alphabetically, z-a";
        break;
      case ProductSort.DATE_NEW:
        return "date, new to old";
        break;
      case ProductSort.DATE_OLD:
        return "date, old to new";
        break;
      default:
        return "featured";
    }
  }

  bool get reversed {
    switch (this) {
      case ProductSort.BEST_SELLING:
        return false;
      case ProductSort.FEATURED:
        return false;
        break;
      case ProductSort.LOWEST_PRICE:
        return false;
        break;
      case ProductSort.HIGHEST_PRICE:
        return true;
        break;
      case ProductSort.ALPHABETICALLY_AZ:
        return false;
        break;
      case ProductSort.ALPHABETICALLY_ZA:
        return true;
        break;
      case ProductSort.DATE_NEW:
        return false;
        break;
      case ProductSort.DATE_OLD:
        return true;
        break;
      default:
        return false;
    }
  }

  String get key {
    switch (this) {
      case ProductSort.BEST_SELLING:
        return "BEST_SELLING";
      case ProductSort.FEATURED:
        return "RELEVANCE";
        break;
      case ProductSort.LOWEST_PRICE:
        return "PRICE";
        break;
      case ProductSort.HIGHEST_PRICE:
        return "PRICE";
        break;
      case ProductSort.ALPHABETICALLY_AZ:
        return "TITLE";
        break;
      case ProductSort.ALPHABETICALLY_ZA:
        return "TITLE";
        break;
      case ProductSort.DATE_NEW:
        return "CREATED_AT";
        break;
      case ProductSort.DATE_OLD:
        return "CRETAED_AT";
        break;
      default:
        return "RELEVANCE";
    }
  }
}
