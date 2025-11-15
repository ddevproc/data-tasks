/*
What happened?
money rounded the result to 4 decimal places early in the calculation.

decimal preserved full precision until the end.

The difference is 0.000025 — tiny, but in high-volume transactions, this adds up.



What happened?
money rounded the result to 4 decimal places early in the calculation.

decimal preserved full precision until the end.

The difference is 0.000025 — tiny, but in high-volume transactions, this adds up.

*/

DECLARE @price_money money = 19.99;
DECLARE @vat_rate decimal(5,2) = 7.75;

SELECT @price_money * @vat_rate / 100 AS VAT_money;


DECLARE @price_decimal decimal(10,4) = 19.99;
DECLARE @vat_rate decimal(5,2) = 7.75;

SELECT @price_decimal * @vat_rate / 100 AS VAT_decimal;

