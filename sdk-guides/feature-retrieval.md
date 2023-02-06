# Feature Retrieval

In this tutorial, we will introduce to you some common use cases of browsing and retrieving features from the feature store with Plato SDK by covering:

1. Initialize the FP instance
2. List all existing features.
3. Get schema of a particular feature group.
4. Search feature with regex-based query
5. Get historical features by timestamp


## Overview

TLDR: see [Tutorial Notebook](https://glab.mservice.io/ml-platform/plato-sdk/-/blob/master/docs/tutorials/tut-2-feature-retrieval.ipynb)

### Use cases

- Discover existing features and their schemas
- Retrieve (and combine with your data) and export selected features to a destination BQ table. The produced data should be ready for later transformation steps.
- We will not cover extra transformation procedures in this version, good things awaiting us. ;)


## Step 1: Install Plato SDK

Install the PLATO SDK via pip:

> In this tutorial, we focus on a local usage. For a more in-depth guide on how to use Plato with scale, we will add some documentation afterwards.

```bash
pip install git+ssh://git@gitlab.mservice.com.vn/ml-platform/plato-sdk@v0.2.0
```


## Step 2: Initialize FeaturePlatform instance

```python
from plato.feature_platform import FeaturePlatform

fp = FeaturePlatform()
```

## Step 3: Prepare your custom data + labels

In order to combine your own data + labels, you have to follow the below schema

| AGENT_ID (integer)      | event_timestamp (timestamp) | others...     |
| :---        |    :----:   |          ---: |
| 1      | 2022-11-17 00:00:00 UTC       | some value here   |
| 2   | 2022-11-17 00:00:00 UTC        | more value there      |


## Step 4: Conduct retrieval

Assume that your data is produced by below SQL and you want to combine it with features in feature store and write the result to table named `YourNewTable`

``` SQL
SELECT *
FROM `project-5400504384186300846.feature_platform.TEMP_ENTITIES_WITH_LABELS`
```

and you want to combine it with features in feature store and write the result to table named `YourTableName`

``` python
# Define your data as SQL query
entities = "project-5400504384186300846.feature_platform.TEMP_ENTITIES_WITH_LABELS`"

fp.extract_historical_features_to_dw(entity_table=entities, features=selected_features)
```
