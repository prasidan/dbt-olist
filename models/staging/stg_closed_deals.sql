with source as (

    select * from {{ ref('raw_closed_deals') }}

),

renamed as (

    select 
        mql_id
        ,seller_id
        ,business_segment
        ,lead_type
        
    from source

)

select * from renamed