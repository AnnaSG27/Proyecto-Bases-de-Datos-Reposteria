CREATE DATABASE Reposteria;

CREATE TABLE Usuario
(
IDUsuario int NOT NULL auto_increment UNIQUE,
Nombres varchar(45) NOT NULL,
Apellidos varchar(45) NOT NULL,
Correo TEXT,
Telefono varchar(20) UNIQUE,
Direccion varchar(45),
Pais varchar(45),
Ciudad varchar(45),
CodigoPostal int,
FechaNacimiento DATE,
FechaCumpleaños DATE,
UltimoIngreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
Username varchar(45) UNIQUE,
Password char(60),

PRIMARY KEY (IDUsuario)
);

CREATE TABLE Categoria
(
IDCategoria int NOT NULL auto_increment UNIQUE,
NombreCategoria varchar(45) NOT NULL,
Descripcion Text NOT NULL,

PRIMARY KEY (IDCategoria)
);

CREATE TABLE Productos
(
IDProducto int NOT NULL auto_increment UNIQUE,
NombreProducto varchar(45) NOT NULL,
DescripcionProducto Text NOT NULL,
Costo int NOT NULL,
IDCategoria int NOT NULL,
Porciones varchar(15),
Personalizable BOOL,
Disponible BOOL,
CantidadesVendidas int NOT NULL,
Ingredientes TEXT NOT NULL,
PrecioProducto DECIMAL NOT NULL,

PRIMARY KEY (IDProducto),
FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria)
);

ALTER TABLE Productos DROP COLUMN Precio;

CREATE TABLE Carrito
(
IDCarrito int NOT NULL auto_increment UNIQUE,
IDUsuario int NOT NULL,
FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
UltimaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
Estado TINYINT COMMENT '1: Activo, 2: Abandonado, 3: Convertido a pedido',
Cantidad int NOT NULL,
Total DECIMAL(10,2),
PrecioProducto DECIMAL NOT NULL,

PRIMARY KEY (IDCarrito),
FOREIGN KEY (IDUsuario) REFERENCES Usuario(IDUsuario),
FOREIGN KEY (PrecioProducto) REFERENCES Productos(PrecioProducto)
);
CREATE INDEX PrecioProducto ON productos(PrecioProducto);

CREATE TABLE Pedidos
(
IDPedido int NOT NULL auto_increment,
IDUsuario int NOT NULL,
FechaPedido DATE,
FechaEnvio DATE,
FechaEntrega DATE,
Estado TINYINT COMMENT '1: Procesando, 2: Enviado, 3: Entregado, 4:Cancelado',
Direccion varchar(45) NOT NULL,
PrecioEnvio DECIMAL(10,2),
SubTotal DECIMAL(10,2) NOT NULL,
PrecioTotal DECIMAL(10,2) NOT NULL,

PRIMARY KEY (IDPedido),
FOREIGN KEY (IDUsuario) REFERENCES Usuario(IDUsuario)
);

CREATE TABLE Pagos (
    IDPago int auto_increment NOT NULL,
    IDPedido INT NOT NULL,
    IDUsuario INT,
    Monto DECIMAL(10,2),
    MetodoPago TINYINT COMMENT'1:Tarjeta, 2:PSE, 3:Otros',
    EstadoPago TINYINT COMMENT'1:Pendiente, 2:Completado, 3:fallido',
    FechaPago DATE,
    NumeroTransaccion VARCHAR(50),
    
    PRIMARY KEY (IDPago),
    FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido), 
	FOREIGN KEY (IDUsuario) REFERENCES Usuario(IDUsuario)  
);

CREATE TABLE proveedores (
    IDProveedor INT AUTO_INCREMENT,
    NombreEmpresa VARCHAR(100) NOT NULL,
    NombreContacto VARCHAR(50),
    CorreoContacto VARCHAR(100),
    TelefonoContacto VARCHAR(20),
    Direccion TEXT,
    Ciudad VARCHAR(50),
    Pais VARCHAR(50),
    TipoProductos VARCHAR(100),
    TiempoEntrega INT,
    FechaInicioContrato DATE,
    
    PRIMARY KEY (IDProveedor)
);

CREATE TABLE Inventario (
    IDInventario INT AUTO_INCREMENT UNIQUE NOT NULL,
    IDProducto INT NOT NULL,
    Stock INT,
    UnidadMedida varchar(45),
    IDProveedor INT NOT NULL,
    CostoUnidad DECIMAL(10,2) NOT NULL,
    FechaVencimiento DATE,
    Estado TINYINT COMMENT '1:Disponible, 2:Agotado',
    PRIMARY KEY (IDInventario),
    FOREIGN KEY (IDProducto) REFERENCES productos(IDProducto),
    FOREIGN KEY (IDProveedor) REFERENCES proveedores(IDProveedor) 
);

