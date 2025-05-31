select
    o.*,
    ois.gross_item_sales_amount,
    ois.item_discount_amount
from
    {{ ref('tpch_orders_stg') }} as o
join
    {{ ref('int_order_items_summary') }} as ois
        on o.order_key = ois.order_key
order by order_date
