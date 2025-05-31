select
    li.order_item_key,
    li.part_key,
    li.line_number,
    o.order_key,
    o.customer_key,
    o.order_date
from
    {{ ref('tpch_orders_stg') }} as o
join
    {{ ref('tpch_line_items_stg') }} as li
        on o.order_key = li.order_key
order by
    o.order_date