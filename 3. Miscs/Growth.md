# Guides for Growth team

## Using GrowthFeatureExtractOperator

``` python
GrowthFeaturesExtractOperator(
    task_id="<task_id>",
    entities_table="<YOUR_ENTITIES_TABLE>",
    destination_table="<YOUR_DESTINATION_TABLE>",
)
```

Examples:
- DAG: [link](https://airflow-vnc.mservice.io/dags/ai_ml_platform_example_combine_feature/grid)
- Entities table: `project-5400504384186300846.feature_platform.thang_entities_dec19`
- Destination table: `project-5400504384186300846.feature_platform.GROWTH_ALL_FEATS`


Please prepare your entities table schema following the below schema:

| AGENT_ID (int) | event_timestamp (datetime) | ... |
| :--- |:----:| ---: |
