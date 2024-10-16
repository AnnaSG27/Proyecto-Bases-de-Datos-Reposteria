SELECT * FROM reposteria.pedidos;

INSERT INTO Pedidos(IDPedido, IDUsuario, FechaPedido, FechaEnvio, FechaEntrega, Estado, Direccion, PrecioEnvio, SubTotal, PrecioTotal)
		VALUES(1, 01, '2024-10-16', '2024-10-17', '2024-10-18', 1, 'X', 12000, 10000, 22000),
			  (2, 02, '2024-10-16', '2024-10-17', '2024-10-18', 1, 'X', 10000, 4000, 14000);