DECLARE
    @StartingRowNumber INT = 1,
    @RowCountPerPage INT = 3;

-- Create the condition to stop the transaction after all rows have been returned.
WHILE (
    SELECT COUNT(*)
    FROM HumanResources.Department
) >= @StartingRowNumber
BEGIN
    select @StartingRowNumber, COUNT(*)
    FROM HumanResources.Department
	-- Run the query until the stop condition is met.
    SELECT DepartmentID, Name, GroupName
    FROM HumanResources.Department
    ORDER BY DepartmentID ASC OFFSET @StartingRowNumber - 1 ROWS
    FETCH NEXT @RowCountPerPage ROWS ONLY;

    -- Increment @StartingRowNumber value.
    SET @StartingRowNumber = @StartingRowNumber + @RowCountPerPage;

    
END;