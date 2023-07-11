-- Crear la base de datos
CREATE DATABASE En_que_puedo_ayudarte_app;

-- Usar la base de datos
USE En_que_puedo_ayudarte_app;

-- Crear la tabla Usuario
CREATE TABLE Usuario (
  UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Edad INT,
  Email VARCHAR(100),
  NumVecesUtilizada INT DEFAULT 1
);

-- Crear la tabla Operario
CREATE TABLE Operario (
  OperarioID INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Edad INT,
  Email VARCHAR(100),
  NumVecesSoporte INT DEFAULT 1
);

-- Crear la tabla Soporte
CREATE TABLE Soporte (
  SoporteID INT PRIMARY KEY AUTO_INCREMENT,
  OperarioID INT,
  UsuarioID INT,
  Fecha DATE,
  Evaluacion INT,
  FOREIGN KEY (OperarioID) REFERENCES Operario(OperarioID),
  FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID)
);

-- Agregar 5 usuarios
INSERT INTO Usuario (Nombre, Apellido, Edad, Email, NumVecesUtilizada)
VALUES
  ('Juan', 'Herrera', 52, 'juan@msn.com', 1),
  ('Ana', 'López', 48, 'ana@gmail.com', 2),
  ('Pedro', 'Pascal', 36, 'pedro@hotmail.com', 7),
  ('Bruno', 'Mora', 22, 'bruno_mor@alumnos.cft.com', 6),
  ('Christián', 'Gálvez', 48, 'Chisgalvez@esjazz.com', 5);

-- Agregar 5 operarios
INSERT INTO Operario (Nombre, Apellido, Edad, Email, NumVecesSoporte)
VALUES
  ('Carlos', 'Maldonado', 26, 'carlos@soportelab.com', 6),
  ('Carolina', 'Torres', 43, 'carolinat@soportelab.com', 2),
  ('Manuel', 'Torrealba', 38, 'manuto@soportelab.com', 3),
  ('Isabel', 'Ibañez', 29, 'isabel@soportelab.com', 1),
  ('Luis', 'Hernández', 31, 'luishz@soportelab.com', 4);

-- Agregar 10 operaciones de soporte
INSERT INTO Soporte (OperarioID, UsuarioID, Fecha, Evaluacion)
VALUES
  (1, 1, '2023-05-02', 5),
  (1, 3, '2023-05-06', 4),
  (2, 2, '2023-06-10', 3),
  (2, 4, '2023-06-12', 2),
  (3, 5, '2023-06-23', 1),
  (3, 1, '2023-06-14', 3),
  (4, 2, '2023-06-16', 2),
  (4, 3, '2023-06-18', 4),
  (5, 4, '2023-06-20', 5),
  (5, 5, '2023-06-23', 2);

-- Seleccionar las 3 operaciones con mejor evaluación
SELECT * FROM Soporte ORDER BY Evaluacion DESC LIMIT 3;

-- Seleccionar las 3 operaciones con menos evaluación
SELECT * FROM Soporte ORDER BY Evaluacion ASC LIMIT 3;

-- Seleccionar al operario que más soportes ha realizado
SELECT OperarioID, COUNT(*) AS TotalSoportes FROM Soporte GROUP BY OperarioID ORDER BY TotalSoportes DESC LIMIT 1;

-- Seleccionar al cliente que menos veces ha utilizado la aplicación
SELECT UsuarioID, NumVecesUtilizada FROM Usuario ORDER BY NumVecesUtilizada ASC LIMIT 1;

-- Agregar 10 años a los tres primeros usuarios registrados
UPDATE Usuario SET Edad = Edad + 10 WHERE UsuarioID IN (1, 2, 3); 

-- Renombrar todas las columnas 'correo electrónico' a 'email'
ALTER TABLE Usuario CHANGE COLUMN email correo_electronico VARCHAR(100);
ALTER TABLE Operario CHANGE COLUMN email correo_electronico VARCHAR(100);

-- Seleccionar solo los operarios mayores de 20 años
SELECT * FROM Operario WHERE Edad > 20;
