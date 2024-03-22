{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
source_model: 'vw_stg_looker_ecommerce__orders'
src_pk: 'DV_HASHKEY_USER_ORDER'
src_hashdiff:
    source_column: 'DV_HASHDIFF_ORDER_STATUS'
    alias: 'HASHDIFF'
src_payload:
    - 'STATUS'
    - 'CREATED_AT'
    - 'RETURNED_AT'
    - 'SHIPPED_AT'
    - 'NUM_OF_ITEM'
src_ldts: 'DV_LOADTS'
src_source: 'DV_RECSOURCE'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                   src_hashdiff=metadata_dict["src_hashdiff"],
                   src_payload=metadata_dict["src_payload"],
                   src_eff=metadata_dict["src_eff"],
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"])   }}
