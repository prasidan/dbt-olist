with source as (

    select * from {{ ref('raw_sellers') }}

),

renamed as (

    select 
        seller_id
        
    from source

)

select * from renamed