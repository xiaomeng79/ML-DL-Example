## 数据预处理
归一化、离散化、因子化、缺失值处理、去除共线性

#### 缺失值处理

1. 缺失值统计
``` 
# 缺失值统计
def get_missing_data_info(data):
    """
    获取缺失值统计
     Parameters
    ----------
    data : Series or DataFrame
        要统计的数据

    Returns
    -------
    Series or DataFrame
        统计总数和占比
    """
    total = data.isnull().sum().sort_values(ascending=False)
    percent = (data.isnull().sum()/data.isnull().count()).sort_values(ascending=False)
    return pd.concat([total, percent], axis=1, keys=['Total', 'Percent'])
```

2. 缺失值删除(如大于50%)
``` 
# 删除Cabin
delete_columns = ['Cabin']
train_data.drop(delete_columns,axis=1,inplace=True)
test_data.drop(delete_columns,axis=1,inplace=True)

# 删除一行
train_data = train_data.drop(train_data.loc[train_data['Electrical'].isnull()].index)
```
3. 缺失值填充
``` 
from sklearn.impute import SimpleImputer

# 使用sklearn的impute来填充缺失值
# missing_values:缺失值
# strategy:填充策略(mean,median,most_frequent,constant)
# fill_values:当strategy=constant,填充的值
mean_columns = ['Age','Fare']
impute_mean = SimpleImputer(missing_values=np.nan,strategy="mean")
train_data[mean_columns] = impute_mean.fit_transform(train_data[mean_columns])
test_data[mean_columns] = impute_mean.transform(test_data[mean_columns])
```

#### 数据归一化和标准化
[标准化和归一化什么区别](https://www.zhihu.com/question/20467170)
- 标准化:执行一个标准(如厘米,米不同单位,都按照米),将数据缩放到均值为0,方差为1,而**不改变数据的几何距离,分布**
    - 使得不同度量之间的特征具有可比性
    - 不改变原始数据的分布
    
- 归一化:对不同特征维度的伸缩变换的目的是使各个特征维度对目标函数的影响权重是一致的
    - 提高迭代求解的收敛速度(扁平-->类圆形)
    - 会改变数据的原始距离，分布，信息
- sklearn:
    1. 缩放到均值为0，方差为1（Standardization——StandardScaler()） **常说的z-score归一化**
    2. 缩放到0和1之间（Standardization——MinMaxScaler()） **min-max归一化**
    3. 缩放到-1和1之间（Standardization——MaxAbsScaler()）
    4. 缩放到0和1之间，保留原始数据的分布（Normalization——Normalizer()）
    
#### 分类编码
1. 使用pandas实现哑编码(独热编码)
``` 
ont_hot_columns = ['Pclass','Sex','Embarked']
train_data = pd.get_dummies(train_data,columns=ont_hot_columns)
```

2. 使用sklearn.Preprocessing的Binarizer(二值化),LabelEncoder(标签化),OneHotEncoder(独热编码)


##### 独热编码和归一化
- 独热编码:
    - 用:离散数据
    - 不用:类别太多,树模型(增加树的深度)
- 归一化:
    - 用: 基于参数的模型或基于距离的模型，都是要进行特征的归一化
    - 不用: 基于树的方法是不需要进行特征的归一化，例如随机森林，bagging 和 boosting等