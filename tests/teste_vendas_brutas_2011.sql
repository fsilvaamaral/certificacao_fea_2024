with vendas_brutas_2011 as (
    select round(sum(total_bruto), 2) as vendas_2011_brutas
    from {{ ref('fato_vendas') }}
    where year(data_pedido) = 2011
)

select *
from vendas_brutas_2011
where vendas_2011_brutas <> 12646112.16