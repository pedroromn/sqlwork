#  Creado con Kata Kuntur - Modelador de Datos
#  Versión: 2.5.2
#  Sitio Web: http://katakuntur.jeanmazuelos.com/
#  Si usted encuentra algún error le agradeceriamos lo reporte en:
#  http://pm.jeanmazuelos.com/katakuntur/issues/new

#  Administrador de Base de Datos
#  Diagrama: ventas
#  Autor: Jean Mazuelos
#  Fecha y hora: 15/02/2017 16:36:42

# GENERANDO TABLAS
CREATE TABLE PRODUCTO (
	id_producto INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de cada producto',
	nombre_producto VARCHAR(30) NOT NULL COMMENT 'Es el nombre de cada producto.',
	precio_compra DOUBLE NOT NULL COMMENT 'Es el precio unitario de cada producto el cual es el precio de compra',
	desripcion_producto TEXT NULL COMMENT 'Es una descripción del producto. Se utiliza para nombrar algunos detalles del producto.',
	precio DOUBLE NULL COMMENT 'Es el precio unitario de cada producto.',
	stock INTEGER NULL COMMENT 'Es la cantidad total actual que se dispone.',
	vacios INTEGER NULL COMMENT 'Es la cantidad de Balones Vacios se puede ingresar si se desea y a la vez es automatico',
	peso INTEGER NULL COMMENT 'Es el peso de los balones',
	tipo_producto_id_tipo_producto INTEGER NOT NULL COMMENT 'Es el codigo de identificación de cada tipo de producto.',
	KEY(tipo_producto_id_tipo_producto),
	PRIMARY KEY(id_producto)
) 
CREATE TABLE DETALLE_COMPRA (
	id_detalle_compra INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Identificativo del detalle, se autogenera.',
	cantidad INTEGER NOT NULL COMMENT 'Es la cantidad por cada producto comprado.',
	precio_compra DOUBLE NOT NULL COMMENT 'Es el precio actual con el que se compraron los productos.',
	precio_detalles DOUBLE NULL COMMENT 'Es el precio actual con el que se compraron los productos.',
	amortizacion DOUBLE NULL,
	producto_id_producto INTEGER NOT NULL COMMENT 'Es el código de identificación de cada producto',
	KEY(producto_id_producto),
	compra_id_compra INTEGER NOT NULL COMMENT 'Es el código de identificación de la compra.',
	KEY(compra_id_compra),
	PRIMARY KEY(id_detalle_compra)
) 
CREATE TABLE COMPRA (
	id_compra INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de la compra.',
	fecha_compra DATETIME NOT NULL COMMENT 'Es la fecha en la que se realizó la compra.',
	monto_total DOUBLE NOT NULL COMMENT 'Es el monto total a pagar de la compra realizada.',
	numero_factura vARCHAR(20) NULL COMMENT 'Es el Numero de Factura o Boleta en alguna Compra',
	estado VARCHAR(8) NULL COMMENT 'Es el Estado en el que se encuentra la Compra',
	proveedor_id_proveedor INTEGER NOT NULL COMMENT 'Es el código de identificación de cada proveedor.',
	KEY(proveedor_id_proveedor),
	personal_id_personal INTEGER NOT NULL COMMENT 'Es el código de identificación de cada trabajador.',
	KEY(personal_id_personal),
	PRIMARY KEY(id_compra)
) 
CREATE TABLE PROVEEDOR (
	id_proveedor INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de cada proveedor.',
	razon_social VARCHAR(200) NULL COMMENT 'Es el nombre completo de la empresa proveedora con la cual fue registrada.',
	nombre VARCHAR(200) NOT NULL COMMENT 'Es el nombre comercial de la empresa proveedora.',
	direccion VARCHAR(2000) NOT NULL COMMENT 'La dirección de ubicación de la empresa proveedora.',
	ruc VARCHAR(11) NULL COMMENT 'Es el número de ruc de la empresa proveedora, la cual se usa para realizar algunos trámites.',
	fijo VARCHAR(20) NULL COMMENT 'Es el número telefónico fijo de la empresa proveedora.',
	rpm VARCHAR(10) NULL COMMENT 'Es el número telefonico de rpm de la empresa proveedora.',
	celular_claro VARCHAR(20) NULL COMMENT 'Es el número de telefono movil claro de la empresa proveedora.',
	celular_movistar VARCHAR(20) NULL COMMENT 'Es el número de telefono movil movistar de la empresa proveedora.',
	PRIMARY KEY(id_proveedor)
) 
CREATE TABLE PERSONAL (
	id_personal INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de cada trabajador.',
	nombre VARCHAR(100) NOT NULL COMMENT 'Es el nombre del trabajador.',
	apellido VARCHAR(100) NOT NULL COMMENT 'Es el apellido del trabajador.',
	direccion VARCHAR(2000) NOT NULL COMMENT 'Es la dirección de vivienda del trabajador.',
	dni VARCHAR(8) NULL COMMENT 'Es el número de DNI del trabajador.',
	celular_claro VARCHAR(12) NULL COMMENT 'Es el número telefónico móvil claro del trabajador.',
	celular_movistar VARCHAR(12) NULL COMMENT 'Es el número telefónico móvil movistar del trabajador.',
	rpm VARCHAR(10) NULL COMMENT 'Es el número telefónico RPM del trabajador.',
	fijo VARCHAR(20) NULL COMMENT 'Es el número telefónico fijo del trabajador.',
	fecha_nacimiento DATE NULL COMMENT 'Es la fecha de nacimiento del trabajador.',
	fecha_pago DATE NULL COMMENT 'Es el campo donde el asistente ingresará la fecha del pago de cada personal',
	sueldo_basico DOUBLE NULL COMMENT 'Es el monto basico fuera de comisiones que recibirá el personal',
	usuario VARCHAR(15) NULL COMMENT 'Si desea que un personal pueda ingresar al sistema, asígnele un usuario.',
	password varchar(8) NULL COMMENT 'En caso de haber asignado un usuario, debe colocarle una contraseña.',
	tipo_personal_id_tipo_personal INTEGER NOT NULL COMMENT 'Es el código de identificación de cada tipo de trabajador de la empresa.',
	KEY(tipo_personal_id_tipo_personal),
	PRIMARY KEY(id_personal)
) 
CREATE TABLE DETALLE_ATENCION (
	ide_detalle INTEGER AUTO_INCREMENT NOT NULL COMMENT 'cODIGO DE DETALLE DE ATENCION',
	descripcion VARCHAR(100) NOT NULL COMMENT 'Son apuntes que se realizan a la hora de hacer la recepción del pedido.',
	hora TIME NULL COMMENT 'La hora en que se realizó la llamada.',
	fecha DATE NULL COMMENT 'La fecha en la que se realizó el pedido.',
	pedido_id_pedido INTEGER NOT NULL COMMENT 'Es el código de identificación de cada pedido.',
	KEY(pedido_id_pedido),
	personal_id_personal INTEGER NOT NULL COMMENT 'Es el código de identificación de cada trabajador.',
	KEY(personal_id_personal),
	PRIMARY KEY(ide_detalle)
) 
CREATE TABLE PAGO_VENTA (
	id_pago INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de los pagos que la empresa ABC S.R.L tiene que cobrar.',
	fecha_pago DATETIME NOT NULL COMMENT 'Es la fecha en la que se realizó el pago.',
	monto DOUBLE NOT NULL COMMENT 'Es el monto que debe pagar el cliente.',
	detalle_venta_id_detalle_venta INTEGER NOT NULL COMMENT 'Es el código de identificación de la venta a realizar a un cliente.',
	KEY(detalle_venta_id_detalle_venta),
	PRIMARY KEY(id_pago)
) 
CREATE TABLE PEDIDO (
	id_pedido INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de cada pedido.',
	fecha_pedido DATETIME NOT NULL COMMENT 'Es la fecha en la que el cliente realizó el pedido.',
	estado VARCHAR(20) NOT NULL COMMENT 'Es el estado en el que se encuentra la atención al pedido del cliente (pedido, atentido, confirmado).',
	monto_total DOUBLE NOT NULL COMMENT 'Es el monto total que debe cancelar el cliente.',
	numero_boleta VARCHAR(20) NULL COMMENT 'El el Numero de La Boleta o Factura',
	verificado TINYINT NULL COMMENT 'Es para verificar si el Administrador esta de acuerdo con los pedidos y ventas es un valor boleano(true,False)',
	cliente_id_cliente INTEGER NOT NULL COMMENT 'Es el código de identificación de cada cliente de la empresa.',
	KEY(cliente_id_cliente),
	PRIMARY KEY(id_pedido)
) 
CREATE TABLE DETALLE_VENTA (
	id_detalle_venta INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de la venta a realizar a un cliente.',
	cantidad INTEGER NOT NULL COMMENT 'Es la cantidad de productos que desea el cliente.',
	precio_venta DOUBLE NOT NULL COMMENT 'Es el precio de venta actual del producto.',
	precio_detalle DOUBLE NULL COMMENT 'Es el precio de venta actual del producto.',
	amortizado DOUBLE NULL COMMENT 'Es la cantidad amortizada parcialmente',
	balones_prestados INTEGER NULL COMMENT 'Define la cantidad balones prestados al cliente',
	pedido_id_pedido INTEGER NOT NULL COMMENT 'Es el código de identificación de cada pedido.',
	KEY(pedido_id_pedido),
	producto_id_producto INTEGER NOT NULL COMMENT 'Es el código de identificación de cada producto',
	KEY(producto_id_producto),
	PRIMARY KEY(id_detalle_venta)
) 
CREATE TABLE ASISTENCIA (
	id_asistencia INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de cada asistencia registrada por cada trabajador.',
	fecha DATE NOT NULL COMMENT 'Es la fecha en la que se registró la asistencia del trabajador.',
	hora_entrada TIME NOT NULL COMMENT 'Es la hora que registra la entrada de cada trabajador.',
	hora_salida TIME NOT NULL COMMENT 'Es la hora que registra la salida de cada trabajador.',
	descr INTEGER NOT NULL,
	personal_id_personal INTEGER NOT NULL COMMENT 'Es el código de identificación de cada trabajador.',
	KEY(personal_id_personal),
	PRIMARY KEY(id_asistencia)
) 
CREATE TABLE CLIENTE (
	id_cliente INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de cada cliente de la empresa.',
	nombre VARCHAR(100) NOT NULL COMMENT 'Es el nombre completo del cliente.',
	razon_social VARCHAR(100) NULL COMMENT 'De ser persona jurídica se colocará la razón social del cliente.',
	ruc VARCHAR(11) NULL COMMENT 'Es el número de RUC del cliente.',
	direccion VARCHAR(2000) NOT NULL COMMENT 'La dirección de ubicación del cliente, el cual será utilizado para la entrega del pedido.',
	celular_claro VARCHAR(20) NULL COMMENT 'Es el número telefónico móvil claro del cliente.',
	celular_movistar VARCHAR(20) NULL COMMENT 'Es el número telefónico móvil movistar del cliente.',
	fijo_uno VARCHAR(20) NULL COMMENT 'Es el número telefónico fijo del cliente.',
	fijo_dos VARCHAR(20) NULL COMMENT 'Es el número telefónico fijo del cliente en caso de contar con más de un telefono fijo.',
	rpm VARCHAR(10) NULL COMMENT 'Es el número telefónico RPM del cliente.',
	frecuencia INTEGER NULL COMMENT 'Es la frecuencia con la que un cliente realiza un pedido. Será utilizado para llevar una ruta de visitas que realizará el vendedor.',
	tipo_cliente_id_tipo_cliente INTEGER NOT NULL COMMENT 'Es el código de identificación de cada tipo de cliente que tiene la empresa.',
	KEY(tipo_cliente_id_tipo_cliente),
	PRIMARY KEY(id_cliente)
) 
CREATE TABLE TIPO_PERSONAL (
	id_tipo_personal INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de cada tipo de trabajador de la empresa.',
	tipo_personal VARCHAR(30) NOT NULL COMMENT 'Es el nombre del tipo de trabajador que hay en la empresa.',
	permisos TEXT NOT NULL COMMENT 'Establece los niveles de acceso a los cuales puede acceder este tipo de usuario.',
	PRIMARY KEY(id_tipo_personal)
) 
CREATE TABLE TIPO_PRODUCTO (
	id_tipo_producto INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el codigo de identificación de cada tipo de producto.',
	tipo_producto VARCHAR(50) NOT NULL COMMENT 'Es el nombre de cada tipo de producto.',
	PRIMARY KEY(id_tipo_producto)
) ENGINE=INNODB;
CREATE TABLE TIPO_CLIENTE (
	id_tipo_cliente INTEGER AUTO_INCREMENT NOT NULL COMMENT 'Es el código de identificación de cada tipo de cliente que tiene la empresa.',
	tipo_cliente VARCHAR(20) NOT NULL COMMENT 'Es el nombre del tipo de cliente.',
	PRIMARY KEY(id_tipo_cliente)
) 
CREATE TABLE PAGOPERSONAL (
	id_pagopersonal INTEGER AUTO_INCREMENT NOT NULL,
	fecha_pago DATETIME NOT NULL,
	monto DOUBLE NULL,
	monto_comision DOUBLE NULL,
	adelanto DOUBLE NULL,
	personal_id_personal INTEGER NOT NULL COMMENT 'Es el código de identificación de cada trabajador.',
	KEY(personal_id_personal),
	PRIMARY KEY(id_pagopersonal)
) 
CREATE TABLE PAGO_COMPRA (
	id_pagos INTEGER AUTO_INCREMENT NOT NULL,
	fecha_pagos DATE NOT NULL,
	montos DOUBLE NOT NULL,
	detalle_compra_id_detalle_compra INTEGER NOT NULL COMMENT 'Identificativo del detalle, se autogenera.',
	KEY(detalle_compra_id_detalle_compra),
	PRIMARY KEY(id_pagos)
) 

