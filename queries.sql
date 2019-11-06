-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

    select category.CategoryName as Category,
    product.ProductName as Product 
    from [Product] 
    join[Category] on Product.CategoryId = Category.Id
    ;

    select c.CategoryName as Category, 
    p.ProductName as Product
    from [Product] as p
    join[Category]as c on p.CategoryId = c.Id
    ;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.


    select [Order].Id as ids,
    Shipper.CompanyName as Company
    from [Order] 
    Join [Shipper] on [Order].[ShipVia] = [Shipper].Id
    where [Order].OrderDate < '2012-08-09';

    select o.Id as Id,
    s.CompanyName as Company
    from [Order] as o
    join[Shipper] as s on o.ShipVia = s.Id
    where o.OrderDate < '2012-08-09';



-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
        select Product.ProductName as Product,
        [OrderDetail].Quantity as Quantity
        from [OrderDetail]
        join[Product] on [OrderDetail].ProductId = Product.Id
        where [OrderDetail].OrderId = 10252
        order by ProductName;

        select p.ProductName as Products,
        [OD].Quantity as Quantities
        from [OrderDetail] as OD
        join[Product] as p on OD.ProductId = p.Id
        where OD.OrderId =10252
        order by ProductName;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.


    select o.Id as OrderId, c.CompanyName as [Customer Company Name], e.LastName as [Employee Last Name]
    from [Order] as o
    join [Employee] as e on o.EmployeeId = e.Id
    join [Customer] as c on o.CustomerId = c.Id;