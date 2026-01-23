WITH Base_Data AS (
    -- Step 1: Pehle sirf Sales aur Profit ko Year ke hisab se summarize karo
    SELECT 
        EXTRACT(YEAR FROM CAST(`Order Date` AS DATE)) AS order_year,
        `Sub-Category`,
        SUM(Profit) AS yearly_profit
    FROM `superstore_analysis.raw_data`
    GROUP BY 1, 2
),
Ranked_Data AS (
    -- Step 2: Ab summarize kiye huye data par RANK lagao
    SELECT 
        *,
        RANK() OVER (PARTITION BY order_year ORDER BY yearly_profit DESC) as profit_rank
    FROM Base_Data
)
-- Step 3: Final Top 5 filter
SELECT * FROM Ranked_Data 
WHERE profit_rank <= 5
ORDER BY order_year DESC, profit_rank ASC;