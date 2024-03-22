WITH source AS (SELECT ID
                     , COST
                     , CATEGORY
                     , NAME
                     , BRAND
                     , RETAIL_PRICE
                     , DEPARTMENT
                     , SKU
                     , DISTRIBUTION_CENTER_ID
                FROM {{ source('looker_ecommerce', 'products') }})
SELECT *
FROM source;