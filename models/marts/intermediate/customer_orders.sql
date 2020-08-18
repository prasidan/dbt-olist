with orders as (
    select * from {{ ref('stg_orders') }}

),

customers as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select
        c.customer_unique_id
        ,min(order_date) as first_order
        ,max(order_date) as most_recent_order
        ,count(order_id) as number_of_orders
    from orders as o
    left join customers as c
    on o.customer_id = c.customer_id
    group by 1
    order by count(order_id) desc
)

select * from final

