USE master; 

DROP DATABASE IF EXISTS VehicleUpgradeDb; 

CREATE DATABASE VehicleUpgradeDb; 

USE VehicleUpgradeDb; 

-- O w n e r   T a b l e 

CREATE TABLE Owner
(
	id				INT				NOT NULL	PRIMARY KEY, 
	firstName		NVARCHAR(20)	NOT NULL, 
	lastName		NVARCHAR(20)	NOT NULL,
	emailAddress	NVARCHAR(40)	NOT NULL, 
	password		NVARCHAR(40)	NOT NULL
); 

INSERT INTO Owner (id, firstName, lastName, emailAddress, password) 
	VALUES(1, 'Matt', 'Foster', 'matt.foster2@outlook.com', 'FalconXJ'); 

SELECT * FROM Owner; 

-- V e h i c l e   T a b l e

CREATE TABLE Vehicle
(
	id				int				NOT NULL	PRIMARY KEY,
	ownerId			int				NOT NULL, 
	year			int			NOT NULL, 
	make			NVARCHAR(20)	NOT NULL, 
	model			NVARCHAR(40)	NOT NULL, 
	modelTrim		NVARCHAR(40)	NULL, 
	mileage			int				NOT NULL,
	purchaseDate	date			NULL, 
	purchasePrice	money			NULL, 
	 CONSTRAINT FK_Vehicle_Owner
		FOREIGN KEY(ownerId)
		REFERENCES Owner(id), 
); 

INSERT INTO Vehicle (id, ownerId, year, make, model, modelTrim, mileage, purchaseDate, purchasePrice)
	VALUES(1, 1, 1999, 'Jeep', 'Cherokee XJ', 'Sport', 196000, '20191102', $750); 
INSERT INTO Vehicle (id, ownerId, year, make, model, modeltrim, mileage, purchaseDate, purchasePrice)
	VALUES(2, 1, 2005, 'Subaru', 'Outback XT', 'Limited', 176000, '20190412', $4500); 

SELECT * FROM Vehicle; 

SELECT * FROM Vehicle
	INNER JOIN Owner 
		ON Vehicle.ownerId = Owner.id; 

-- C o m p o n e n t   C a t e g o r y   T a b l e 

CREATE TABLE ComponentCategory
(
	categoryId				int				NOT NULL	PRIMARY KEY, 
	categoryDescription		NVARCHAR(40)	NOT NULL
); 

INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(1, 'Engine');
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(2, 'Transmission'); 
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(3, 'Drivetrain'); 
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(4, 'Steering'); 
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(5, 'Front Suspension'); 
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(6, 'Rear Supension'); 
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(7, 'HVAC'); 
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(8, 'Air/Fuel'); 
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(9, 'Brakes'); 
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(10, 'Cooling');
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(11, 'Exhaust & Emissions'); 
INSERT INTO ComponentCategory (categoryId, categoryDescription)
	VALUES(12, 'Electrical & Ignition'); 

SELECT * FROM ComponentCategory; 

-- E n g i n e   T y p e   T a b l e 

CREATE TABLE EngineType
(
	vehicleId			int		NOT NULL	PRIMARY KEY, 
	pushrod				bit		NOT NULL, 
	singleOverheadCam	bit		NOT NULL, 
	dualOverheadCam		bit		NOT NULL
); 

--  E n g i n e   C o m p o n e n t s   T a b l e 

CREATE TABLE EngineComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_EngineComponents_EngineType
		FOREIGN KEY(vehicleId)
		REFERENCES EngineType(vehicleId), 

	  CONSTRAINT FK_EngineComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

-- T r a n s m i s s i o n   T y p e   T a b l e 

CREATE TABLE TransmissionType
(
	vehicleId			int		NOT NULL	PRIMARY KEY, 
	manual				bit		NOT NULL, 
	automatic			bit		NOT NULL, 
); 

-- T r a n s m i s s i o n   C o m p o n e n t s   T a b l e 

CREATE TABLE TransmissionComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL 
	  CONSTRAINT FK_TransmissionComponents_TransmissionType
		FOREIGN KEY(vehicleId)
		REFERENCES TransmissionType(vehicleId),

	  CONSTRAINT FK_TransmissionComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

-- D r i v e t r a i n   T y p e   T a b l e 

