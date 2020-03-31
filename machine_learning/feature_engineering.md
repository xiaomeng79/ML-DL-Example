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