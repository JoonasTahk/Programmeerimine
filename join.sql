

--- left join 1
select FirstName, LastName, SalesTerritoryRegion, SalesTerritoryGroup, SalesTerritoryCountry
from DimEmployee
left join DimSalesTerritory
on DimSalesTerritory.SalesTerritoryKey = DimEmployee.SalesTerritoryKey
order by SalesTerritoryCountry


--- left join 2
select FirstName, LastName, City, PostalCode
from DimCustomer
left join DimGeography
on DimGeography.GeographyKey = DimCustomer.GeographyKey


--- inner join 1
select City, PostalCode, SalesTerritoryGroup, SalesTerritoryCountry
from DimGeography
inner join DimSalesTerritory
on DimSalesTerritory.SalesTerritoryKey = DimGeography.SalesTerritoryKey


--- inner join 2
select Calls, Shift, WageType, DayNumberOfWeek, DayNumberOfMonth, DayNumberOfYear
from FactCallCenter
inner join DimDate
on DimDate.DateKey = FactCallCenter.DateKey


--- right join 1
select EnglishProductName, SpanishProductName, FrenchProductName, DealerPrice
from DimProduct
right join DimProductSubcategory
on DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
order by EnglishProductName


--- right join 2
select EnglishProductSubcategoryName, FrenchProductSubcategoryName, SpanishProductCategoryName
from DimProductSubcategory
right join DimProductCategory
on DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductCategoryKey


--- full outer join 1
select FirstName, LastName, Title, SalesAmount, OrderQuantity
from FactResellerSales
Full outer join DimEmployee
on FactResellerSales.EmployeeKey = DimEmployee.EmployeeKey
Order by Title desc


--- full outer join 2
select Amount, Date, PercentageOfOwnership, OrganizationName
from FactFinance
Full outer join DimOrganization
on DimOrganization.OrganizationKey = FactFinance.OrganizationKey


--- full join 1
select PercentageOfOwnership, OrganizationName, CurrencyName
from DimOrganization
full join DimCurrency
on DimCurrency.CurrencyKey = DimOrganization.CurrencyKey
where DimOrganization.PercentageOfOwnership is null
or PercentageOfOwnership is null


--- full join 2
select CalendarYear, SalesAmountQuota, FirstName, MiddleName, LastName, Gender
from FactSalesQuota
full join DimEmployee
on DimEmployee.EmployeeKey = FactSalesQuota.EmployeeKey
where DimEmployee.MiddleName is null 


--- cross join 1
select Phone, AddressLine1, AddressLine2, BankName, SpanishCountryRegionName, FrenchCountryRegionName
from DimReseller
cross join DimGeography


--- cross join 2
select AverageRate, EndOfDayRate, Date, CalendarYear, FiscalYear, FiscalQuarter
from FactCurrencyRate
cross join DimDate