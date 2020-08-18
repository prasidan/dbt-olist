with orders as (
    select * from {{ ref('stg_orders') }}
),

items as (
    select * from {{ ref('stg_order_items') }}
),

payments as (
    select * from {{ ref('stg_order_payments') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

product_cat as (
    select * from {{ ref('stg_product_category_name_translation') }}
),



final as (
    select
        o.order_id
        ,o.customer_id
        ,o.order_date
        ,o.order_month
        ,p.payment_type
        ,p.amount
        ,pc.product_category

      
    from orders as o
    left join items as i
    on o.order_id = i.order_id
    left join payments as p 
    on p.order_id = i.order_id
    left join products as pr 
    on pr.product_id = i.product_id
    left join product_cat as pc 
    on pc.product_category_name = pr.product_category_name

)

select * from final