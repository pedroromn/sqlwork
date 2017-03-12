-- Generado por Oracle SQL Developer Data Modeler 4.1.5.907
--   en:        2017-02-16 11:31:30 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE Clientes
  (
    Cli_ID             NUMBER (8) NOT NULL ,
    Cli_CODIGO         VARCHAR2 (50) ,
    Cli_Nombre         VARCHAR2 (50) ,
    Cli_Direccion      VARCHAR2 (100) ,
    Cli_Otros_Detalles VARCHAR2 (200)
  ) ;
ALTER TABLE Clientes ADD CONSTRAINT Clientes_PK PRIMARY KEY ( Cli_ID ) ;


CREATE TABLE Ordenes
  (
    Ord_ID             NUMBER (8) NOT NULL ,
    Ord_Fecha_Orden    DATE ,
    Ord_Otros_Detalles VARCHAR2 (200) ,
    Productos_Pro_ID   NUMBER (8) NOT NULL ,
    Clientes_Cli_ID    NUMBER (8) NOT NULL
  ) ;
ALTER TABLE Ordenes ADD CONSTRAINT Ordenes_PK PRIMARY KEY ( Ord_ID ) ;


CREATE TABLE Productos
  (
    Pro_ID                 NUMBER (8) NOT NULL ,
    Pro_Descripcion        VARCHAR2 (50) ,
    Pro_Nombre             VARCHAR2 (50) ,
    Pro_Precio             NUMBER (8,2) ,
    Tipos_Productos_Tip_ID NUMBER (8) NOT NULL
  ) ;
ALTER TABLE Productos ADD CONSTRAINT Productos_PK PRIMARY KEY ( Pro_ID ) ;


CREATE TABLE Tipos_Productos
  (
    Tip_ID          NUMBER (8) NOT NULL ,
    Tip_Descripcion VARCHAR2 (50)
  ) ;
ALTER TABLE Tipos_Productos ADD CONSTRAINT Tipos_Productos_PK PRIMARY KEY ( Tip_ID ) ;


ALTER TABLE Ordenes ADD CONSTRAINT Ordenes_Clientes_FK FOREIGN KEY ( Clientes_Cli_ID ) REFERENCES Clientes ( Cli_ID ) ;

ALTER TABLE Ordenes ADD CONSTRAINT Ordenes_Productos_FK FOREIGN KEY ( Productos_Pro_ID ) REFERENCES Productos ( Pro_ID ) ;

ALTER TABLE Productos ADD CONSTRAINT Productos_Tipos_Productos_FK FOREIGN KEY ( Tipos_Productos_Tip_ID ) REFERENCES Tipos_Productos ( Tip_ID ) ;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

