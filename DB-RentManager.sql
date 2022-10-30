-- filename data.db

CREATE TABLE "Plots" (
	"Id"			INTEGER NOT NULL,
	"Name"			TEXT NOT NULL,
	"Description"	TEXT NOT NULL,
	PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE "Spaces" (
	"Id"			INTEGER NOT NULL,
	"PlotId"		INTEGER NOT NULL,
	"Name"			TEXT NOT NULL,
	"Description"	TEXT NOT NULL,
	"IsVacant"		INTEGER NOT NULL,
	PRIMARY KEY("Id" AUTOINCREMENT),
	FOREIGN KEY("PlotId") REFERENCES "Plots"("Id")
);
CREATE TABLE "Tenants" (
	"Id"		INTEGER NOT NULL,
	"Name"		TEXT NOT NULL,
	"Father"	TEXT NOT NULL,
	"Mother"	TEXT,
	"Husband"	TEXT,
	"Address"	TEXT NOT NULL,
	"NID"		TEXT,
	"ContactNo"	TEXT NOT NULL,
	"HasLeft"	INTEGER NOT NULL,
	PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE "Leases" (
	"Id"		INTEGER NOT NULL,
	"PlotId"	INTEGER NOT NULL,
	"SpaceId"	INTEGER NOT NULL,
	"TenantId"	INTEGER NOT NULL,
	"DateStart"	TEXT NOT NULL,
	"DateEnd"	TEXT,
	"Business"	TEXT NOT NULL,
	"IsExpired"	INTEGER NOT NULL,
	PRIMARY KEY("Id" AUTOINCREMENT),
	FOREIGN KEY("TenantId") REFERENCES "Tenants"("Id"),
	FOREIGN KEY("PlotId") REFERENCES "Plots"("Id"),
	FOREIGN KEY("SpaceId") REFERENCES "Spaces"("Id")
);
CREATE TABLE "ControlHeads" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT NOT NULL,
	PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE "Heads" (
	"Id"			INTEGER NOT NULL,
	"ControlId"		INTEGER NOT NULL,
	"Name"			TEXT NOT NULL,
	"Description"	INTEGER NOT NULL,
	PRIMARY KEY("Id" AUTOINCREMENT),
	FOREIGN KEY("ControlId") REFERENCES "ControlHeads"("Id")
);
CREATE TABLE "Receivables" (
	"LeaseId"	INTEGER NOT NULL,
	"HeadId"	INTEGER NOT NULL,
	"Amount"	INTEGER NOT NULL,
	FOREIGN KEY("LeaseId") REFERENCES "Leases"("Id"),
	FOREIGN KEY("HeadId") REFERENCES "Heads"("Id")
);
CREATE TABLE "Transactions" (
	"Id"		INTEGER NOT NULL,
	"Date"		TEXT NOT NULL,
	"PlotId"	INTEGER NOT NULL,
	"SpaceId"	INTEGER NOT NULL,
	"TenantId"	INTEGER NOT NULL,
	"ControlId"	INTEGER NOT NULL,
	"HeadId"	INTEGER NOT NULL,
	"Amount"	INTEGER NOT NULL,
	"IsCash"	INTEGER NOT NULL,
	"Narration"	TEXT,
	PRIMARY KEY("Id" AUTOINCREMENT),
	FOREIGN KEY("HeadId") REFERENCES "Heads"("Id"),
	FOREIGN KEY("SpaceId") REFERENCES "Spaces"("Id"),
	FOREIGN KEY("TenantId") REFERENCES "Tenants"("Id"),
	FOREIGN KEY("ControlId") REFERENCES "ControlHeads"("Id"),
	FOREIGN KEY("PlotId") REFERENCES "Plots"("Id")
);

INSERT INTO "ControlHeads" VALUES (1,'Receivable');
INSERT INTO "ControlHeads" VALUES (2,'Receipt');
INSERT INTO "ControlHeads" VALUES (3,'Payment');
INSERT INTO "Heads" VALUES (1,1,'Rent','Fixed monthly charge');
INSERT INTO "Heads" VALUES (2,1,'Water','Fixed monthly charge');
INSERT INTO "Heads" VALUES (3,1,'Gas','Fixed monthly charge');
INSERT INTO "Heads" VALUES (4,2,'Security Money','Receipt');
INSERT INTO "Heads" VALUES (5,2,'Against Monthly Receivable','Receipt');
INSERT INTO "Heads" VALUES (6,3,'Security Money','Payment');
INSERT INTO "Heads" VALUES (7,1,'Electricity','Monthly Electricity Consumption bill.');
INSERT INTO "Heads" VALUES (8,1,'Restoration','For any change/damage');
INSERT INTO "Heads" VALUES (9,1,'Service Charge','For guards');
INSERT INTO "Heads" VALUES (10,1,'Common Electric','Common Electric');
INSERT INTO "Heads" VALUES (11,1,'Welfare Society','For garbage');
INSERT INTO "Heads" VALUES (12,1,'Garage','Car Parking');
INSERT INTO "Heads" VALUES (13,3,'For Expense','Reimbursement');