# Vue底层原理浅析
* 定义一个观察者方法Observer
* 定义一个订阅用户存储方法Dep
* 定义一个解析模板方法Compile
* 定义一个监听器方法Watcher

1. 使用观察者方法给所有元数据添加订阅者
```code
Observe -> data -> Dep -> getter -> if(Dep.target) -> add(Dep.target)
                       -> setter -> forEach(Dep.subs) -> Watcher.update
```
2. 使用Compile解析模板指令，进行数据绑定，内容赋值
```code
Compile -> forEach(Node) -> 解析指令 -> 绑定事件/内容赋值 
                         -> prop -> Watcher -> Dep.target缓存Watcher实例 -> 触发prop属性getter方法 -> if(Dep.target) -> add(Dep.target) 
                                            -> Dep.target释放缓存
```                        
3. 定义SelfVue模板类
```code
SelfVue -> Observe -> Compilev
```  