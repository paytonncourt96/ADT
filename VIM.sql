CREATE DATABASE vendorinvoicemgmt;

USE vendorinvoicemgmt;


-- Create Employeemaster

CREATE TABLE vendorinvoicemgmt.employeemaster (
    employee_id bigint,
    first_name varchar(45),
    last_name varchar(45),
    designation varchar(45),
    departmentName varchar(45),
    reportingManager varchar(45),
    approvalLimit_min FLOAT NOT NULL,
    approvalLimit_max FLOAT NOT NULL
);

-- Insert Entries in  Employeemaster
INSERT INTO vendorinvoicemgmt.employeemaster (employee_id, first_name, last_name, designation, departmentName, reportingManager, approvalLimit_min, approvalLimit_max)
VALUES ('1000000001', 'Tom', 'Moffa', 'Account Manager', 'Accounts Payable', ' ', 250000, 500000),
       ('1000000002', 'Eric', 'Crockett', 'A/P Processor', 'Accounts Payable', '1000000001', 200000, 249999),
       ('1000000003', 'Jim', 'Morgan', 'A/P Processor', 'Accounts Payable', '1000000001', 150000, 199999),
       ('1000000004', 'Courtney', 'Payton', 'A/P Processor', 'Accounts Payable', '1000000001', 100000, 149999),
       ('1000000005', 'Yashada', 'Nikam', 'A/P Processor', 'Accounts Payable', '1000000001', 50000, 99999),
       ('1000000006', 'Ramana', 'Chowdam', 'A/P Processor', 'Accounts Payable', '1000000001', 1, 49999);

-- Create Vendor Master.       
CREATE TABLE vendorinvoicemgmt.vendormaster (
    vendor_id bigint,
    first_name varchar(45),
    last_name varchar(45),
    address1 varchar(45),
    city varchar(45),
    State varchar(45),
    country varchar(45)
);
-- Insert entries in the Vendor Master
INSERT INTO vendorinvoicemgmt.vendormaster (vendor_id, first_name, last_name, address1, city, state, country)
VALUES ('2000000001', 'Auto Parts', 'Limited', '11966 Luxor Chase', 'Fishers', 'IN', 'US'),
       ('2000000002', 'Simple Machineries', 'Limited', '1456 Trnaquility Ct', 'Indianapolis', 'IN', 'US'),
       ('2000000003', 'Bearing', 'INC', '32678 Washing St', 'Indianapolis', 'IN', 'US'),
       ('2000000004', 'Security device', 'LLC', '42958 New Indian St', 'Louisville', 'KY', 'US'),
       ('2000000005', 'Black and Decker', 'Inc', '1356 Ridge Road', 'Towson', 'MD', 'US'),
       ('2000000006', 'Dyson Boiler', 'Limited', '5678 Lincoln Ave', 'Baltimore', 'MD', 'US'),
       ('2000000007', 'Stanley systems', 'Inc', '3448 Folkridge Dr', 'Indianapolis', 'IN', 'US'),
       ('2000000008', 'Staples', 'Inc', '1345 96th Street', 'Indianapolis', 'IN', 'US'),
       ('2000000009', 'Billi John', 'Inc', '6745 82nd Street', 'Indianapolis', 'IN', 'US'),
       ('2000000010', 'AMD ', 'Inc', '4687 Main street', 'Frenchlick', 'IN', 'US');
 
-- Create Material Master
CREATE TABLE vendorinvoicemgmt.materialmaster (
    material_num bigint,
    Material_desc varchar(45),
    vendor_id bigint
);

