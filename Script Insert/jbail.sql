 /* Buildings */
INSERT INTO Buildings(Building) VALUES ('BLUE');
INSERT INTO Buildings(Building) VALUES ('GREEN');
INSERT INTO Buildings(Building) VALUES ('RED');
INSERT INTO Buildings(Building) VALUES ('BLACK');
INSERT INTO Buildings(Building) VALUES ('ORANGE');
 
 /* Customers */
INSERT INTO Customers (Customer,Prefix,FKBuilding) VALUES ('ERIKA GUTIERREZ MUÑOZ','ERGMU',1);
INSERT INTO Customers (Customer,Prefix,FKBuilding) VALUES ('LUIS ENRIQUE VILLALOBOS QUIÑONES','LEVIQ',2);
INSERT INTO Customers (Customer,Prefix,FKBuilding) VALUES ('MARIA FERNANDA MARQUEZ RIVERA','MAFMR',3);
INSERT INTO Customers (Customer,Prefix,FKBuilding) VALUES ('JOSE CARLOS PRIETO CAMPOS','JOCPC',4);
INSERT INTO Customers (Customer,Prefix,FKBuilding) VALUES ('JORGE ALBERTO LOPEZ ESTRADA','JOALE',5);
 
/* PartNumbers */
INSERT INTO PartNumbers(PartNumber,FKCustomer,Available) VALUES ('EW45TFC Electrical wiring',1,1);
INSERT INTO PartNumbers(PartNumber,FKCustomer,Available) VALUES ('PV3RFKJ PVC tubes',2,0);
INSERT INTO PartNumbers(PartNumber,FKCustomer,Available) VALUES ('E34FT ELEVATORS',3,0);
INSERT INTO PartNumbers(PartNumber,FKCustomer,Available) VALUES ('BAT34FR BATHROOMS',4,1);
INSERT INTO PartNumbers(PartNumber,FKCustomer,Available) VALUES ('OF35H OFFICE',5,1);
