## Cluster Sampling Design & Optimization Dashboard

## Project Overview
This repository contains an **R Shiny–based Interactive Statistical Tool** developed to demonstrate **Cluster Sampling Design for Population Mean Estimation**.

The application serves as an **educational and analytical dashboard** for understanding cluster sampling methodology. It helps users compute the **required number of clusters** under specified **precision, cost, and time constraints**, and visually illustrates the cluster selection process.  
This approach is especially useful when populations are geographically dispersed or when constructing a complete sampling frame is costly.

## Repository Structure
- **`app.R`** – Main R script containing both UI and server logic for the Shiny application  
- **`README.md`** – Project documentation  

## Features

## Sampling Parameters
The dashboard allows users to specify key design inputs:
- Total number of clusters (K)
- Number of units per cluster (M)
- Between-cluster variance (Sc²)
- Confidence level (standard normal value z)
- Allowable error (d)
- Allowable bias (b)

## Determination of Number of Clusters
The required number of clusters m is calculated as:

m = ceiling[(z² × Sc²) / (d² − b²)]

If the calculated m exceeds the total number of clusters:
m = min(m, K)

This ensures that the selected sample remains feasible within the population.

## Cluster Selection Procedure
- Clusters are selected using Simple Random Sampling
- All units within selected clusters are observed
- The design corresponds to one-stage cluster sampling

## Operational Constraints

## Cost Analysis
- Cost per cluster (Cc)
- Total survey cost based on selected clusters

## Time Analysis
- Time required per cluster (tc)
- Total survey time

## Outputs

## Required Number of Clusters
Displays the minimum number of clusters required to achieve the desired level of precision.

## Cluster Sampling Summary Table
The summary table reports:
- Total number of clusters
- Number of selected clusters
- Units per cluster
- Cost per cluster and total cost
- Time per cluster and total time

## Sampling Design Plot
- Grey points represent non-selected clusters  
- Red points represent selected clusters  

## System Architecture
- Programming Language: R  
- Framework: Shiny  
- Visualization: Base R plotting  
- Interface: Interactive web-based dashboard  

## Applications
- Large-scale survey implementation  
- Cost-efficient survey planning  
- Teaching and learning sampling techniques  
- Demonstration of cluster sampling in statistics courses  

## Limitations
- Assumes equal cluster sizes  
- Assumes known between-cluster variance  
- Does not explicitly account for intra-cluster correlation  
- Non-response is not considered  

## Conclusion
This project provides a simple, interactive, and practical implementation of cluster sampling design. By linking sampling precision with cost and time considerations, the application helps users understand real-world trade-offs in survey planning and enhances conceptual clarity in sampling methodology.

