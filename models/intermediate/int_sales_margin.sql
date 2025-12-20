SELECT 
    *,
    (sales.quantity * product.purchase_price) as purchase_cost,
    round((revenue -(sales.quantity * product.purchase_price)),2) as margin
FROM {{ ref("stg_raw__sales")}} sales
INNER JOIN {{ref("stg_raw__product")}} product USING (products_id)
