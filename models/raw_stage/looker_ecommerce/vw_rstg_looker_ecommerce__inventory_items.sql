WITH source AS (SELECT ID
                     , PRODUCT_ID
                     , CREATED_AT
                     , SOLD_AT
                     , COST
                     , PRODUCT_CATEGORY
                     , PRODUCT_NAME
                     , PRODUCT_BRAND
                     , PRODUCT_RETAIL_PRICE
                     , PRODUCT_DEPARTMENT
                     , PRODUCT_SKU
                     , PRODUCT_DISTRIBUTION_CENTER_ID
                FROM {{ source('looker_ecommerce', 'inventory_items') }})
SELECT *
FROM source