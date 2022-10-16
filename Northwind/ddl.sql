create schema "dbo";
create schema "sys";
create table "dbo"."Categories" (
  "CategoryID" other null,
  "CategoryName" nvarchar(15) not null,
  "Description" other null,
  "Picture" other null,
  constraint "PK_Categories"
    primary key ("CategoryID")
);
create table "dbo"."CustomerCustomerDemo" (
  "CustomerID" nchar(5) not null,
  "CustomerTypeID" nchar(10) not null,
  constraint "PK_CustomerCustomerDemo"
    primary key (
      "CustomerID",
      "CustomerTypeID"
    )
);
create table "dbo"."CustomerDemographics" (
  "CustomerTypeID" nchar(10) not null,
  "CustomerDesc" other null,
  constraint "PK_CustomerDemographics"
    primary key ("CustomerTypeID")
);
create table "dbo"."Customers" (
  "CustomerID" nchar(5) not null,
  "CompanyName" nvarchar(40) not null,
  "ContactName" nvarchar(30) null,
  "ContactTitle" nvarchar(30) null,
  "Address" nvarchar(60) null,
  "City" nvarchar(15) null,
  "Region" nvarchar(15) null,
  "PostalCode" nvarchar(10) null,
  "Country" nvarchar(15) null,
  "Phone" nvarchar(24) null,
  "Fax" nvarchar(24) null,
  constraint "PK_Customers"
    primary key ("CustomerID")
);
create table "dbo"."EmployeeTerritories" (
  "EmployeeID" integer not null,
  "TerritoryID" nvarchar(20) not null,
  constraint "PK_EmployeeTerritories"
    primary key (
      "EmployeeID",
      "TerritoryID"
    )
);
create table "dbo"."Employees" (
  "EmployeeID" other null,
  "LastName" nvarchar(20) not null,
  "FirstName" nvarchar(10) not null,
  "Title" nvarchar(30) null,
  "TitleOfCourtesy" nvarchar(25) null,
  "BirthDate" other null,
  "HireDate" other null,
  "Address" nvarchar(60) null,
  "City" nvarchar(15) null,
  "Region" nvarchar(15) null,
  "PostalCode" nvarchar(10) null,
  "Country" nvarchar(15) null,
  "HomePhone" nvarchar(24) null,
  "Extension" nvarchar(4) null,
  "Photo" other null,
  "Notes" other null,
  "ReportsTo" integer null,
  "PhotoPath" nvarchar(255) null,
  constraint "PK_Employees"
    primary key ("EmployeeID")
);
create table "dbo"."OrderDetails" (
  "OrderDetailsID" other null,
  "OrderID" integer not null,
  "ProductID" integer not null,
  "UnitPrice" other null,
  "Quantity" smallint not null default null,
  "Discount" real not null default null,
  constraint "PK_Order_Details"
    primary key ("OrderDetailsID")
);
create table "dbo"."Orders" (
  "OrderID" other null,
  "CustomerID" nchar(5) null,
  "EmployeeID" integer null,
  "OrderDate" other null,
  "RequiredDate" other null,
  "ShippedDate" other null,
  "ShipVia" integer null,
  "Freight" other null,
  "ShipName" nvarchar(40) null,
  "ShipAddress" nvarchar(60) null,
  "ShipCity" nvarchar(15) null,
  "ShipRegion" nvarchar(15) null,
  "ShipPostalCode" nvarchar(10) null,
  "ShipCountry" nvarchar(15) null,
  constraint "PK_Orders"
    primary key ("OrderID")
);
create table "dbo"."Products" (
  "ProductID" other null,
  "ProductName" nvarchar(40) not null,
  "SupplierID" integer null,
  "CategoryID" integer null,
  "QuantityPerUnit" nvarchar(20) null,
  "UnitPrice" other null,
  "UnitsInStock" smallint null default null,
  "UnitsOnOrder" smallint null default null,
  "ReorderLevel" smallint null default null,
  "Discontinued" bit not null default null,
  constraint "PK_Products"
    primary key ("ProductID")
);
create table "dbo"."Region" (
  "RegionID" integer not null,
  "RegionDescription" nchar(50) not null,
  constraint "PK_Region"
    primary key ("RegionID")
);
create table "dbo"."Shippers" (
  "ShipperID" other null,
  "CompanyName" nvarchar(40) not null,
  "Phone" nvarchar(24) null,
  constraint "PK_Shippers"
    primary key ("ShipperID")
);
create table "dbo"."Suppliers" (
  "SupplierID" other null,
  "CompanyName" nvarchar(40) not null,
  "ContactName" nvarchar(30) null,
  "ContactTitle" nvarchar(30) null,
  "Address" nvarchar(60) null,
  "City" nvarchar(15) null,
  "Region" nvarchar(15) null,
  "PostalCode" nvarchar(10) null,
  "Country" nvarchar(15) null,
  "Phone" nvarchar(24) null,
  "Fax" nvarchar(24) null,
  "HomePage" other null,
  constraint "PK_Suppliers"
    primary key ("SupplierID")
);
create table "dbo"."Territories" (
  "TerritoryID" nvarchar(20) not null,
  "TerritoryDescription" nchar(50) not null,
  "RegionID" integer not null,
  constraint "PK_Territories"
    primary key ("TerritoryID")
);
create table "sys"."trace_xe_action_map" (
  "trace_column_id" smallint not null,
  "package_name" nvarchar(60) not null,
  "xe_action_name" nvarchar(60) not null
);
create table "sys"."trace_xe_event_map" (
  "trace_event_id" smallint not null,
  "package_name" nvarchar(60) not null,
  "xe_event_name" nvarchar(60) not null
);
alter table "dbo"."CustomerCustomerDemo"
  add constraint "FK_CustomerCustomerDemo"
    foreign key ("CustomerTypeID")
    references "dbo"."CustomerDemographics" ("CustomerTypeID");
