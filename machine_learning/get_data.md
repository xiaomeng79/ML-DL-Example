## 数据获取

1. 从测试数据集导入

```
from sklearn import datasets

iris = datasets.load_iris()
X,y = iris.data,iris.target
```

2. csv文件导入
- encoding:编码
- iterator:当数据量大的时候,设置为True,通过get_chunk选取任意行
```
import pandas as pd

train_data = pd.read_csv('../data/titanic/train.csv',encoding='utf-8',iterator=True)
train_data.get_chunk(200).shape
```