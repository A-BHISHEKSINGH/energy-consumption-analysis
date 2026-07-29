
-- 1. Total Grid Supply, Consumption, T&D Loss %, and Revenue Leakage by City
SELECT 
    bm.City,
    SUM(ec.`Grid Supply (kWh)`) AS Total_Grid_Supply_kWh,
    SUM(ec.`Electricity Consumption`) AS Total_Consumption_kWh,
    ROUND((SUM(ec.`T&D Loss`) / SUM(ec.`Grid Supply (kWh)`)) * 100, 2) AS TD_Loss_Percentage,
    ROUND(SUM(ec.`Revenue Leakage`), 2) AS Total_Revenue_Leakage_INR
FROM Energy_Consumptions ec
JOIN Building_Master bm ON ec.Building = bm.Building
GROUP BY bm.City
ORDER BY Total_Revenue_Leakage_INR DESC;


-- 2. Top 5 Buildings with Highest T&D Loss Percentage in 2017
SELECT 
    ec.Building,
    bm.City,
    SUM(ec.`T&D Loss`) AS Total_TD_Loss,
    ROUND((SUM(ec.`T&D Loss`) / SUM(ec.`Grid Supply (kWh)`)) * 100, 2) AS Loss_Percentage
FROM Energy_Consumptions ec
JOIN Building_Master bm ON ec.Building = bm.Building
WHERE ec.Year = 2017
GROUP BY ec.Building, bm.City
ORDER BY Loss_Percentage DESC
LIMIT 5;


-- 3. Yearly Revenue Loss Calculation using JOIN with Rates Table
SELECT 
    ec.Year,
    r.`Price Per Unit(Rs)` AS Unit_Rate_INR,
    SUM(ec.`T&D Loss`) AS Total_Units_Lost,
    SUM(ec.`T&D Loss` * r.`Price Per Unit(Rs)`) AS Calculated_Revenue_Leakage_INR
FROM Energy_Consumptions ec
INNER JOIN Rates r ON ec.Year = r.Year
GROUP BY ec.Year, r.`Price Per Unit(Rs)`
ORDER BY ec.Year ASC;


-- 4. Window Function: Year-over-Year (YoY) Growth in Revenue Leakage
WITH YearlySummary AS (
    SELECT 
        Year,
        SUM(`Revenue Leakage`) AS Annual_Revenue_Leakage
    FROM Energy_Consumptions
    GROUP BY Year
)
SELECT 
    Year,
    Annual_Revenue_Leakage,
    LAG(Annual_Revenue_Leakage, 1) OVER (ORDER BY Year) AS Previous_Year_Leakage,
    ROUND(
        ((Annual_Revenue_Leakage - LAG(Annual_Revenue_Leakage, 1) OVER (ORDER BY Year)) 
        / LAG(Annual_Revenue_Leakage, 1) OVER (ORDER BY Year)) * 100, 2
    ) AS YoY_Leakage_Growth_Pct
FROM YearlySummary;