CREATE TABLE DrivetrainType
(
	vehicleId	int		NOT NULL	PRIMARY KEY, 
	fourWd		bit		NOT NULL, 
	rearWd		bit		NOT NULL, 
	frontWd		bit		NOT NULL, 
	allWd		bit		NOT NULL
); 

--  D r i v e t r a i n   C o m p o n e n t s   T a b l e

CREATE TABLE DrivetrainComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_DrivetrainComponents_DrivetrainType
		FOREIGN KEY(vehicleId)
		REFERENCES DrivetrainType(vehicleId), 

	  CONSTRAINT FK_DrivetrainComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

-- S t e e r i n g   T y p e   T a b l e 

CREATE TABLE SteeringType 
(
	vehicleId		int		NOT NULL	PRIMARY KEY, 
	trackBar		bit		NOT NULL, 
	steeringRack	bit		NOT NULL
); 

INSERT INTO SteeringType (vehicleId, trackBar, steeringRack)
	VALUES(1, 1, 0); 
INSERT INTO SteeringType (vehicleId, trackBar, steeringRack)
	VALUES(2, 0, 1); 

SELECT * FROM SteeringType; 

--  S t e e r i n g   C o m p o n e n t s   T a b l e 

CREATE TABLE SteeringComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_SteeringComponents_SteeringType
		FOREIGN KEY(vehicleId)
		REFERENCES SteeringType(vehicleId), 

	  CONSTRAINT FK_SteeringComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

INSERT INTO SteeringComponents (vehicleId, categoryId, componentId, componentName, componentCondition, replacedMileage, purchaseDate, componentCost, componentManufacturer, purchaseVendor, upgradeOrOEM)
	VALUES (1, 4, 1, 'Tie Rod', 'Green', 196000, '07-14-2020', $134.99, 'CavFab Motorsports', 'CavFab Motorsports', 'Upgrade');
INSERT INTO SteeringComponents (vehicleId, categoryId, componentId, componentName, componentCondition, replacedMileage, purchaseDate, componentCost, componentManufacturer, purchaseVendor, upgradeOrOEM)
	VALUES (1, 4, 2, 'Drag Link', 'Green', 196000, '07-14-2020', $134.98, 'CavFab Motorsports', 'CavFab MotorSports', 'Upgrade');
INSERT INTO SteeringComponents (vehicleId, categoryId, componentId, componentName, componentCondition)
	VALUES (1, 4, 3, 'Steering Box', 'Yellow');
INSERT INTO SteeringComponents (vehicleId, categoryId, componentId, componentName, componentCondition)
	VALUES (1, 4, 4, 'Steering Stabilizer', 'Red'); 
INSERT INTO SteeringComponents (vehicleId, categoryId, componentId, componentName, componentCondition)
	VALUES (1, 4, 5, 'Steering Column', 'Green'); 
INSERT INTO SteeringComponents (vehicleId, categoryId, componentId, componentName, componentCondition)
	VALUES (1, 4, 6, 'Power Steering Pump', 'Yellow');
INSERT INTO SteeringComponents (vehicleId, categoryId, componentId, componentName, componentCondition)
	VALUES (1, 4, 7, 'Power Steering Lines', 'Yellow'); 

SELECT * FROM SteeringComponents
	INNER JOIN SteeringType
		ON SteeringComponents.vehicleId = SteeringType.vehicleId; 

SELECT S.vehicleId, S.categoryId, S.componentId, S.componentName, S.componentCondition, V.year, V.make, V.model, V.modelTrim, V.mileage
	FROM SteeringComponents AS S
		INNER JOIN Vehicle AS V 
			ON S.vehicleId = v.id;

-- F r o n t   S u s p e n s i o n   T y p e   T a b l e 

CREATE TABLE FrontSuspensionType
(
	vehicleId			int		NOT NULL	PRIMARY KEY, 
	solidAxleCoil		bit		NOT NULL, 
	independentFront	bit		NOT NULL
);

INSERT INTO FrontSuspensionType (vehicleId, solidAxleCoil, independentFront)
	VALUES (1, 1, 0);
INSERT INTO FrontSuspensionType (vehicleId, solidAxleCoil, independentFront)
	VALUES (2, 0, 1); 

-- F r o n t   S u s p e n s i o n   C o m p o n e n t s   T a b l e 

