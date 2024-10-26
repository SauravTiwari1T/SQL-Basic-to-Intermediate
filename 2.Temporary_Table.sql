select * into #temp1 from [dbo].[Employess];
select * from #temp1;

-- We have created a temporary table. The command `SELECT * INTO #temp1 FROM [dbo].[Employees];` copies all the data from the `[dbo].[Employees]` table into the temporary table `#temp1`. This table exists only temporarily and does not create a permanent table.
