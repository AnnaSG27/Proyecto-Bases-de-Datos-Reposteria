SELECT * FROM reposteria.productos;

INSERT INTO Productos(IDProducto, NombreProducto, DescripcionProducto, Costo, IDCategoria, Porciones, Personalizable, Disponible, CantidadesVendidas, Ingredientes, PrecioProducto)
			VALUES(01, 'Torta de Chocolate', 'X', 2500, 01, '1 Porción', FALSE, TRUE, 0, 'X', 5000 ),
				  (02, 'Cupcake de Vainilla', 'X', 2000, 02, '1 Porción', TRUE, TRUE, 0, 'X', 4000 );