-- Insert Table Entries in Material Master.
INSERT INTO vendorinvoicemgmt.materialmaster (material_num, Material_desc, vendor_id)
VALUES ('3000000001', 'Bearings', '2000000003'),
       ('3000000002', 'M100-Machine1', '2000000002'),
       ('3000000003', 'M101-Machine1', '2000000002'),
       ('3000000004', 'M102-Machine1', '2000000002'),
       ('3000000005', 'M103-Machine1', '2000000002'),
       ('3000000006', 'Auto Part1', '2000000001'),
       ('3000000007', 'Auto Part2', '2000000001'),
       ('3000000008', 'Auto Part3', '2000000001'),
       ('3000000009', 'Auto Part4', '2000000001'),
       ('3000000010', 'Auto Part5', '2000000001'),
       ('3000000011', 'Security camera', '2000000004'),
       ('3000000012', 'Security software', '2000000004'),
       ('3000000013', 'Security remote', '2000000004'),
	   ('3000000014', 'Construction tool kit', '2000000005'),
       ('3000000015', 'Dewalt toolkit', '2000000005'),
       ('3000000016', 'CDIY Grass tools', '2000000005'),
       ('3000000017', 'Construction equip', '2000000005');

DROP TABLE vendorinvoicemgmt.purchaseorderhdr;
-- Create Vendor Invoice header Table
CREATE TABLE vendorinvoicemgmt.purchaseorderhdr (
    poNumber bigint,
    vendor_id bigint,
    companycode bigint,
    creation_date date,
    NetPrice float,
    tax float,
    totalprice float,
    currency varchar(3)
);

-- Insert entries in the invoice header table.
INSERT INTO vendorinvoicemgmt.purchaseorderhdr (poNumber, vendor_id, companycode, creation_date, netPrice, tax, totalPrice, currency)
VALUES ('40000000001', '2000000003', '1010', '2023-07-01', 2000, 140, 2140, 'USD'),
       ('40000000002', '2000000002', '1010', '2023-07-02', 10500, 715, 11215, 'USD'),
       ('40000000003', '2000000001', '1020', '2023-07-03', 4025, 281.75, 4306.75, 'USD'),
       ('40000000004', '2000000004', '1020', '2023-07-04', 12650, 885.5, 24235.5, 'USD'),
       ('40000000005', '2000000005', '1020', '2023-07-05', 72000, 5040, 77040, 'USD'),
       ('40000000006', '2000000003', '1010', '2023-01-01', 2000, 140, 2140, 'USD'),
       ('40000000007', '2000000002', '1010', '2023-01-02', 10500, 715, 11215, 'USD'),
       ('40000000008', '2000000001', '1020', '2023-01-03', 4025, 281.75, 4306.75, 'USD'),
       ('40000000009', '2000000004', '1020', '2023-01-04', 12650, 885.5, 24235.5, 'USD'),
       ('40000000010', '2000000005', '1020', '2023-01-05', 72000, 5040, 77040, 'USD'),
       ('40000000011', '2000000003', '1010', '2023-02-01', 2000, 140, 2140, 'USD'),
       ('40000000012', '2000000002', '1010', '2023-02-02', 10500, 715, 11215, 'USD'),
       ('40000000013', '2000000001', '1020', '2023-02-03', 4025, 281.75, 4306.75, 'USD'),
       ('40000000014', '2000000004', '1020', '2023-02-04', 12650, 885.5, 24235.5, 'USD'),
       ('40000000015', '2000000005', '1020', '2023-02-05', 72000, 5040, 77040, 'USD'),
       ('40000000016', '2000000003', '1010', '2023-03-01', 2000, 140, 2140, 'USD'),
       ('40000000017', '2000000002', '1010', '2023-03-02', 10500, 715, 11215, 'USD'),
       ('40000000018', '2000000001', '1020', '2023-03-03', 4025, 281.75, 4306.75, 'USD'),
       ('40000000019', '2000000004', '1020', '2023-03-04', 12650, 885.5, 24235.5, 'USD'),
       ('40000000020', '2000000005', '1020', '2023-03-05', 72000, 5040, 77040, 'USD'),
       ('40000000021', '2000000003', '1010', '2023-04-01', 2000, 140, 2140, 'USD'),
       ('40000000022', '2000000002', '1010', '2023-04-02', 10500, 715, 11215, 'USD'),
       ('40000000023', '2000000001', '1020', '2023-04-03', 4025, 281.75, 4306.75, 'USD'),
       ('40000000024', '2000000004', '1020', '2023-04-04', 12650, 885.5, 24235.5, 'USD'),
       ('40000000025', '2000000005', '1020', '2023-04-05', 72000, 5040, 77040, 'USD');

