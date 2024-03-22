WITH source AS (SELECT ORDER_ID
                     , USER_ID
                     , STATUS
                     , GENDER
                     , CREATED_AT
                     , RETURNED_AT
                     , SHIPPED_AT
                     , DELIVERED_AT
                     , NUM_OF_ITEM
                FROM {{ source('looker_ecommerce', 'orders') }})
SELECT *
FROM source