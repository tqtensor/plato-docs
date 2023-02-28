# Feature Definition

A feature is a measurable property of the object you're trying to analyze, and it consists of four main components below to be fully defined.

1. Entity: the object that has the property that we consider, such as the Entity that could be `user` and the desirable property to be measured is `balance` (amount of money in their wallet).
2. Cut-off Point (CP): where do we measure and compute the property in the timeline of that object, such as `at 2023-01-01 00:00:00 UTC`.
3. Time Dimension: the dimension in the timeline of that object, which has the start and end points and directions to travel in time. For example, `last 7 days = (CP - 7 days -> CP)`, `ytd = (01/01/yearOfCP -> CP)`.
4. Aggregated Measurement: the computed result from the measured values of that property.
   1. Measured Values: the measured value of each instance of that property; therefore, the measured value must come with a timestamp where the Measurement is taken.
   2. Aggregation Method: the computation method to be applied to valid measured values based on the CP and Time Dimension combination.

<figure><img src="../../.gitbook/assets/feature_definition.png" alt=""><figcaption><p>Atomic View of a Feature</p></figcaption></figure>

A real-world example.

<figure><img src="../../.gitbook/assets/feature_example.png" alt=""><figcaption></figcaption></figure>
