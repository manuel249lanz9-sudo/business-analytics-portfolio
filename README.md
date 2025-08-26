# HomeEssentials Sales & Marketing Analysis

[![CI](https://github.com/manuel249lan29-sudo/business-analytics-portfolio/actions/workflows/python-tests.yml/badge.svg?branch=main)](https://github.com/manuel249lan29-sudo/business-analytics-portfolio/actions/workflows/python-tests.yml) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This portfolio project analyzes a synthetic retail dataset from **HomeEssentials Co.** covering 2023–2024. The objective is to identify drivers of revenue and customer behaviour, focusing on revenue trends, product mix, customer retention, regional and channel performance, and marketing ROI.

## Datasets

| File | Description |
| --- | --- |
| `customers.csv` | 648 customers with location, signup date and demographic attributes. |
| `products.csv` | 75 products across six categories (Furniture, Kitchen, Garden, Décor, Cleaning, Electronics). |
| `orders.csv` | 3 080 orders with dates, channels (web/store) and status (completed, cancelled, returned). |
| `order_items.csv` | 6 233 order items including quantities, unit prices and discounts. |
| `marketing_spend.csv` | Monthly marketing spend split into digital and traditional channels. |

## Key results

- **Monthly revenue & orders:** total revenue USD 1 467 571.23 from 3 133 orders. Revenue peaks in January 2024 and troughs in August 2024.
- **Top products:** sales are dominated by the Furniture and Electronics categories. Top-selling items include _Cleaning Item 16_ and _Electronics Item 2_.
- **Retention:** 95.99 % of revenue comes from repeat customers; only 5 % of customers are one-time buyers.
- **Regional & channel mix:** South region generates ~50 % of revenue; the web channel contributes over half of total sales. The bar chart in `charts/channel_region_mix.png` illustrates revenue share by channel.
- **Categories:** Furniture (USD 1 086 k) and Electronics (USD 460 k) account for 80 % of revenue.
- **Order status:** 82.45 % orders completed; cancellation and return rates are 12.79 % and 4.76 %.
- **Marketing ROI:** ROI proxy suggests moderate returns with variations across months.

For detailed analysis and charts, see `report_en.md` and the files in the `/charts` folder.

## Project structure

```
├── data/                   # Data files (csv, aggregated)
├── charts/                 # Generated charts used for dashboards
├── sql/
│   └── project1_ecommerce_sales.sql  # SQL script to generate analysis tables
├── tests/                  # Python tests (pytest)
├── .github/
│   ├── workflows/          # Continuous integration configuration
│   └── ISSUE_TEMPLATE/     # Bug/feature templates
├── README.md               # Project overview (this file)
└── report_en.md            # Detailed report in English
```

## Getting started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/manuel249lan29-sudo/business-analytics-portfolio.git
   cd business-analytics-portfolio
   ```

2. **Create a virtual environment (optional but recommended) and install dependencies:**

   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```

3. **Run the tests:**

   ```bash
   pytest
   ```

4. **Explore the analysis:**
   - Open `report_en.md` for narrative insights and key findings.
   - View charts in the `/charts` folder.
   - Use the SQL script in `/sql/project1_ecommerce_sales.sql` to reproduce metrics in a database environment.

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue using the provided templates. Feel free to fork the repository, create a branch, submit a pull request and complete the checklist in the PR template.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
