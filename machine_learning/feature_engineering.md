## 特征工程
相关系数、卡方检验、平均互信息、条件熵、后验概率、逻辑回归权重


#### 相关系数

``` 
# 相关系数分析
corrmat = train_data.corr()
f,ax = plt.subplots(figsize=(12,9))
sns.heatmap(corrmat,square=True,vmax=.8)
# 选取10个最相关的特征
k = 10
cols = corrmat.nlargest(k,'SalePrice')['SalePrice'].index
print(cols)
cm = np.corrcoef(train_data[cols].values.T)
hm = sns.heatmap(cm,cbar=True,annot=True,square=True,fmt='.2f',annot_kws={'size':10},yticklabels=cols.values,xticklabels=cols.values)

```

#### 离散值变分类特征
pandas.cut:等距的bins，但是每个bin中的采样频率不相等
pandas.qcut:创建不等大小的bins，但是每个bin中的采样频率均相等
```  
 >>> x=np.array([24,  7,  2, 25, 22, 29])
    >>> x
    array([24,  7,  2, 25, 22, 29])

    >>> pd.cut(x,3).value_counts() #Bins size has equal interval of 9
    (2, 11.0]        2
    (11.0, 20.0]     0
    (20.0, 29.0]     4

    >>> pd.qcut(x,3).value_counts() #Equal frequecy of 2 in each bins
    (1.999, 17.0]     2
    (17.0, 24.333]    2
    (24.333, 29.0]    2
```