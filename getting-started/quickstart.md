# Quickstart

## Prerequisites

- Log in to gitlab with your GSuite account.
- Get your environment authenticated with your user account using gcloud.
- Your environment must have access to Momo's internal network when install the package. Onces the SDK installed, you can freely work with public network.
- If you get any errors while installing or using the SDK, please contact `hai.nguyen12`.

## Step 1. Installation

```bash
pip install git+ssh://git@gitlab.mservice.com.vn/ml-platform/plato-sdk@v0.2.0
```

## Step 2. Select features for your project.

### Initialize Feature Platform object

```python
from plato.feature_platform import FeaturePlatform

fp = FeaturePlatform()
```

### Discover existing feature groups

``` python
fp.list_feature_groups()
```

expected to return as below
``` python
['user_promo_redeemed_90D_dow_stats',
 'user_promo_redeemed_90D_hour_stats',
 'user_glob_tx_6Ms',
 'user_balance_last_7Ds',
 'user_interaction_30Ds',
 'usr_tx_7D_wom_stats',
 'user_glob_tx_90Ds',
 'user_balance_60Ds',
 'user_promo_redeemed_90D_wom_stats',
 'user_event_1D',
 'user_promo_redeemed_30D_wom_stats',
 'user_promo_redeemed_1D_hour_stats',
 ...
]
```

(Optional) To see more details of a specific feature group

``` python
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

### Register selected features as a feature service

Create your own feature service for later use, you can also re-use others' feature service without re-declaring all over again.

``` python

selected_groups = [
    'user_balance_last_7Ds',
    'user_interaction_30Ds',
    'usr_tx_7D_wom_stats',
    'user_glob_tx_90Ds',
    'user_balance_60Ds',
    'user_promo_redeemed_90D_wom_stats',
]

fp.register_feature_set(
    name='<YOUR_FEATURE_SERVICE>',
    feature_groups=selected_groups,
    owner='<YOUR_MSERVICE_MAIL>',  # --> required
)
```

## Step 3. Start consuming features

### During modeling

``` python
dest_table = fp.extract_historical_features_to_dw(
    entity_table='<YOUR_ENTITIES_TABLE>',
    feature_set='<YOUR_FEATURE_SERVICE>',
    destination_table='<YOUR_DESTINATION_TABLE>',
)
```

### From your Airflow pipelines.
In your DAG, import `PlatoFeatureRetrievalOperator`:

``` python
from ai_ml_platform.plugins.operators.plato.feature_platform_operators import (
    PlatoFeatureRetrievalOperator,
)
```

And put it into your pipeline:

``` python
PlatoFeatureRetrievalOperator(
    task_id="<task_id>",
    entity_table="<YOUR_ENTITIES_TABLE>",
    destination_table="<YOUR_DESTINATION_TABLE>",   # BQ table to persist extracted features for later processing steps.
)
```

Check out full example at: [TBD]
