# Spotify End-to-End Data Pipeline

In the modern music industry, the competition for listeners' attention and engagement has reached unprecedented levels. In this context, the ETL (Extract, Transform, Load) pipeline designed for Spotify emerges as  an indispensable asset, serving as the backbone for data-driven decision-making, strategic insights, and the optimization of user experiences. 

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

the ETL pipeline for Spotify is not merely a technical process; it is the lifeblood of a data-driven music streaming giant. Its ability to transform raw data into actionable insights, paired with its analytical applications, is instrumental in shaping Spotify's strategic direction, ensuring a seamless user experience, and maintaining its competitive edge in a dynamic industry landscape.

## Architecture
<img src='https://github.com/diegovillatoromx/ETL-Pipeline-Spotify/blob/main/architecture_diagram_spotify.gif' alt="architecture_diagram_spotify">

## Data Description

## Modular_Code_Overview

```
  input
    |_data_regression.csv

  ML_pipeline
    |_evaluate_metrics.py
    |_lime.py
    |_ml_model.py
    |_utils.py

  Tutorial
    |_decision_tree.ipynb

  output
    |_LIME_reports folder
    |_models folder
    |_ROC_curves folder
```
## Installation

Below are the steps required to set up the environment and run this Data Science project on your local machine. Make sure you have the following installed:
- Python 3.x: You can download it from [python.org](https://www.python.org/downloads/).
- Pip: The Python package manager. In most cases, it comes pre-installed with Python. If not, you can install it by following [this guide](https://pip.pypa.io/en/stable/installing/).

### Prerequisites

Install required packages using the requirements.txt file:
``` bash
pip install -r requirements.txt
```
### Installation Steps

1. **Clone the Repository:**

   Clone this repository to your local machine using Git:

   ```bash
   git clone https://github.com/diegovillatoromx/Customer_Churn_Prediction_Model
   cd yourproject
   ```
## Usage

## Contribution Guidelines
  1. Focus changes on specific improvements.
  2. Follow project's coding style.
  3. Provide detailed descriptions in pull requests.
## Reporting Issues
  Use "Issues" to report bugs or suggest improvements.
# Contact
For questions or contact, my [Mail](diegovillatormx@gmail.com) or [Twitter](https://twitter.com/diegovillatomx) .
