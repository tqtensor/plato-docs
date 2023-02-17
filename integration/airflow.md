# Airflow

## In general:

1. Prepare an entity table (which contains entities to extract features in a specific time)
2. Import and attach operator into your DAG

## Step 1: Make sure entity input follow

Please prepare your entities table schema following the below schema:

`| AGENT_ID (int) | event_timestamp (timestamp)`

## Step 2: Implement your DAG

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
    feature_set="<YOUR_TEAM_FEATURE_SET>,
    destination="<YOUR_DESTINATION_TABLE>",   # BQ table to persist extracted features for later processing steps.
)
```

## Examples:

* DAG: [link](https://airflow-vnc.mservice.io/dags/ai\_ml\_platform\_example\_combine\_feature/grid)
* Entity table: `project-5400504384186300846.feature_platform.thang_entities_dec19`
* Destination table: `project-5400504384186300846.feature_platform.GROWTH_ALL_FEATS`
