with customers as (
    select * from {{ ref('stg_customers') }}
),

payments as (
    select * from {{ ref('stg_order_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

final as (
    select
        c.customer_unique_id,
        sum(p.amount) as total_amount
    from customers as c
    left join orders as o
    on o.customer_id = c.customer_id
    left join payments as p 
    on p.order_id = o.order_id
    group by 1
    order by sum(p.amount) desc
)

select * from final
