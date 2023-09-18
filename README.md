# Spotify End-to-End Data Pipeline

The ETL pipeline for Spotify is not merely a technical process; it is the lifeblood of this data-driven music streaming giant. Its ability to transform raw data into actionable insights, paired with its analytical applications, is instrumental in shaping Spotify's strategic direction, ensuring a seamless user experience, and maintaining its competitive edge in a dynamic industry landscape.

This project aims to securely manage, optimize, and analyze structured and semi-structured music data on Spotify, taking into account factors like music genres and trending metrics. Crafting the strategy with the understanding that the ETL pipeline for Spotify is more than just a technical procedure; it is the beating heart of a data-driven music streaming behemoth. Its capacity to metamorphose raw data into actionable insights, along with its analytical applications, plays a pivotal role in influencing Spotify's strategic trajectory. It guarantees a smooth user experience and fortifies its competitive position in an ever-evolving industry landscape.

## Table of Contents

- [Description](#description)
- [Architecture](#architecture)
- [Features](#features)
- [Modular_Code_Overview](#modular_code_overview)
- [Installation](#installation)
- [Usage](#usage) 
- [Contributing](#contributing)
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
- Pip: The Python package manager. In most cases, it comes pre-installed with Python. If not, you can install it by following [this guide](https://pip.pypa.io/en/stable/installing/).
- AWS CLI: you can download it from [AWSCLI.com](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

## Usage
```terminal
  import pickle
  from ML_Pipeline.utils import read_data,inspection,null_values
  from ML_Pipeline.ml_model import prepare_model_smote,run_model
  from ML_Pipeline.evaluate_metrics import confusion_matrix,roc_curve
  from ML_Pipeline.feature_imp import plot_feature_importances
  from ML_Pipeline.plot_model import plot_model
  import matplotlib.pyplot as plt
```
<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/iam_user.gif' alt="iam_user">

## Contribution Guidelines
  1. Focus changes on specific improvements.
  2. Follow project's coding style.
  3. Provide detailed descriptions in pull requests.
## Reporting Issues
  Use "Issues" to report bugs or suggest improvements.
# Contact
For questions or contact, my [Mail](diegovillatormx@gmail.com) or [Twitter](https://twitter.com/diegovillatomx) .
