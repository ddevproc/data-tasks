select value as n,

	cast (
	round(
	(power((1 +sqrt(5))/2, value)
	-power((1-sqrt(5))/2, value))/sqrt(5), 0
	
	
	) as int
	) as fib
	
	from GENERATE_SERIES (0, 30)
	ORDER by value;