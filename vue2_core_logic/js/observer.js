/**
 * 观察者
 * @param {Object} data 模板元数据对象
 */
function Observer(data) {
    /* 元数据对象初始化为观察者属性 */
    this.data = data;
    /* 执行 */
    this.walk(data);
}
/* 指定观察者原型对象 */
Observer.prototype = {
    /* 循环数据对象的所有key进行属性描述处理 */
    walk: function(data) {
        /* 为当前实例设置代理变量self */
        var self = this;
        /* data对象的所有属性 */
        Object.keys(data).forEach(function(key) {
            /* 为每个数据对象的属性设置描述符 */
            self.defineReactive(data, key, data[key]);
        });
    },
    /* 添加描述符设置监听 */
    defineReactive: function(data, key, val) {
        /* 生成数据执行类实例 */
        var dep = new Dep();
        /* 生成观察者实例 */
        observe(val);
        /* 给指定对象属性添加描述符 */
        Object.defineProperty(data, key, {
            /* 可枚举 */
            enumerable: true,
            /* 描述属性 */
            configurable: true,
            /* 定义getter方法 */
            get: function getter () {
                /* 判断数据执行类是否有监听类实例缓存 */
                if (Dep.target) {
                    /* 如果有便将监听类实例添加到订阅集合 */
                    dep.addSub(Dep.target);
                }
                /* 返回值 */
                return val;
            },
            /* 定义setter方法 */
            set: function setter (newVal) {
                /* 判断如果新值等于旧值 */
                if (newVal === val) {
                    /* 返回 */
                    return;
                }
                /* 新值赋值 */
                val = newVal;
                /* 更新订阅集合(循环调用监听实例的update方法，更新视图) */
                dep.notify();
            }
        });
    }
};
/**
 * 生成观察者实例(通过观察者类完成递归调用)
 * @param {Object} value 被观察数据对象
 * @param {Object} vm 模板实例对象
 */
function observe(value, vm) {
    /* 判断value是否为对象 */
    if (!value || typeof value !== 'object') {
        /* 不是对象则返回 */
        return;
    }
    /* 返回观察者实例 */
    return new Observer(value);
};
/* 数据执行类(Data Execution Prevention) */
function Dep () {
    /* 数据订阅集合 */
    this.subs = [];
}
/* 指定数据执行类原型对象 */
Dep.prototype = {
    /* 添加订阅方法 */
    addSub: function(sub) {
        /* 向订阅集合中添加订阅数据 */
        this.subs.push(sub);
    },
    /* 通知发布 */
    notify: function() {
        /* 循环订阅集合 */
        this.subs.forEach(function(sub) {
            /* 调用数据更新方法 */
            sub.update();
        });
    }
};
/* 缓存变量 */
Dep.target = null;
