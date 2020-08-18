with customers as (
    select * from {{ ref('stg_customers') }}
),

customer_orders as (
    select * from {{ ref('customer_orders') }}
),

customer_payments as (
    select * from {{ ref('customer_payments') }}
),

final as (
    select
        distinct c.customer_unique_id
        ,co.first_order
        ,co.most_recent_order
        ,co.number_of_orders
        ,cp.total_amount as customer_lifetime_value

    from customers as c
    left join customer_orders as co 
    using (customer_unique_id)
    left join customer_payments as cp 
    using (customer_unique_id)
    order by co.number_of_orders desc
)

select * from final
