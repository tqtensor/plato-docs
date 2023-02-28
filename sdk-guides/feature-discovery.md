# Feature Discovery

Feature discovery is identifying relevant features from data that can be used in machine learning models. In a feature store, feature discovery refers to identifying and extracting features from raw data that can be stored and reused for multiple machine-learning models. This helps to increase the efficiency and accuracy of models by reusing pre-computed features and reducing the need to recompute features for every new model.

TLDR: check out the tutorial [notebook](https://glab.mservice.io/ml-platform/plato-sdk/-/blob/master/docs/tutorials/tut-1-feature-discovery.ipynb)

## Prerequisites

### Step 1: Install Plato SDK

Install the PLATO SDK via pip:

> In this tutorial, we focus on a local usage. For a more in-depth guide on how to use Plato with scale, we will add some documentation afterwards.

```bash
pip install git+ssh://git@gitlab.mservice.com.vn/ml-platform/plato-sdk@v0.2.0
```

### Step 2: Initialize Feature Platform object

```python
from plato.feature_platform import FeaturePlatform

fp = FeaturePlatform()
```

## Use cases

### 1. Browsing Features in Feature Store

#### List down all feature groups

```python
fp.list_feature_groups()
# expected to return as below
# ['user_promo_redeemed_90D_dow_stats',
#  'user_promo_redeemed_90D_hour_stats',
#  'user_glob_tx_6Ms',
#  'user_balance_last_7Ds',
#  'user_interaction_30Ds',
#  'usr_tx_7D_wom_stats',
#  'user_glob_tx_90Ds',
#  'user_balance_60Ds',
#  'user_promo_redeemed_90D_wom_stats',
#  'user_event_1D',
#  'user_promo_redeemed_30D_wom_stats',
#  'user_promo_redeemed_1D_hour_stats',
#  ...
# ]
```

### 2. Describe a Feature Group

```python
fp.describe_feature_group('user_interaction_30Ds')
```

This function returns a dict object contains what you need to know about a feature group.

```
{'name': 'user_interaction_30Ds',
 'created_at': datetime.datetime(2023, 1, 6, 4, 28, 19, 896186),
 'last_update': datetime.datetime(2023, 1, 6, 4, 28, 19, 896186),
 'owner': 'hai.nguyen12@mservice.com.vn',
 'description': '',
 'schema': {'entities': ['user'],
  'features': [TOTAL_SUM_INTERACTION-Int64,
   TOTAL_COUNT_DISTINCT_USE_DATE-Int64,
   TOTAL_COUNT_DISTINCT_USE_HOUR-Int64,
   TOTAL_COUNT_DISTINCT_EVENT_NAME-Int64,
   DEVICE_COUNT_DISTINCT_MOBILE_BRAND_NAME-Int64,
   DEVICE_COUNT_DISTINCT_OPERATING_SYSTEM-Int64,
   DEVICE_COUNT_DISTINCT_APP_INSTALL_SOURCE-Int64]}}
```
