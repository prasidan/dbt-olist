with source as (

    select * from {{ ref('raw_order_payments') }}

),

renamed as (

    select 
        order_id
        ,payment_type
        ,cast(payment_value as float) as amount

    from source

)

select * from renamed