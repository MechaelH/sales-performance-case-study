# Sales Performance Case Study

**End-to-end analysis pipeline: SQL → R → Tableau**

## Business Question

Which products, regions, and customer segments drive sales performance, and how has that changed over time?

## Overview

This project analyzes 9,800 retail sales transactions across a 4-year period, using a full SQL → R → Tableau pipeline to move from raw data to a tested, visualized set of findings — rather than just building charts on top of assumptions.

- **SQL** (PostgreSQL, hosted on Supabase): data cleaning (date type conversion) and aggregation queries answering each piece of the business question
- **R**: statistical testing (ANOVA, linear regression) to check which factors actually drive sales significantly, rather than relying on visual impressions alone
- **Tableau Public**: interactive dashboard visualizing the trends and comparisons

## Key Findings

| Factor | Statistical Significance | Finding |
|---|---|---|
| **Category** | p < 0.001 (highly significant) | Technology outsells Furniture by ~R105/transaction on average; Office Supplies undersells it by ~R231 |
| **Region** | p = 0.442 (not significant) | Visual differences in total sales by region do not hold up statistically |
| **Segment** | p = 0.556 (not significant) | Customer segment has no measurable effect on sale value |

The combined regression model (Region + Category + Segment) explains only ~5% of the variation in individual sale value (R² = 0.051), indicating that other unmeasured factors — most likely specific product identity or order quantity — play a larger role than the dimensions tested here.

**Takeaway:** product category is a real, statistically supported driver of sales performance. Region and customer segment, despite showing visual differences in aggregate totals, are not reliable predictors at the transaction level. This distinction — between what a chart *looks like* it's showing and what a statistical test confirms — is the central finding of this project.

## Dataset

Retail superstore transactional dataset, 9,800 rows, spanning multiple years. Fields include order/ship dates, customer segment, region, product category/sub-category, and sales value. [Source: Kaggle — Superstore Sales Dataset]

## Files in This Repository

- `project2_sales_analysis.sql` — all SQL queries used for data cleaning and aggregation, with comments explaining what each answers
- `sales_statistical_analysis.R` — R script covering summary statistics, ANOVA tests (Region, Category, Segment), and the combined linear regression model

## Links

- **Tableau Public Dashboard:** [add link here]
- **Full write-up (Medium):** [add link here]

## Tools Used

PostgreSQL (Supabase), R (aov, lm), Tableau Public
