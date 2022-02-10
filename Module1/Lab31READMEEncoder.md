|Method| Library| Code| Result|
|----------|--------|---------|--------|
|Dummy Encoder|import pandas as pd|```dummy_profession = pd.get_dummies(namedataframe['namecolumn']) print(dummy_profession)```|get_dummies() returns a dataframe with the column passed in returned as dummy variables. Compares each level to the reference level, intercept being the cell mean of the reference group|
|----------|--------|---------|--------|
|Label Encoder|from sklearn import preprocessing|```# label_encoder object knows how to understand word labels. label_encoder=preprocessing.LabelEncoder()  # Encode labels in column 'Risk'   df['Risk']=label_encoder.fit_transform(df['Risk'])  y=df['Risk']```|Encode target values, i.e. y, and not the input X. (hierarchise/code the values colum alone)|
|----------|--------|---------|--------|
|Backward Difference Coding|import category_encoders as ce|```encoder = ce.BackwardDifferenceEncoder()  encoder.fit(nameofdataframe['namecolumn'], y=None)  X_cleaned=encoder.transform(nameofdataframe['namecolumn'])```| the mean of the dependent variable for a level is compared with the mean of the dependent variable for the prior level. This type of coding may be useful for a nominal or an ordinal variable|
|----------|--------|---------|--------|
|BaseN|import category_encoders as ce|```encoder=ce.BaseNEncoder()  encoder.fit(df['namecol'], y=None)  X_cleaned=encoder.transform(df['namecol']) ```|Base-N encoder encodes the categories into arrays of their base-N representation. A base of 1 is equivalent to one-hot encoding (not really base-1, but useful), a base of 2 is equivalent to binary encoding. N=number of actual categories is equivalent to vanilla ordinal encoding.|
|----------|--------|---------|--------|
|Binary|import category_encoders as ce|```encoder = ce.BinaryEncoder()  encoder.fit(df['col'], y=None)  X_cleaned=encoder.transform(df['col'])```|Binary encoding for categorical variables, similar to onehot, but stores categories as binary bitstrings.|
|----------|--------|---------|--------|
|CatBoost Encoder|import category_encoders as ce|```encoder = ce.CatBoostEncoder() encoder.fit(df['col1'], df['Col2']) X_cleaned=encoder.transform(df['Col1'])```| This is very similar to leave-one-out encoding, but calculates the values “on-the-fly”. Consequently, the values naturally vary during the training phase and it is not necessary to add random noise. Beware, the training data have to be randomly permutated.| 
|----------|--------|---------|--------|
|Count Encoder|import category_encoders as ce| ```encoder = ce.CountEncoder()  encoder.fit(df['COL'], y=None)  X_cleaned=encoder.transform(df['COL'])```|For a given categorical feature, replace the names of the groups with the group counts.|
|----------|--------|---------|--------|
|Generalized Linear Mixed Model Encoder|import category_encoders as ce|```encoder = ce.GLMMEncoder()  encoder.fit(df['col'], y=None)  X_cleaned=encoder.transform(df['col'])```|This is a supervised encoder similar to TargetEncoder or MEstimateEncoder,|
|----------|--------|---------|--------|
|Hashing|import category_encoders as ce|```encoder = ce.HashingEncoder()  encoder.fit(df['col'], y=None)  X_cleaned=encoder.transform(df['col']) ```|The advantage of this encoder is that it does not maintain a dictionary of observed categories. Default value of ‘max_process’ is 1 |
|----------|--------|---------|--------|
|Helmert Coding|import category_encoders as ce|```encoder = ce.HelmertEncoder()  encoder.fit(df['col'], y=None)  X_cleaned=encoder.transform(df['col'])```|Compare levels of a variable with the mean of the subsequent levels of the variable|
|----------|--------|---------|--------|
|James-Stein Encoder|import category_encoders as ce|```encoder = ce.JamesSteinEncoder()  encoder.fit(df['col1'], df['col2'])  X_cleaned=encoder.transform(df['col1'])```|For feature value i, James-Stein estimator returns a weighted average of: The mean target value for the observed feature value i. The mean target value (regardless of the feature value)|
|----------|--------|---------|--------|
|Leave One Out|import category_encoders as ce|```encoder = ce.LeaveOneOutEncoder()  encoder.fit(df['col1'], df['col2'])  X_cleaned=encoder.transform(df['col1'])```|This is very similar to target encoding but excludes the current row’s target when calculating the mean target for a level to reduce the effect of outliers.|
|----------|--------|---------|--------|
|M-estimate|import category_encoders as ce|```encoder = ce.MEstimateEncoder()  encoder.fit(df['col1'], df['col2'])   X_cleaned=encoder.transform(df['col1'])```|This is a simplified version of target encoder, which goes under names like m-probability estimate or additive smoothing with known incidence rates. In comparison to target encoder, m-probability estimate has only one tunable parameter (m), while target encoder has two tunable parameters|
|----------|--------|---------|--------|
|One Hot|import category_encoders as ce|```encoder = ce.OneHotEncoder()  encoder.fit(df['COL'], y=None)   X_cleaned=encoder.transform(df['COL'])```|Onehot (or dummy) coding for categorical features, produces one feature per category, each binary. |
|----------|--------|---------|--------|
|Ordinal|import category_encoders as ce|```encoder = ce.OrdinalEncoder()  encoder.fit(df['col'], y=None)   X_cleaned=encoder.transform(df['col'])```|Encodes categorical features as ordinal, in one ordered feature.Ordinal encoding uses a single column of integers to represent the classes. |
|----------|--------|---------|--------|
|Polynomial Coding|import category_encoders as ce|```encoder = ce.PolynomialEncoder()  encoder.fit(df['col'], y=None)   X_cleaned=encoder.transform(df['col'])```|Polynomial contrast coding for the encoding of categorical features.|
|----------|--------|---------|--------|
|Sum Coding|import category_encoders as ce|```encoder = ce.SumEncoder()  encoder.fit(df['col'], y=None)   X_cleaned=encoder.transform(df['col'])```|Sum contrast coding for the encoding of categorical features.|
|----------|--------|---------|--------|
|target encoder|import category_encoders as ce|```encoder = ce.TargetEncoder()  encoder.fit(df['col1'], df['col2'])   X_cleaned=encoder.transform(df['col1'])```||
|----------|--------|---------|--------|
| Weight of Evidence|import category_encoders as ce |```encoder = ce.WOEEncoder()  encoder.fit(df['col'], y=None)  X_cleaned = encoder.transform(df['Profession'])```|: The weight of evidence tells the predictive power of an independent variable in relation to the dependent variable. Since it evolved from credit scoring world, it is generally described as a measure of the separation of good and bad customers. "Bad Customers" refers to the customers who defaulted on a loan. and "Good Customers" refers to the customers who paid back loan. ![formula](https://3.bp.blogspot.com/-eqZJpJZ4Kig/VPnZUBaP7II/AAAAAAAADkc/yeW8XVL35dA/s1600/weight%2Bof%2Bevidence.png)|
|----------|--------|---------|--------|
