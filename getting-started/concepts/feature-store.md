# Feature Store

A feature store is a centralized repository for storing, managing, and sharing features used in machine learning models. Features are input variables or characteristics used to train machine learning models, and a feature store makes it easier to manage these variables and improve the quality of the data.

It provides a centralized location for storing, transforming, and sharing features, enabling data scientists to collaborate and reuse features more effectively. By improving the quality and consistency of features, a feature store can help organizations build better models and deploy them faster.

## Offline feature store

The Offline Feature Store holds all historical values of features to be used for training or batch inference. PLATO plugs directly into BigQuery data warehouse to use as the offline store.

## Online feature store

The Online Feature Store is a low-latency key-value store that holds the latest values of pre-computed features. It is located in the online environment and is used to look up features for online inference.
