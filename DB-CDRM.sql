CREATE TABLE Sites(
	Id 				INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name 			TEXT,
	Address			TEXT
);
CREATE TABLE Parties(
	Id 				INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name			TEXT,
	Address 		TEXT,
	Phone			TEXT
);
CREATE TABLE Heads(
	Id 				INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name 			TEXT
);
CREATE TABLE SubHeads(
	Id 				INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name 			TEXT
);
CREATE TABLE Units(
	Id 				INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name 			TEXT
);
CREATE TABLE NoteTypes(
	Id 				INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name 			TEXT
);
CREATE TABLE Dues(
	Id 				INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Date			TEXT,
	Amount			NUMBER,
	IsSell			INTEGER,
	IsConstruction	INTEGER,
	SiteId			INTEGER,
	PartyId			INTEGER,
	HeadId			INTEGER,
	SubHeadId		INTEGER,
	UnitId			INTEGER,	
	Quantity		NUMBER,
	Narration		TEXT	
);
CREATE TABLE ReceiptPayments(
	Id 				INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Date			TEXT,
	Amount			NUMBER,
	PartyId			INTEGER,
	HeadId			INTEGER,
	IsReceipt		INTEGER,
	IsCash			INTEGER,
	Narration		TEXT	
);
CREATE TABLE Notes(
	Id				INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	SiteId			INTEGER,
	NoteTypeId		INTEGER,
	Date			TEXT,
	Entry			TEXT
);

INSERT INTO Heads(Name) VALUES
("Advance"),
("Security"),
("Discount"), -- harcoded in InputEntryVM
("Payable"), -- harcoded in InputEntryVM
("Receivable"); -- harcoded in InputEntryVM

--INSERT INTO Units(Name) VALUES
--("kg"),
--("foot"),
--("sft"),
--("cft"),
--("piece"),
--("roll"),
--("bag"),
--("truck");