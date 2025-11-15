						
						
						
						
						
						
						
						
						
						
						
						
						
						WITH fs
						AS (
							SELECT 0 AS [n]
								,1 AS [Fn]
								,0 AS [Fn-1]

							UNION ALL

							SELECT [n] + 1 AS [n]
								,[Fn] + [Fn-1] AS [Fn]
								,[Fn] AS [Fn-1]
							FROM fs
							WHERE [n] < 19
							)
						SELECT [n]
							,[Fn-1] AS [Fn]
						FROM fs
						ORDER BY [n];
