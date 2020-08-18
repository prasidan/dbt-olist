with source as (

    select * from {{ ref('raw_orders') }}

),

renamed as (

    select 
        order_id
        ,customer_id
        ,date_trunc('day', order_purchase_timestamp) as order_date
        ,date_trunc('month', order_purchase_timestamp) as order_month

    from source

)

select * from renamed