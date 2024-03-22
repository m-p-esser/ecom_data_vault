{%- set yaml_metadata -%}
source_model: 'vw_rstg_looker_ecommerce__orders'
derived_columns:
    DV_RECSOURCE: TO_CHAR('Looker Ecommerce')
    DV_LOADTS: CURRENT_TIMESTAMP(0)
    DV_USERID: CURRENT_ACCOUNT()
hashed_columns:
    DV_HASHKEY_USER_ORDER:
        - 'ORDER_ID'
        - 'USER_ID'
    DV_HASHKEY_ORDER: 'ORDER_ID'
    DV_HASHKEY_USER: 'USER_ID'
    DV_HASHDIFF_ORDER_STATUS:
        is_hashdiff: true
        columns:
            - 'ORDER_ID'
            - 'USER_ID'
            - 'STATUS'
            - 'CREATED_AT'
            - 'RETURNED_AT'
            - 'SHIPPED_AT'
            - 'DELIVERED_AT'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}