alter table "dbo"."CustomerCustomerDemo"
  add constraint "FK_CustomerCustomerDemo_Customers"
    foreign key ("CustomerID")
    references "dbo"."Customers" ("CustomerID");
alter table "dbo"."EmployeeTerritories"
  add constraint "FK_EmployeeTerritories_Employees"
    foreign key ("EmployeeID")
    references "dbo"."Employees" ("EmployeeID");
alter table "dbo"."EmployeeTerritories"
  add constraint "FK_EmployeeTerritories_Territories"
    foreign key ("TerritoryID")
    references "dbo"."Territories" ("TerritoryID");
alter table "dbo"."Employees"
  add constraint "FK_Employees_Employees"
    foreign key ("ReportsTo")
    references "dbo"."Employees" ("EmployeeID");
alter table "dbo"."OrderDetails"
  add constraint "FK_Order_Details_Orders"
    foreign key ("OrderID")
    references "dbo"."Orders" ("OrderID");
alter table "dbo"."OrderDetails"
  add constraint "FK_Order_Details_Products"
    foreign key ("ProductID")
    references "dbo"."Products" ("ProductID");
alter table "dbo"."Orders"
  add constraint "FK_Orders_Customers"
    foreign key ("CustomerID")
    references "dbo"."Customers" ("CustomerID");
alter table "dbo"."Orders"
  add constraint "FK_Orders_Employees"
    foreign key ("EmployeeID")
    references "dbo"."Employees" ("EmployeeID");
alter table "dbo"."Orders"
  add constraint "FK_Orders_Shippers"
    foreign key ("ShipVia")
    references "dbo"."Shippers" ("ShipperID");
alter table "dbo"."Products"
  add constraint "FK_Products_Categories"
    foreign key ("CategoryID")
    references "dbo"."Categories" ("CategoryID");
alter table "dbo"."Products"
  add constraint "FK_Products_Suppliers"
    foreign key ("SupplierID")
    references "dbo"."Suppliers" ("SupplierID");
