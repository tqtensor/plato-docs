# Guides for Growth team

## Using GrowthFeatureExtractOperator

```python
from ai_ml_platform.plugins.operators.plato.feature_platform_operators import (
    GrowthFeaturesExtractOperator,
)

GrowthFeaturesExtractOperator(
    task_id="<task_id>",
    entities_table="<YOUR_ENTITIES_TABLE>",
    destination_table="<YOUR_DESTINATION_TABLE>",
)
```

Examples:

* DAG: [link](https://airflow-vnc.mservice.io/dags/ai\_ml\_platform\_example\_combine\_feature/grid)
* Entities table: `project-5400504384186300846.feature_platform.thang_entities_dec19`
* Destination table: `project-5400504384186300846.feature_platform.GROWTH_ALL_FEATS`

Please prepare your entities table schema following the below schema:

\| AGENT\_ID (int) | event\_timestamp (datetime) | ... |
