#%%
import pandas as pd
import numpy as np 
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import StandardScaler
#%%
#reading the csv file
testParam = pd.read_csv("./TestParam.csv")
# %%
testParam
# %%
testParam.describe
# %%
#plotting the graph
sns.countplot(testParam['label'])
# %%
y=testParam['label']
# %%
X=testParam.drop('label',axis=1)
# %%
X
# %%
X.isna().sum()
# %%
y.isna().sum()
# %%
X.dtypes
# %%
X_train, X_test, y_train, y_test = train_test_split(X,y, random_state=42, stratify=y)
# %%
scaler = StandardScaler()
# %%
X_train = scaler.fit_transform(X_train)
# %%
X_test = scaler.transform(X_test)
# %%
from sklearn.ensemble import RandomForestClassifier
model = RandomForestClassifier()
# %%
model.fit(X_train, y_train)
# %%
model.score(X_test,y_test)
# %%

# %%
