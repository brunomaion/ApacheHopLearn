select *
from ecommerce.prd_geolocal
; // consultar tabela simples

select *
from ecommerce.prd_review
; // consultar tabela simples

select count(*) as comentarios 
from ecommerce.prd_review; // consulta numero de tuplas (reviews)  99.224

select count(*) as comentarios 
from ecommerce.prd_review
where ecommerce.prd_review.ds_tituloreview is not null; // consulta numero de tuplas (reviews) que possuem títulos 11.568

select count(*) as comentarios 
from ecommerce.prd_review
where ecommerce.prd_review.ds_tituloreview is null; // consulta numero de tuplas (reviews) que NÃO possuem títulos 87.656 

select *  
from ecommerce.prd_review
where char_length(ecommerce.prd_review.ds_comentarioreview) > 204; // reviews com mais de 204 carcateres = 4

select *  
from ecommerce.prd_review
where char_length(ecommerce.prd_review.ds_comentarioreview) > 200 and cast(ecommerce.prd_review.nr_scorereview as integer) > 4;
// review com mais 200 comentarios e notas maiores que 5

SELECT
    SUM(CASE WHEN CAST(nr_scorereview AS INTEGER) = 1 THEN 1 ELSE 0 END) AS nota_1,
    SUM(CASE WHEN CAST(nr_scorereview AS INTEGER) = 2 THEN 1 ELSE 0 END) AS nota_2,
    SUM(CASE WHEN CAST(nr_scorereview AS INTEGER) = 3 THEN 1 ELSE 0 END) AS nota_3,
    SUM(CASE WHEN CAST(nr_scorereview AS INTEGER) = 4 THEN 1 ELSE 0 END) AS nota_4,
    SUM(CASE WHEN CAST(nr_scorereview AS INTEGER) = 5 THEN 1 ELSE 0 END) AS nota_5
FROM ecommerce.prd_review; // somatorio de notas dos produtos


select ecommerce.prd_geolocal.nr_latgeo, ecommerce.prd_geolocal.nr_lnggeo 
from ecommerce.prd_review
inner join ecommerce.prd_pedido
on ecommerce.prd_pedido.sk_pedido = ecommerce.prd_review.sk_pedido
inner join ecommerce.prd_cliente
on ecommerce.prd_cliente.sk_cliente = ecommerce.prd_pedido.sk_cliente
inner join ecommerce.prd_geolocal
on ecommerce.prd_geolocal.sk_geolocal = ecommerce.prd_cliente.sk_geolocal
where char_length(ecommerce.prd_review.ds_comentarioreview) > 201 and cast(ecommerce.prd_review.nr_scorereview as integer) > 4;
// CONSULTA DE LATITUDE E LONGITUDE DOS COMENTARIOS COM MAIS DE 201C E NOTA MAIOR Q 4 // PASSANDO POR 4 TABELAS


select count(*)  
from ecommerce.prd_pagamentos
inner join ecommerce.prd_pedido
on ecommerce.prd_pedido.sk_pedido = ecommerce.prd_pagamentos.sk_pedido
inner join ecommerce.prd_cliente
on ecommerce.prd_cliente.sk_cliente = ecommerce.prd_pedido.sk_cliente
inner join ecommerce.prd_geolocal
on ecommerce.prd_geolocal.sk_geolocal = ecommerce.prd_cliente.sk_geolocal
where ecommerce.prd_pagamentos.ds_tipopagamento = 'credit_card' and ecommerce.prd_cliente.dc_cidadecliente = 'cascavel';
// pagamentos de cartao credito feito em Cascavel



SELECT 
    prd_produtos.ds_categoriaproduto, 
    COUNT(prd_listapedido.sk_produtos) AS total_vendas,
    prd_cliente.dc_cidadecliente
FROM 
    ecommerce.prd_produtos
INNER JOIN 
    ecommerce.prd_listapedido
    ON ecommerce.prd_produtos.sk_produtos = ecommerce.prd_listapedido.sk_produtos
INNER JOIN 
    ecommerce.prd_cliente
    ON ecommerce.prd_listapedido.s = ecommerce.prd_listapedido.sk_cliente
GROUP BY 
    prd_produtos.ds_categoriaproduto, 
    prd_cliente.dc_cidadecliente
ORDER BY 
    total_vendas DESC
LIMIT 10;


select 
	prd



inner join ecommerce.prd_pedido
on ecommerce.prd_pedido.sk_pedido = ecommerce.prd_pagamentos.sk_pedido
inner join ecommerce.prd_cliente
on ecommerce.prd_cliente.sk_cliente = ecommerce.prd_pedido.sk_cliente
inner join ecommerce.prd_geolocal
on ecommerce.prd_geolocal.sk_geolocal = ecommerce.prd_cliente.sk_geolocal
where ecommerce.prd_pagamentos.ds_tipopagamento = 'credit_card' and ecommerce.prd_cliente.dc_cidadecliente = 'cascavel';
// pagamentos de cartao credito feito em Cascavel










