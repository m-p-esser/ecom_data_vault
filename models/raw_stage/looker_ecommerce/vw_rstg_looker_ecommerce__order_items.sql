WITH source AS (SELECT ID
                     , ORDER_ID
                     , USER_ID
                     , PRODUCT_ID
                     , INVENTORY_ITEM_ID
                     , STATUS
                     , CREATED_AT
                     , SHIPPED_AT
                     , DELIVERED_AT
                     , RETURNED_AT
                     , SALE_PRICE
                FROM {{ source('looker_ecommerce', 'order_items') }})
SELECT *
FROM source