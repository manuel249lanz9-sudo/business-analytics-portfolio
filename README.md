# HomeEssentials Sales & Marketing Analysis

This project analyzes a synthetic retail dataset (HomeEssentials Co.) spanning 2023–2024 to identify key drivers of revenue and customer behaviour, focusing on revenue trends, product mix, customer retention, regional and channel performance, and marketing ROI.

## Datasets
- `customers.csv` – 648 unique customers with location and signup data.
- `products.csv` – 75 products across six categories (Furniture, Electronics, Kitchen, Garden, Decor, Cleaning).
- `orders.csv` – 3 800 orders with dates, channels, and statuses.
- `order_items.csv` – 6 233 order items with quantities, unit prices and discounts.
- `marketing_spend.csv` – monthly marketing spend split into digital and traditional channels.

## Key results
- **Monthly revenue & orders:** USD 1 467 571.23 total revenue and 3 133 completed orders, with peaks in January 2024 and a low in August 2024.
- **Top products:** Furniture and Electronics items dominate the top ten, e.g. “Cleaning Item 16”, “Electronics Item 2”.
- **Retention:** 95.99 % of revenue comes from repeat customers; only 26 of 648 customers purchased once.
- **Regional & channel mix:** The South region accounts for over USD 940 k in revenue; Web channel generates more than half of total sales. A creative view shows each region’s revenue share by channel.
- **Categories:** Furniture (USD 1 006 k) and Electronics (USD 460 k) are top categories.
- **Order status:** 82.45 % orders completed; cancellation and refund rates at 12.79 % and 4.76 %.
- **Marketing ROI:** ROI proxy indicates moderate returns with revenue/spend ratios varying by month.

For a detailed analysis, including visualisations and recommendations, see the report in `report_en.md`.

## Usage
The SQL scripts used to generate these KPIs are included in the `sql` folder. The CSV files in `data` can be used to replicate the analysis using Python, SQL or BI tools. The `/charts` folder contains the ready-to-use images for inclusion in presentations or dashboards.
