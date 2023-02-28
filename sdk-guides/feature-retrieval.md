# Feature Retrieval

In this tutorial, we will introduce to you some everyday use cases of browsing and retrieving features from the feature store with Plato SDK by covering the following:

1. Initialize the FP instance
2. List all existing features.
3. Get the schema of a particular feature group.
4. Search feature with regex-based query
5. Get historical features by timestamp

## Overview

TLDR: See [Tutorial Notebook](https://glab.mservice.io/ml-platform/plato-sdk/-/blob/master/docs/tutorials/tut-2-feature-retrieval.ipynb)

### Use cases

* Discover existing features and their schemas
* Retrieve (and combine with your data) and export selected features to a destination BQ table. The produced data should be ready for later transformation steps.
* We will not cover extra transformation procedures in this version; good things await us. ;)

## Step 1: Install Plato SDK

Install the PLATO SDK via pip:

> In this tutorial, we focus on a local usage. For a more in-depth guide on how to use Plato with scale, we will add some documentation afterwards.

```bash
pip install git+ssh://git@gitlab.mservice.com.vn/ml-platform/plato-sdk@v0.2.0
```

## Step 2: Initialize FeaturePlatform object

```python
from plato.feature_platform import FeaturePlatform

fp = FeaturePlatform()
```

## Step 3: Prepare your custom data + labels

To combine your own data + labels, you have to follow the below schema.

| AGENT\_ID (integer) | event\_timestamp (timestamp) |        others... |
| ------------------- | :--------------------------: | ---------------: |
| 1                   |    2022-11-17 00:00:00 UTC   |  some value here |
| 2                   |    2022-11-17 00:00:00 UTC   | more value there |

## Step 4: Conduct retrieval

Please assume that the below SQL produces your data, and you want to combine it with features in the feature store and write the result to a table named. `YourNewTable`

```
SELECT *
FROM `project-5400504384186300846.feature_platform.TEMP_ENTITIES_WITH_LABELS`
```

and you want to combine it with features in the feature store and write the result to the table named `YourTableName`

```python
# Define your data as SQL query
entities = "project-5400504384186300846.feature_platform.TEMP_ENTITIES_WITH_LABELS`"

fp.extract_historical_features_to_dw(entity_table=entities, features=selected_features)
```
