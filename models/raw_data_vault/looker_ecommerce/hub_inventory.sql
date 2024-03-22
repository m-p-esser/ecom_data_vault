{{ config(materialized='incremental')    }}

{%- set source_model = 'vw_stg_looker_ecommerce__inventory_items'   -%}
{%- set src_pk = 'DV_HASHKEY_INVENTORY_ITEM'          -%}
{%- set src_nk = 'ID'          -%}
{%- set src_ldts = 'DV_LOADTS'      -%}
{%- set src_source = 'DV_RECSOURCE'    -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}
