with product_cat as (
    select * from {{ ref('stg_product_category_name_translation') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

items as (
    select * from {{ ref('stg_order_items') }}
),

payments as (
    select * from {{ ref('stg_order_payments') }}
),

final as (
    select
        pc.product_category
        ,sum(py.amount) as total
        
    from products as p 
    left join product_cat as pc 
    on pc.product_category_name = p.product_category_name 
    left join items as i 
    on i.product_id = p.product_id 
    left join payments as py
    on py.order_id = i.order_id

    group by 1
    order by sum(py.amount) desc
)
select * from final