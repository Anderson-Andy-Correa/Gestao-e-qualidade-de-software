insert into produtos values (default, 'Teste', 'outroTeste', 11.99, default);
delete from produtos where ID_Produto = 50;
update produtos set Quantidade_Estoque = 1 where ID_Produto = 51;
SELECT * FROM numcomece.produtos;

insert into clientes values (default, 'Teste', 'outro@Teste', 9, 'RUela');
delete from clientes where ID_Cliente = '50';
update clientes set telefone = 99 where ID_Cliente = 51;
SELECT * FROM numcomece.clientes;

insert into itens_pedido values (default, 46, 48, 9, 9 * (SELECT PRECO_UNITARIO FROM PRODUTOS WHERE ID_PRODUTO = 48));
-- SELECT PRECO_UNITARIO FROM PRODUTOS WHERE ID_PRODUTO = 48;
delete from itens_pedido where ID_item = '47';
update itens_pedido set QUANTIDADE = 2  where ID_item = 48;
update itens_pedido SET VALOR_SUB_TOTAL = 2 * (SELECT PRECO_UNITARIO FROM PRODUTOS WHERE ID_PRODUTO = 48) where ID_item = 48;
SELECT * FROM numcomece.itens_pedido;

insert into metodo_pagamento values (default, 'Teste');
delete from metodo_pagamento where ID_Pagamento = '11';
update metodo_pagamento set TIPO_PAGAMENTO = 'oUTRO_TESTE' 
	where ID_PAGAMENTO = 
		(SELECT * FROM (SELECT ID_PAGAMENTO FROM metodo_pagamento order by ID_Pagamento DESC LIMIT 1)
	AS TEMP);
SELECT * FROM numcomece.metodo_pagamento;

insert into pedidos values (default, 1, now(), 1, 0);
delete from pedidos where ID_pedido = '50';
update pedidos set VALOR_TOTAL = (SELECT SUM(itens_pedido.VALOR_SUB_TOTAL) FROM itens_pedido WHERE ID_pedido = 1) where ID_pedido = 1;
SELECT * FROM numcomece.pedidos;