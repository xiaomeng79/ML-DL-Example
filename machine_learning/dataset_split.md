## 数据分割

- 使用sklearn.train_test_split分割数据
```  
# test_size:测试数据比例
# random_state:随机因子
# shuffle:数据是否打乱
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42)
```