select
    li.order_item_key,
    li.part_key,
    li.line_number,
    li.extended_price,
    o.order_key,
    o.customer_key,
    o.order_date,
    {{ discounted_amount('li.extended_price', 'li.discount_percentage') }} as item_discount_amount
from
    {{ ref('tpch_orders_stg') }} as o
join
    {{ ref('tpch_line_items_stg') }} as li
        on o.order_key = li.order_key
order by
    o.order_date