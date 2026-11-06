{% docs stock_status %}
Categorización del stock a partir de `inventory_units`.

| stock_status | Regla                                        |
|--------------|----------------------------------------------|
| out_of_stock | inventory_units = 0                          |
| low_stock    | 0 < inventory_units < umbral (10 por defecto) |
| in_stock     | inventory_units >= umbral                    |

Desde el día 6, el umbral es la variable de proyecto `low_stock_threshold`.
{% enddocs %}

{% docs purchase_segment %}
Categorización del segmento de compra según el número de veces que se ha comprado el producto

| purchase_segment | Regla                |
| -----------------|----------------------|
| never_bought     | total_orders IS NULL |
| one_purchase     | total_orders = 1     |
| two_purchases    | total_orders = 2     |
| three_or_more    | total_orders > 2     |

{% enddocs %}