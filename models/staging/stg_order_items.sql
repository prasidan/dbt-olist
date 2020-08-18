with source as (

    select * from {{ ref('raw_order_items') }}

),

renamed as (

    select 
        order_id
        ,product_id
        ,seller_id
        ,cast(price as float) as price
    
    from source

)

select * from renamed