alter table "dbo"."Territories"
  add constraint "FK_Territories_Region"
    foreign key ("RegionID")
    references "dbo"."Region" ("RegionID");
create index "dbo"."CategoryName" on "dbo"."Categories"("CategoryName" asc);
create unique index "dbo"."PK_Categories" on "dbo"."Categories"("CategoryID" asc);
create unique index "dbo"."PK_CustomerCustomerDemo" on "dbo"."CustomerCustomerDemo"(
  "CustomerID" asc,
  "CustomerTypeID" asc
);
create unique index "dbo"."PK_CustomerDemographics" on "dbo"."CustomerDemographics"("CustomerTypeID" asc);
create index "dbo"."City" on "dbo"."Customers"("City" asc);
create index "dbo"."CompanyName" on "dbo"."Customers"("CompanyName" asc);
create unique index "dbo"."PK_Customers" on "dbo"."Customers"("CustomerID" asc);
create index "dbo"."PostalCode" on "dbo"."Customers"("PostalCode" asc);
create index "dbo"."Region" on "dbo"."Customers"("Region" asc);
create unique index "dbo"."PK_EmployeeTerritories" on "dbo"."EmployeeTerritories"(
  "EmployeeID" asc,
  "TerritoryID" asc
);
create index "dbo"."LastName" on "dbo"."Employees"("LastName" asc);
create unique index "dbo"."PK_Employees" on "dbo"."Employees"("EmployeeID" asc);
create index "dbo"."PostalCode" on "dbo"."Employees"("PostalCode" asc);
create index "dbo"."OrderID" on "dbo"."OrderDetails"("OrderID" asc);
create index "dbo"."OrdersOrder_Details" on "dbo"."OrderDetails"("OrderID" asc);
create unique index "dbo"."PK_Order_Details" on "dbo"."OrderDetails"("OrderDetailsID" asc);
create index "dbo"."ProductID" on "dbo"."OrderDetails"("ProductID" asc);
create index "dbo"."ProductsOrder_Details" on "dbo"."OrderDetails"("ProductID" asc);
create index "dbo"."CustomerID" on "dbo"."Orders"("CustomerID" asc);
create index "dbo"."CustomersOrders" on "dbo"."Orders"("CustomerID" asc);
create index "dbo"."EmployeeID" on "dbo"."Orders"("EmployeeID" asc);
create index "dbo"."EmployeesOrders" on "dbo"."Orders"("EmployeeID" asc);
create index "dbo"."OrderDate" on "dbo"."Orders"("OrderDate" asc);
create unique index "dbo"."PK_Orders" on "dbo"."Orders"("OrderID" asc);
create index "dbo"."ShipPostalCode" on "dbo"."Orders"("ShipPostalCode" asc);
create index "dbo"."ShippedDate" on "dbo"."Orders"("ShippedDate" asc);
create index "dbo"."ShippersOrders" on "dbo"."Orders"("ShipVia" asc);
create index "dbo"."CategoriesProducts" on "dbo"."Products"("CategoryID" asc);
create index "dbo"."CategoryID" on "dbo"."Products"("CategoryID" asc);
create unique index "dbo"."PK_Products" on "dbo"."Products"("ProductID" asc);
create index "dbo"."ProductName" on "dbo"."Products"("ProductName" asc);
create index "dbo"."SupplierID" on "dbo"."Products"("SupplierID" asc);
create index "dbo"."SuppliersProducts" on "dbo"."Products"("SupplierID" asc);
create unique index "dbo"."PK_Region" on "dbo"."Region"("RegionID" asc);
create unique index "dbo"."PK_Shippers" on "dbo"."Shippers"("ShipperID" asc);
create index "dbo"."CompanyName" on "dbo"."Suppliers"("CompanyName" asc);
create unique index "dbo"."PK_Suppliers" on "dbo"."Suppliers"("SupplierID" asc);
create index "dbo"."PostalCode" on "dbo"."Suppliers"("PostalCode" asc);
create unique index "dbo"."PK_Territories" on "dbo"."Territories"("TerritoryID" asc);