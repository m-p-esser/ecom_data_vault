WITH source AS (SELECT ID
                     , FIRST_NAME
                     , LAST_NAME
                     , EMAIL
                     , AGE
                     , GENDER
                     , STATE
                     , STREET_ADDRESS
                     , POSTAL_CODE
                     , CITY
                     , COUNTRY
                     , LATITUDE
                     , LONGITUDE
                     , TRAFFIC_SOURCE
                     , CREATED_AT
                FROM {{ source('looker_ecommerce', 'users') }})
SELECT *
FROM source