# GENERANDO RELACIONES
ALTER TABLE PRODUCTO ADD CONSTRAINT producto_tipo_producto_tipo_producto_id_tipo_producto FOREIGN KEY (tipo_producto_id_tipo_producto) REFERENCES TIPO_PRODUCTO(id_tipo_producto) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE DETALLE_COMPRA ADD CONSTRAINT detalle_compra_producto_producto_id_producto FOREIGN KEY (producto_id_producto) REFERENCES PRODUCTO(id_producto) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE DETALLE_COMPRA ADD CONSTRAINT detalle_compra_compra_compra_id_compra FOREIGN KEY (compra_id_compra) REFERENCES COMPRA(id_compra) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE COMPRA ADD CONSTRAINT compra_proveedor_proveedor_id_proveedor FOREIGN KEY (proveedor_id_proveedor) REFERENCES PROVEEDOR(id_proveedor) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE COMPRA ADD CONSTRAINT compra_personal_personal_id_personal FOREIGN KEY (personal_id_personal) REFERENCES PERSONAL(id_personal) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE PERSONAL ADD CONSTRAINT personal_tipo_personal_tipo_personal_id_tipo_personal FOREIGN KEY (tipo_personal_id_tipo_personal) REFERENCES TIPO_PERSONAL(id_tipo_personal) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE DETALLE_ATENCION ADD CONSTRAINT detalle_atencion_pedido_pedido_id_pedido FOREIGN KEY (pedido_id_pedido) REFERENCES PEDIDO(id_pedido) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE DETALLE_ATENCION ADD CONSTRAINT detalle_atencion_personal_personal_id_personal FOREIGN KEY (personal_id_personal) REFERENCES PERSONAL(id_personal) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE PAGO_VENTA ADD CONSTRAINT pago_venta_detalle_venta_detalle_venta_id_detalle_venta FOREIGN KEY (detalle_venta_id_detalle_venta) REFERENCES DETALLE_VENTA(id_detalle_venta) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE PEDIDO ADD CONSTRAINT pedido_cliente_cliente_id_cliente FOREIGN KEY (cliente_id_cliente) REFERENCES CLIENTE(id_cliente) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE DETALLE_VENTA ADD CONSTRAINT detalle_venta_pedido_pedido_id_pedido FOREIGN KEY (pedido_id_pedido) REFERENCES PEDIDO(id_pedido) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE DETALLE_VENTA ADD CONSTRAINT detalle_venta_producto_producto_id_producto FOREIGN KEY (producto_id_producto) REFERENCES PRODUCTO(id_producto) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE ASISTENCIA ADD CONSTRAINT asistencia_personal_personal_id_personal FOREIGN KEY (personal_id_personal) REFERENCES PERSONAL(id_personal) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE CLIENTE ADD CONSTRAINT cliente_tipo_cliente_tipo_cliente_id_tipo_cliente FOREIGN KEY (tipo_cliente_id_tipo_cliente) REFERENCES TIPO_CLIENTE(id_tipo_cliente) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE PAGOPERSONAL ADD CONSTRAINT pagopersonal_personal_personal_id_personal FOREIGN KEY (personal_id_personal) REFERENCES PERSONAL(id_personal) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE PAGO_COMPRA ADD CONSTRAINT pago_compra_detalle_compra_detalle_compra_id_detalle_compra FOREIGN KEY (detalle_compra_id_detalle_compra) REFERENCES DETALLE_COMPRA(id_detalle_compra) ON DELETE NO ACTION ON UPDATE CASCADE;