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

<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/lambda_extraction.gif' alt="lambda_extraction">

We navigate to the location where the files we will be using are stored

`"/DE_Pipeline/lambda/Extract_Data/"`

We will create the AWS Lambda layer using AWS CLI
```terminal
  chmod +x create_layer.sh
  ./create_layer.sh
```
Next, we will create the AWS Lambda function using AWS CLI
```terminal
  chmod +x create_function.sh
  ./create_function.sh
```
Then, we will add enviroment variables to lambda function using AWS CLI
```terminal
  chmod +x add_variables.sh
  ./add_variables.sh
```
Now, we will conect layer to lambda function using AWS CLI
```terminal
  chmod +x conecting_everything.sh
  ./conecting_everything.sh
```
Finally, we will test lambda function using AWS CLI
```terminal
  chmod +x test_function.sh
  ./test_function.sh
```

### Transform Data using Lambda Function

Your journey commences with the importation of vital libraries, such as data wrangling tools and Python's Pandas, to streamline data manipulation within your ETL workflow. This initial phase serves as the bedrock for data extraction from the Spotify API through Lambda functions, thoughtfully configured with event and context parameters. Subsequently, you will establish an in-memory dataframe and harness Pandas to parse data from the API response, paving the way for data manipulation and transformation prior to dispatching it to a specified directory within an S3 bucket.

<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/transform_data.gif' alt="transform_data">

We navigate to the location where the files we will be using are stored

`"/DE_Pipeline/lambda/Transform_Loada_Data/"`

Next, we will create the AWS Lambda function using AWS CLI
```terminal
  chmod +x create_function.sh
  ./create_functionr.sh
```
We will create the AWS Lambda layer using AWS CLI

```terminal
  chmod +x add_layer.sh
  ./add_layer.sh
```
Finally, we will test lambda function using AWS CLI
```terminal
  chmod +x test_function.sh
  ./test_function.sh
```

### Data Extraction automation using Events Bridge

Data extraction automation using Events Bridge streamlines and accelerates the process of gathering valuable data. By leveraging this powerful tool, organizations can seamlessly trigger and orchestrate data extraction tasks, ensuring a continuous and efficient flow of essential information.

<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/extract_automation.gif' alt="event_bridge">

We navigate to the location where the files we will be using are stored

`"/DE_Pipeline/CloudWatchEvents/extract_data/"`

Next, we will create create the rule on EventBridge using AWS CLI
```terminal
  chmod +x create_rule.sh
  ./create_rule.sh
```
We will add the rule to AWS Lambda using AWS CLI

```terminal
  chmod +x add_rule_lambda.sh
  ./add_rule_lambda.sh
```
Finally, we will test the rule during 3 minutes using AWS CLI
```terminal
  chmod +x diable_rule.sh
  ./disable_rule.sh
```
### Data Transformation automation using Events Bridge

Data extraction automation using Events Bridge streamlines and accelerates the process of gathering valuable data. By leveraging this powerful tool, organizations can seamlessly trigger and orchestrate data extraction tasks, ensuring a continuous and efficient flow of essential information.

<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/transformed_automation.gif' alt="event_bridge">

We navigate to the location where the files we will be using are stored

`"/DE_Pipeline/CloudWatchEvents/transform_load_data/"`

Next, we will create create the rule on EventBridge using AWS CLI
```terminal
  chmod +x create_ruleLT.sh
  ./create_ruleLT.sh
```
We will add the rule to AWS Lambda using AWS CLI

```terminal
  chmod +x add_rule_lambdaLT.sh
  ./add_rule_lambdaLT.sh
```
Finally, we will test the rule during 3 minutes using AWS CLI
```terminal
  chmod +x diable_ruleLT.sh
  ./disable_ruleLT.sh
```


## Contribution
  1. Focus changes on specific improvements.
  2. Follow project's coding style.
  3. Provide detailed descriptions in pull requests.
## Reporting Issues
  Use "Issues" to report bugs or suggest improvements.
# Contact
For questions or contact, my [Mail](diegovillatormx@gmail.com) or [Twitter](https://twitter.com/diegovillatomx) .
