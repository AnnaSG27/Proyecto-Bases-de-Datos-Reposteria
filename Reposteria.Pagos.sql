SELECT * FROM reposteria.pagos;

INSERT INTO Pagos(IDPedido, IDUsuario, Monto, MetodoPago, FechaPago, NumeroTransaccion) 
		VALUES(1, 01, 1, 22000, 2, 1, '2024-10-16', '1'),
			  (2, 02, 2, 14000, 1, 1, '2024-10-16', '2');