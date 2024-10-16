SELECT * FROM reposteria.inventario;

INSERT INTO Inventario(IDInventario, IDProducto, Stock, UnidadMedida, IDProveedor, CostoUnidad, FechaVencimiento, Estado)
		VALUES (1, 1, 3, 'Porción', 1, 2500, '2024-12-16', 1),
               (2, 2, 2, 'Litros',  2, 5000, '2024-10-25', 1);
