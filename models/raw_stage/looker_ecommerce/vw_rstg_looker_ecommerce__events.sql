WITH source AS (SELECT ID
                     , TO_CHAR(TO_NUMBER(USER_ID)) AS USER_ID
                     , SEQUENCE_NUMBER
                     , SESSION_ID
                     , CREATED_AT
                     , IP_ADDRESS
                     , CITY
                     , STATE
                     , POSTAL_CODE
                     , BROWSER
                     , TRAFFIC_SOURCE
                     , URI
                     , EVENT_TYPE
                FROM {{ source('looker_ecommerce', 'events') }})
SELECT *
FROM source