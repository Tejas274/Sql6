with cte_customer_yoy_purchase as (
    select
        customer_id,
        YEAR(order_date) as order_year,
        SUM(price) as total_price
    from
        orders
    group by
        customer_id,
        YEAR(order_date)
    order by
        customer_id
)

select cyoy.customer_id
from
    cte_customer_yoy_purchase as cyoy
left join
    cte_customer_yoy_purchase as cyoy1
    on
        cyoy.customer_id = cyoy1.customer_id
        and cyoy.order_year + 1 = cyoy1.order_year
        and cyoy.total_price < cyoy1.total_price
group by cyoy.customer_id
having COUNT(*) - COUNT(cyoy1.customer_id) = 1
