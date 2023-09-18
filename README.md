# Spotify End-to-End Data Pipeline

The ETL pipeline for Spotify is not merely a technical process; it is the lifeblood of this data-driven music streaming giant. Its ability to transform raw data into actionable insights, paired with its analytical applications, is instrumental in shaping Spotify's strategic direction, ensuring a seamless user experience, and maintaining its competitive edge in a dynamic industry landscape.

This project aims to securely manage, optimize, and analyze structured and semi-structured music data on Spotify, taking into account factors like music genres and trending metrics. Crafting the strategy with the understanding that the ETL pipeline for Spotify is more than just a technical procedure; it is the beating heart of a data-driven music streaming behemoth. Its capacity to metamorphose raw data into actionable insights, along with its analytical applications, plays a pivotal role in influencing Spotify's strategic trajectory. It guarantees a smooth user experience and fortifies its competitive position in an ever-evolving industry landscape.

## Table of Contents

- [Description](#description)
- [Architecture](#architecture)
- [Modular_Code_Overview](#modular_code_overview)
- [Installation](#installation)
- [Usage](#usage) 
- [Contribution](#contribution)
- [Contact](#contact)

## Description

The ETL pipeline for Spotify adeptly oversees the ETL (Extract, Transform, Load) process. It functions as the lifeblood of this data-driven music streaming giant, efficiently transferring raw data between systems, collecting, storing, analyzing, and transforming data, and presenting essential key performance indicators (KPIs). This pivotal role shapes Spotify's strategy, ensures a seamless user experience, and preserves its competitive edge in a dynamic industry.

## Architecture
<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/architecture_diagram_spotify.gif' alt="architecture_diagram_spotify">

## Data Description

This Spotify playlist analytics project, using a batch processing approach, explores the global top charts. It leverages JSON files for data extraction, focusing on key attributes such as albums, songs, artists, song IDs, and more, all of which are highly popular on Spotify's global social network. These attributes serve as the basis for Spotify's algorithm-driven rankings and statistics.

## Modular_Code_Overview

```
  Data-Batch-Spotify-API
    |_credentials.csv

  DE_Pipeline
    |_IAM
      |_IAM
    |_IAM
      |_IAM
      |_IAM

  Tutorial
    |_tutorial_aws.ipynb

  spotipy_library
    |_spotipy_layer.zip
```
## Installation

Below are the steps required to set up the environment and run this Data Science project on your local machine. Make sure you have the following installed:
- Python 3.x: You can download it from [python.org](https://www.python.org/downloads/).
- Pip: In most cases you can install [here](https://pip.pypa.io/en/stable/installing/).
- AWS CLI: you can download it from [AWSCLI.com](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

## Usage

### IAM
First and foremost, we'll underscore the importance of avoiding the use of the root user for enhanced cloud security. Simultaneously, we'll initiate the creation of a new user responsible for establishing the entire architecture. In addition, we'll craft new roles, including those tailored for Lambda and AWS Glue, each meticulously configured with their requisite permissions. 

<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/iam_user.gif' alt="iam_user">

We navigate to the location where the files we will be using are stored

`"/DE_Pipeline/IAM/"`

We enter the AWS CLI terminal after configuring our environment, and proceed to create a new user.
```terminal
  chmod +x create_user.sh
  ./create_user.sh
```
Now, we create a role for Lambda, which will be useful later.
```terminal
  chmod +x create_rol_lambda.sh
  ./create_rol.sh
```
Next, we create a role for the AWS Glue crawler."
```terminal
  chmod +x create_user.sh
  ./create_rol_crawler.sh
```

### s3
The next step in this Python ETL project is to create an AWS S3 bucket following the best practices mentioned in the official AWS documentation and copy the data into the S3 bucket using the AWS CLI (Command Line Interface). Once you have successfully created the bucket, it’s time to copy all the data (json files containing top global music features statistics for different regions) into the bucket. Then you will create an AWS Glue Catalog that will act as a central data repository.

<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/s3_architecture.gif' alt="architecture_of_buckets">

We navigate to the location where the files we will be using are stored

`"/DE_Pipeline/s3/"`


We establish the S3 block structure in AWS using AWS CLI
```terminal
  chmod +x create_s3_bucket.sh
  ./create_s3_bucket.sh
```

### Extract Data using Lambda Function
You will begin by importing crucial libraries, including data wrangling tools and Python's Pandas, to facilitate efficient data manipulation in your ETL process. This initial step lays the foundation for extracting data from the Spotify API using Lambda functions with event and context parameters. Additionally, you will create an in-memory dataframe and employ Pandas to read data from the API response, enabling data manipulation and transformation before sending it to a designated folder within an S3 bucket.

<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/lambda_extraction.gif' alt="lambda_extraction">

## Contribution
  1. Focus changes on specific improvements.
  2. Follow project's coding style.
  3. Provide detailed descriptions in pull requests.
## Reporting Issues
  Use "Issues" to report bugs or suggest improvements.
# Contact
For questions or contact, my [Mail](diegovillatormx@gmail.com) or [Twitter](https://twitter.com/diegovillatomx) .