CREATE TABLE FrontSuspensionComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_FrontSuspensionComponents_FrontSuspensionType
		FOREIGN KEY(vehicleId)
		REFERENCES FrontSuspensionType(vehicleId), 

	  CONSTRAINT FK_FrontSuspensionComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

INSERT INTO FrontSuspensionComponents (vehicleId, categoryId, componentId, componentName, componentCondition, replacedMileage, purchaseDate, componentCost, componentManufacturer, purchaseVendor, warrantyExpiration, upgradeOrOEM)
	VALUES (1, 5, 1, 'Track Bar', 'Green', 19600, '07-15-2020', $191.04, 'BDS Suspension', 'BDS Suspension', '07-15-2021', 'Upgrade'); 

SELECT * FROM FrontSuspensionComponents; 
-- R e a r   S u s p e n s i o n   T y p e   T a b l e 

CREATE TABLE RearSuspensionType
(
	vehicleId			int		NOT NULL	PRIMARY KEY, 
	solidAxleLeaf		bit		NOT NULL, 
	solidAxleCoil		bit		NOT NULL, 
	independentRear		bit		NOT NULL
);

-- R e a r   S u s p e n s i o n   C o m p o n e n t s   T a b l e  

CREATE TABLE RearSuspensionComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_RearSuspensionComponents_RearSuspensionType
		FOREIGN KEY(vehicleId)
		REFERENCES RearSuspensionType(vehicleId), 

	  CONSTRAINT FK_RearSuspensionComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

--  H V A C   C o m p o n e n t s   T a b l e 

CREATE TABLE HVACComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_HVACComponents_Vehicle
		FOREIGN KEY(vehicleId)
		REFERENCES Vehicle(id), 

	  CONSTRAINT FK_HVACComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

--  A i r / F u e l   C o m p o n e n t s   T a b l e

CREATE TABLE AirFuelComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_AirFuelComponents_Vehicle
		FOREIGN KEY(vehicleId)
		REFERENCES Vehicle(id), 

	  CONSTRAINT FK_AirFuelComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

-- B r a k e   T y p e   T a b l e 

CREATE TABLE BrakeType
(
	vehicleId	int		NOT NULL	PRIMARY KEY, 
	diskBrake	bit		NOT NULL, 
	drumBrake	bit		NOT NULL
);


--  B r a k e   C o m p o n e n t s   T a b l e 

CREATE TABLE BrakeComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_BrakeComponents_DrumBrakeType
		FOREIGN KEY(vehicleId)
		REFERENCES BrakeType(vehicleId), 

	  CONSTRAINT FK_BrakeComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

--  C o o l i n g   C o m p o n e n t s  

CREATE TABLE CoolingComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_CoolingComponents_Vehicle
		FOREIGN KEY(vehicleId)
		REFERENCES Vehicle(id), 

	  CONSTRAINT FK_CoolingComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

--  E x h a u s t   &   E m i s s i o n s   C o m p o n e n t s   T a b l e 

CREATE TABLE ExhaustEmissionsComponents 
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_ExhaustEmissionsComponents_Vehicle
		FOREIGN KEY(vehicleId)
		REFERENCES Vehicle(id), 

	  CONSTRAINT FK_ExhaustEmissionsComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 

--  E l e c t r i c a l   &   I g n i t i o n   C o m p o n e n t s

CREATE TABLE ElectricalIgnitionComponents
(
	vehicleId				int				NOT NULL, 
	categoryId				int				NOT NULL, 
	componentId				int				NOT NULL	PRIMARY KEY, 
	componentName			NVARCHAR(40)	NOT NULL, 
	componentCondition		NVARCHAR(10)	NOT NULL, 
	replacedMileage			int				NULL, 
	purchaseDate			date			NULL, 
	componentCost			money			NULL,
	componentManufacturer	NVARCHAR(20)	NULL, 
	purchaseVendor			NVARCHAR(20)	NULL, 
	laborCost				money			NULL,
	warrantyExpiration		date			NULL, 
	upgradeOrOEM			NVARCHAR(10)	NULL
	  CONSTRAINT FK_ElectricalIgnitionComponents_Vehicle
		FOREIGN KEY(vehicleId)
		REFERENCES Vehicle(id), 

	  CONSTRAINT FK_ElectricalIgnitionComponents_ComponentCategory
		FOREIGN KEY(categoryId)
		REFERENCES ComponentCategory(categoryId), 
); 