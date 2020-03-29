## 数据获取

#### 从csv文件获取
``` 
# 从csv文件导入
import pandas as pd

# encoding:编码
# iterator:当数据量大的时候,设置为True,通过get_chunk选取任意行
train_data = pd.read_csv('../data/titanic/train.csv',encoding='utf-8',iterator=True)
train_data.get_chunk(200).shape

```