DROP TABLE vendorinvoicemgmt.purchaseorderitm;
-- Create Invoice Item Table.
CREATE TABLE vendorinvoicemgmt.purchaseorderitm (
    poNumber bigint,
    poItem bigint,
    material_num bigint,
    material_desc varchar(45),
    quantity bigint,
    UOM varchar(3),
    unitPrice float, 
    NetPrice float,
    tax float,
    totalprice float,
    currency varchar(3)
 );
 
 -- Insert entries in vendor invoice item.
INSERT INTO vendorinvoicemgmt.purchaseorderitm(poNumber, poItem, material_num, material_desc, quantity, UOM, unitPrice, NetPrice, tax, totalPrice, currency)
VALUES ('40000000001', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD'),
	   ('40000000002', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD'), 
       ('40000000002', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD'), 
       ('40000000002', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD'), 
       ('40000000002', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD'), 
       ('40000000003', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD'), 
       ('40000000003', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD'), 
       ('40000000003', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD'), 
       ('40000000003', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD'), 
       ('40000000004', '000001','3000000010', 'Security camera', '100', 'EA', 100, 10000, 700, 1070, 'USD'), 
       ('40000000004', '000002','3000000011', 'Security Software', '50', 'EA', 50, 2500, 175, 2675, 'USD'), 
       ('40000000004', '000003','3000000012', 'Security remote', '5', 'EA', 30, 150, 10.5, 160.5, 'USD'), 
       ('40000000005', '000001','3000000013', 'Construction tool kit', '10', 'EA', 1000, 10000, 700, 1070, 'USD'), 
       ('40000000005', '000002','3000000014', 'Dewalt toolkit', '50', 'EA', 40, 2000, 140, 2140, 'USD'), 
       ('40000000005', '000003','3000000015', 'CDIY Grass tools', '100', 'EA', 500, 50000, 3500, 53500, 'USD'),
       ('40000000005', '000004','3000000016', 'Construction equip.', '1000', 'EA', 10, 10000, 700, 1070, 'USD'),
       ('40000000006', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD'),
	   ('40000000007', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD'), 
       ('40000000007', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD'), 
       ('40000000007', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD'), 
       ('40000000007', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD'), 
       ('40000000008', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD'), 
       ('40000000008', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD'), 
       ('40000000008', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD'), 
       ('40000000008', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD'), 
       ('40000000009', '000001','3000000010', 'Security camera', '100', 'EA', 100, 10000, 700, 1070, 'USD'), 
       ('40000000009', '000002','3000000011', 'Security Software', '50', 'EA', 50, 2500, 175, 2675, 'USD'), 
       ('40000000009', '000003','3000000012', 'Security remote', '5', 'EA', 30, 150, 10.5, 160.5, 'USD'), 
       ('40000000010', '000001','3000000013', 'Construction tool kit', '10', 'EA', 1000, 10000, 700, 1070, 'USD'), 
       ('40000000010', '000002','3000000014', 'Dewalt toolkit', '50', 'EA', 40, 2000, 140, 2140, 'USD'), 
       ('40000000010', '000003','3000000015', 'CDIY Grass tools', '100', 'EA', 500, 50000, 3500, 53500, 'USD'),
       ('40000000010', '000004','3000000016', 'Construction equip.', '1000', 'EA', 10, 10000, 700, 1070, 'USD'),
       ('40000000011', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD'),
	   ('40000000012', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD'), 
       ('40000000012', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD'), 
       ('40000000012', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD'), 
       ('40000000012', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD'), 
       ('40000000013', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD'), 
       ('40000000013', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD'), 
       ('40000000013', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD'), 
       ('40000000013', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD'), 
       ('40000000014', '000001','3000000010', 'Security camera', '100', 'EA', 100, 10000, 700, 1070, 'USD'), 
       ('40000000014', '000002','3000000011', 'Security Software', '50', 'EA', 50, 2500, 175, 2675, 'USD'), 
       ('40000000014', '000003','3000000012', 'Security remote', '5', 'EA', 30, 150, 10.5, 160.5, 'USD'), 
       ('40000000015', '000001','3000000013', 'Construction tool kit', '10', 'EA', 1000, 10000, 700, 1070, 'USD'), 
       ('40000000015', '000002','3000000014', 'Dewalt toolkit', '50', 'EA', 40, 2000, 140, 2140, 'USD'), 
       ('40000000015', '000003','3000000015', 'CDIY Grass tools', '100', 'EA', 500, 50000, 3500, 53500, 'USD'),
       ('40000000015', '000004','3000000016', 'Construction equip.', '1000', 'EA', 10, 10000, 700, 1070, 'USD'),
       ('40000000016', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD'),
	   ('40000000017', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD'), 
       ('40000000017', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD'), 
       ('40000000017', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD'), 
       ('40000000017', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD'), 
       ('40000000018', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD'), 
       ('40000000018', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD'), 
       ('40000000018', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD'), 
       ('40000000018', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD'), 
       ('40000000019', '000001','3000000010', 'Security camera', '100', 'EA', 100, 10000, 700, 1070, 'USD'), 
       ('40000000019', '000002','3000000011', 'Security Software', '50', 'EA', 50, 2500, 175, 2675, 'USD'), 
       ('40000000019', '000003','3000000012', 'Security remote', '5', 'EA', 30, 150, 10.5, 160.5, 'USD'), 
       ('40000000020', '000001','3000000013', 'Construction tool kit', '10', 'EA', 1000, 10000, 700, 1070, 'USD'), 
       ('40000000020', '000002','3000000014', 'Dewalt toolkit', '50', 'EA', 40, 2000, 140, 2140, 'USD'), 
       ('40000000020', '000003','3000000015', 'CDIY Grass tools', '100', 'EA', 500, 50000, 3500, 53500, 'USD'),
       ('40000000020', '000004','3000000016', 'Construction equip.', '1000', 'EA', 10, 10000, 700, 1070, 'USD'),
       ('40000000021', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD'),
	   ('40000000022', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD'), 
       ('40000000022', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD'), 
       ('40000000022', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD'), 
       ('40000000022', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD'), 
       ('40000000023', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD'), 
       ('40000000023', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD'), 
       ('40000000023', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD'), 
       ('40000000023', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD'), 
       ('40000000024', '000001','3000000010', 'Security camera', '100', 'EA', 100, 10000, 700, 1070, 'USD'), 
       ('40000000024', '000002','3000000011', 'Security Software', '50', 'EA', 50, 2500, 175, 2675, 'USD'), 
       ('40000000024', '000003','3000000012', 'Security remote', '5', 'EA', 30, 150, 10.5, 160.5, 'USD'), 
       ('40000000025', '000001','3000000013', 'Construction tool kit', '10', 'EA', 1000, 10000, 700, 1070, 'USD'), 
       ('40000000025', '000002','3000000014', 'Dewalt toolkit', '50', 'EA', 40, 2000, 140, 2140, 'USD'), 
       ('40000000025', '000003','3000000015', 'CDIY Grass tools', '100', 'EA', 500, 50000, 3500, 53500, 'USD'),
       ('40000000025', '000004','3000000016', 'Construction equip.', '1000', 'EA', 10, 10000, 700, 1070, 'USD');

DROP TABLE vendorinvoicemgmt.vendorinvoicehdr;
-- Create Vendor Invoice header Table
CREATE TABLE vendorinvoicemgmt.vendorinvoicehdr (
    invoice_num bigint,
    vendor_id bigint,
    companycode bigint,
    approver_id bigint,
    creation_date date,
    NetPrice float,
    tax float,
    totalprice float,
    currency varchar(3)
);
-- Insert entries in the invoice header table.
INSERT INTO vendorinvoicemgmt.vendorinvoicehdr(invoice_num, vendor_id, companycode, approver_id, creation_date, netPrice, tax, totalPrice, currency)
VALUES ('50000000001', '2000000003', '1010', '1000000005', '2023-07-01', 2000, 140, 2140, 'USD'),
       ('50000000002', '2000000002', '1010', '1000000005', '2023-07-02', 10500, 715, 11215, 'USD'),
       ('50000000003', '2000000001', '1020', '1000000005', '2023-07-03', 4025, 281.75, 4306.75, 'USD'),
       ('50000000004', '2000000004', '1020', '1000000005', '2023-07-04', 12650, 885.5, 24235.5, 'USD'),
       ('50000000005', '2000000005', '1020', '1000000005', '2023-07-05', 72000, 5040, 77040, 'USD'),
       ('50000000006', '2000000003', '1010', '1000000005', '2023-01-01', 2000, 140, 2140, 'USD'),
       ('50000000007', '2000000002', '1010', '1000000005', '2023-01-02', 10500, 715, 11215, 'USD'),
       ('50000000008', '2000000001', '1020', '1000000005', '2023-01-03', 4025, 281.75, 4306.75, 'USD'),
       ('50000000009', '2000000004', '1020', '1000000005', '2023-01-04', 12650, 885.5, 24235.5, 'USD'),
       ('50000000010', '2000000005', '1020', '1000000005', '2023-01-05', 72000, 5040, 77040, 'USD'),
       ('50000000011', '2000000003', '1010', '1000000005', '2023-02-01', 2000, 140, 2140, 'USD'),
       ('50000000012', '2000000002', '1010', '1000000005', '2023-02-02', 10500, 715, 11215, 'USD'),
       ('50000000013', '2000000001', '1020', '1000000005', '2023-02-03', 4025, 281.75, 4306.75, 'USD'),
       ('50000000014', '2000000004', '1020', '1000000005', '2023-02-04', 12650, 885.5, 24235.5, 'USD'),
       ('50000000015', '2000000005', '1020', '1000000005', '2023-02-05', 72000, 5040, 77040, 'USD'),
       ('50000000016', '2000000003', '1010', '1000000005', '2023-03-01', 2000, 140, 2140, 'USD'),
       ('50000000017', '2000000002', '1010', '1000000005', '2023-03-02', 10500, 715, 11215, 'USD'),
       ('50000000018', '2000000001', '1020', '1000000005', '2023-03-03', 4025, 281.75, 4306.75, 'USD'),
       ('50000000019', '2000000004', '1020', '1000000005', '2023-03-04', 12650, 885.5, 24235.5, 'USD'),
       ('50000000020', '2000000005', '1020', '1000000005', '2023-03-05', 72000, 5040, 77040, 'USD'),
       ('50000000021', '2000000003', '1010', '1000000005', '2023-04-01', 2000, 140, 2140, 'USD'),
       ('50000000022', '2000000002', '1010', '1000000005', '2023-04-02', 10500, 715, 11215, 'USD'),
       ('50000000023', '2000000001', '1020', '1000000005', '2023-04-03', 4025, 281.75, 4306.75, 'USD');
      
DROP TABLE vendorinvoicemgmt.vendorinvoiceitm;
-- Create Invoice Item Table.
CREATE TABLE vendorinvoicemgmt.vendorinvoiceitm (
    invoice_num bigint,
    item_num bigint,
    material_num bigint,
    material_desc varchar(45),
    quantity bigint,
    UOM varchar(3),
    unitPrice float, 
    NetPrice float,
    tax float,
    totalprice float,
    currency varchar(3),
    poNumber bigint,
    poItem bigint
);

-- Insert entries in vendor invoice item.
INSERT INTO vendorinvoicemgmt.vendorinvoiceitm(invoice_num, item_num, material_num, material_desc, quantity, UOM, unitPrice, NetPrice, tax, totalPrice, currency, poNumber, poItem)
VALUES ('50000000001', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD', '40000000001', '000001'),
	   ('50000000002', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD', '40000000002', '000001'), 
       ('50000000002', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD', '40000000002', '000002'), 
       ('50000000002', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD', '40000000002', '000003'), 
       ('50000000002', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD', '40000000002', '000004'), 
       ('50000000003', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD', '40000000003', '000001'), 
       ('50000000003', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD', '40000000003', '000002'), 
       ('50000000003', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD', '40000000003', '000003'), 
       ('50000000003', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD', '40000000003', '000004'), 
       ('50000000004', '000001','3000000010', 'Security camera', '100', 'EA', 100, 10000, 700, 1070, 'USD', '40000000004', '000001'), 
       ('50000000004', '000002','3000000011', 'Security Software', '50', 'EA', 50, 2500, 175, 2675, 'USD', '40000000004', '000002'), 
       ('50000000004', '000003','3000000012', 'Security remote', '5', 'EA', 30, 150, 10.5, 160.5, 'USD', '40000000004', '000003'), 
       ('50000000005', '000001','3000000013', 'Construction tool kit', '10', 'EA', 1000, 10000, 700, 1070, 'USD', '40000000005', '000001'), 
       ('50000000005', '000002','3000000014', 'Dewalt toolkit', '50', 'EA', 40, 2000, 140, 2140, 'USD', '40000000005', '000002'), 
       ('50000000005', '000003','3000000015', 'CDIY Grass tools', '100', 'EA', 500, 50000, 3500, 53500, 'USD', '40000000005', '000003'),
       ('50000000005', '000004','3000000016', 'Construction equip.', '1000', 'EA', 10, 10000, 700, 1070, 'USD', '40000000005', '000004'),
       ('50000000006', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD', '40000000006', '000001'),
	   ('50000000007', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD', '40000000007', '000001'), 
       ('50000000007', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD', '40000000007', '000002'), 
       ('50000000007', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD', '40000000007', '000003'), 
       ('50000000007', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD', '40000000007', '000004'), 
       ('50000000008', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD', '40000000008', '000001'), 
       ('50000000008', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD', '40000000008', '000002'), 
       ('50000000008', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD', '40000000008', '000003'), 
       ('50000000008', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD', '40000000008', '000004'), 
       ('50000000009', '000001','3000000010', 'Security camera', '100', 'EA', 100, 10000, 700, 1070, 'USD', '40000000009', '000001'), 
       ('50000000009', '000002','3000000011', 'Security Software', '50', 'EA', 50, 2500, 175, 2675, 'USD', '40000000009', '000002'), 
       ('50000000009', '000003','3000000012', 'Security remote', '5', 'EA', 30, 150, 10.5, 160.5, 'USD', '40000000009', '000003'), 
       ('50000000010', '000001','3000000013', 'Construction tool kit', '10', 'EA', 1000, 10000, 700, 1070, 'USD', '40000000010', '000001'), 
       ('50000000010', '000002','3000000014', 'Dewalt toolkit', '50', 'EA', 40, 2000, 140, 2140, 'USD', '40000000010', '000002'), 
       ('50000000010', '000003','3000000015', 'CDIY Grass tools', '100', 'EA', 500, 50000, 3500, 53500, 'USD', '40000000010', '000003'),
       ('50000000010', '000004','3000000016', 'Construction equip.', '1000', 'EA', 10, 10000, 700, 1070, 'USD', '40000000010', '000004'),
       ('50000000011', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD', '40000000011', '000001'),
	   ('50000000012', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD', '40000000012', '000001'), 
       ('50000000012', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD', '40000000012', '000002'), 
       ('50000000012', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD', '40000000012', '000003'), 
       ('50000000012', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD', '40000000012', '000004'), 
       ('50000000013', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD', '40000000013', '000001'), 
       ('50000000013', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD', '40000000013', '000002'), 
       ('50000000013', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD', '40000000013', '000003'), 
       ('50000000013', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD', '40000000013', '000004'), 
       ('50000000014', '000001','3000000010', 'Security camera', '100', 'EA', 100, 10000, 700, 1070, 'USD', '40000000014', '000001'), 
       ('50000000014', '000002','3000000011', 'Security Software', '50', 'EA', 50, 2500, 175, 2675, 'USD', '40000000014', '000002'), 
       ('50000000014', '000003','3000000012', 'Security remote', '5', 'EA', 30, 150, 10.5, 160.5, 'USD', '40000000014', '000003'), 
       ('50000000015', '000001','3000000013', 'Construction tool kit', '10', 'EA', 1000, 10000, 700, 1070, 'USD', '40000000015', '000001'), 
       ('50000000015', '000002','3000000014', 'Dewalt toolkit', '50', 'EA', 40, 2000, 140, 2140, 'USD', '40000000015', '000002'), 
       ('50000000015', '000003','3000000015', 'CDIY Grass tools', '100', 'EA', 500, 50000, 3500, 53500, 'USD', '40000000015', '000003'),
       ('50000000015', '000004','3000000016', 'Construction equip.', '1000', 'EA', 10, 10000, 700, 1070, 'USD', '40000000015', '000004'),
       ('50000000016', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD', '40000000016', '000001'),
	   ('50000000017', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD', '40000000017', '000001'), 
       ('50000000017', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD', '40000000017', '000002'), 
       ('50000000017', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD', '40000000017', '000003'), 
       ('50000000017', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD', '40000000017', '000004'), 
       ('50000000018', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD', '40000000018', '000001'), 
       ('50000000018', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD', '40000000018', '000002'), 
       ('50000000018', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD', '40000000018', '000003'), 
       ('50000000018', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD', '40000000018', '000004'), 
       ('50000000019', '000001','3000000010', 'Security camera', '100', 'EA', 100, 10000, 700, 1070, 'USD', '40000000019', '000001'), 
       ('50000000019', '000002','3000000011', 'Security Software', '50', 'EA', 50, 2500, 175, 2675, 'USD', '40000000019', '000002'), 
       ('50000000019', '000003','3000000012', 'Security remote', '5', 'EA', 30, 150, 10.5, 160.5, 'USD', '40000000019', '000003'), 
       ('50000000020', '000001','3000000013', 'Construction tool kit', '10', 'EA', 1000, 10000, 700, 1070, 'USD', '40000000020', '000001'), 
       ('50000000020', '000002','3000000014', 'Dewalt toolkit', '50', 'EA', 40, 2000, 140, 2140, 'USD', '40000000020', '000002'), 
       ('50000000020', '000003','3000000015', 'CDIY Grass tools', '100', 'EA', 500, 50000, 3500, 53500, 'USD', '40000000020', '000003'),
       ('50000000020', '000004','3000000016', 'Construction equip.', '1000', 'EA', 10, 10000, 700, 1070, 'USD', '40000000020', '000004'),
       ('50000000021', '000001','3000000001', 'Bearings', '1000', 'PK', 2, 2000, 140, 2140, 'USD', '40000000021', '000001'),
	   ('50000000022', '000001','3000000002', 'M100-Machine1', '1500', 'EA', 4, 6000, 420, 6420, 'USD', '40000000022', '000001'), 
       ('50000000022', '000002','3000000003', 'M101-Machine1', '100', 'EA', 10, 1000, 70, 1070, 'USD', '40000000022', '000002'), 
       ('50000000022', '000003','3000000004', 'M102-Machine1', '100', 'EA', 20, 2000, 140, 2140, 'USD', '40000000022', '000003'), 
       ('50000000022', '000004','3000000005', 'M103-Machine1', '100', 'EA', 15, 1500, 85, 1586, 'USD', '40000000022', '000004'), 
       ('50000000023', '000001','3000000006', 'Auto Part1', '20', 'EA', 50, 1000, 70, 1070, 'USD', '40000000023', '000001'), 
       ('50000000023', '000002','3000000007', 'Auto Part2', '15', 'EA', 35, 525, 36.75, 561.75, 'USD', '40000000023', '000002'), 
       ('50000000023', '000003','3000000008', 'Auto Part3', '30', 'EA', 50, 1500, 105, 1605, 'USD', '40000000023', '000003'), 
       ('50000000023', '000004','3000000009', 'Auto Part4', '40', 'EA', 25, 1000, 70, 1070, 'USD', '40000000023', '000004');
       
       
       
       
       -- QUERIES

-- How many invoices has each vendor submitted?

SELECT v.vendor_id, v.first_name, v.last_name, COUNT(h.invoice_num) AS total_invoices
FROM vendormaster v
LEFT JOIN vendorinvoicehdr h ON v.vendor_id = h.vendor_id
GROUP BY v.vendor_id, v.first_name, v.last_name;


-- What is the total amount of invoices processed by each employee? (including those who haven't approved any invoices.)

SELECT e.employee_id, e.first_name, e.last_name, SUM(h.totalprice) AS total_amount
FROM employeemaster e
LEFT JOIN vendorinvoicehdr h ON e.employee_id = h.approver_id
GROUP BY e.employee_id, e.first_name, e.last_name;

-- What is the total amount of invoices processed by each employee? (not including those who haven't approved any invoices.)

SELECT e.employee_id, e.first_name, e.last_name, SUM(h.totalprice) AS total_amount
FROM employeemaster e
JOIN vendorinvoicehdr h ON e.employee_id = h.approver_id
GROUP BY e.employee_id, e.first_name, e.last_name;


-- Which vendors have the highest total invoice amounts?

SELECT v.vendor_id, v.first_name, v.last_name, SUM(h.totalprice) AS total_amount
FROM vendormaster v
JOIN vendorinvoicehdr h ON v.vendor_id = h.vendor_id
GROUP BY v.vendor_id, v.first_name, v.last_name
ORDER BY total_amount DESC;


-- Which materials have been ordered the most?

SELECT m.material_num, m.Material_desc, SUM(i.quantity) AS total_ordered
FROM materialmaster m
JOIN vendorinvoiceitm i ON m.material_num = i.material_num
GROUP BY m.material_num, m.Material_desc
ORDER BY total_ordered DESC;


-- How many invoices are associated with each employee, regardless of their approval status?


SELECT e.employee_id, e.first_name, e.last_name,
       COUNT(h.approver_id) AS total_invoices
FROM employeemaster e
LEFT JOIN vendorinvoicehdr h ON e.employee_id = h.approver_id
GROUP BY e.employee_id, e.first_name, e.last_name;


-- Who are the top 5 employees with the highest and lowest approval limits?

SELECT employee_id, first_name, last_name, approvalLimit_max
FROM employeemaster
ORDER BY approvalLimit_max DESC
LIMIT 5;

SELECT employee_id, first_name, last_name, approvalLimit_max
FROM employeemaster
ORDER BY approvalLimit_max ASC
LIMIT 5;

--  What is the distribution of invoices based on approval amounts for purchases, categorized into different ranges of purchase amounts?

SELECT invoice_num, totalprice,
  CASE
    WHEN totalprice <= 1000 THEN 'Low Approval'
    WHEN totalprice > 1000 AND totalprice <= 5000 THEN 'Medium Approval'
    WHEN totalprice > 5000 AND totalprice <= 10000 THEN 'High Approval'
    ELSE 'Very High Approval'
  END AS approval_range
FROM vendorinvoicehdr;

SELECT 
    invoice_num,
    totalprice,
    CASE
        WHEN totalprice BETWEEN 0 AND 1000 THEN '0 - 1000'
        WHEN totalprice BETWEEN 1001 AND 5000 THEN '1001 - 5000'
        WHEN totalprice BETWEEN 5001 AND 10000 THEN '5001 - 10000'
        ELSE '10001+'
    END AS approval_range
FROM 
    vendorinvoicehdr;

-- Count of ranges of ranges of purchase amounts
SELECT 
    CASE
        WHEN totalprice BETWEEN 0 AND 1000 THEN '0 - 1000'
        WHEN totalprice BETWEEN 1001 AND 5000 THEN '1001 - 5000'
        WHEN totalprice BETWEEN 5001 AND 10000 THEN '5001 - 10000'
        ELSE '10001+'
    END AS approval_range,
    COUNT(*) AS invoice_count
FROM 
    vendorinvoicehdr
GROUP BY 
    approval_range;
