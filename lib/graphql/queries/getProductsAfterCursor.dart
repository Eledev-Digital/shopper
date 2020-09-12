const String getProductsAfterCursorQuery = r'''
query( $after: String, $limit : Int, $sortKey : ProductSortKeys, $query: String, $reverse: Boolean){
  products(query: $query, first: $limit, after: $after, sortKey: $sortKey, reverse: $reverse) {
    edges {
       cursor
      node {
      options(first: 50) {
            id
            name
            values
            } 
        id
        handle
        availableForSale
        createdAt
        description
        descriptionHtml
        onlineStoreUrl
        productType
        publishedAt
        tags
        title
        updatedAt
        images(first: 250) {
          edges {
            node {
              altText
              id
              originalSrc
            }
          }
        }
        variants(first: 250) {
          edges {
            node {
              title
              image {
                altText
                id
                originalSrc
              }
              priceV2 {
                amount
                currencyCode
              }

              selectedOptions {
                name
                value
              }
              compareAtPriceV2 {
                amount
                currencyCode
              }
              weight
              weightUnit
              availableForSale
              sku
              requiresShipping
              id
            }
          }
        }
      }
    }
    pageInfo {
      hasNextPage
      hasPreviousPage
    }
  }
}''';
