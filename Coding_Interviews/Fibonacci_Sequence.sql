WITH FibonacciSequence AS (
    -- Anchor Member (The starting point: F0 and F1)
    SELECT
        CAST(1 AS BIGINT) AS n,       -- Sequence position (starts at 1 for F1)
        CAST(1 AS BIGINT) AS CurrentFib, -- The current Fibonacci number (F1)
        CAST(0 AS BIGINT) AS PreviousFib  -- The previous Fibonacci number (F0)

    UNION ALL

    -- Recursive Member (Calculates the next number)
    SELECT
        n + 1 AS n,                            -- Increment the position
        CurrentFib + PreviousFib AS CurrentFib, -- Calculate the next Fibonacci number
        CurrentFib AS PreviousFib              -- Move the current number to the 'previous' spot
    FROM
        FibonacciSequence
    -- Termination condition (stops after generating 15 numbers)
    WHERE
        n < 19
)
-- Final SELECT statement to display the results
SELECT
    n,
    CurrentFib AS FibonacciNumber
FROM
    FibonacciSequence
ORDER BY
    n;