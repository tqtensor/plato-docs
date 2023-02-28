# Feature Store

A feature store is a centralized repository for storing, managing and sharing features used in machine learning models. Features are input variables or characteristics used to train machine learning models, and a feature store makes it easier to manage these variables and improve the data quality.

It provides a centralized location for storing, transforming, and sharing features, enabling data scientists to collaborate and reuse features more effectively. A feature store can help organizations build better models and deploy them faster by improving the quality and consistency of features.

## Offline Feature Store

The offline feature store holds all historical values of features to be used for training or batch inference. PLATO plugs directly into the BigQuery data warehouse for offline storage.

## Online feature store

The Online Feature Store is a low-latency key-value store with the latest pre-computed feature values. It is located in an online environment and is used to look up features for online inference.
