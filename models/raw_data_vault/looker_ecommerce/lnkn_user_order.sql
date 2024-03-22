{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
source_model: 'vw_stg_looker_ecommerce__order_items'
src_pk: 'DV_HASHKEY_USER_ORDER_ITEM'
src_fk:
    - 'DV_HASHKEY_ORDER'
    - 'DV_HASHKEY_USER'
    - 'DV_HASHKEY_PRODUCT'
    - 'DV_HASHKEY_INVENTORY'
src_payload:
    - 'ID'
    - 'SALE_PRICE'
src_eff: 'CREATED_AT'
src_ldts: 'DV_LOADTS'
src_source: 'DV_RECSOURCE'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.t_link(src_pk=metadata_dict["src_pk"],
                      src_fk=metadata_dict["src_fk"],
                      src_payload=metadata_dict["src_payload"],
                      src_eff=metadata_dict["src_eff"],
                      src_ldts=metadata_dict["src_ldts"],
                      src_source=metadata_dict["src_source"],
                      source_model=metadata_dict["source_model"]) }}
