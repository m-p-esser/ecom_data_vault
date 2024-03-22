WITH source AS (SELECT ID
                     , NAME
                     , LATITUDE
                     , LONGITUDE
                FROM {{ source('looker_ecommerce', 'distribution_centers') }})
SELECT *
FROM source