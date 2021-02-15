/**
 * 定义模板类
 * @param {Object} options  初始化模板参数
 */
function SelfVue (options) {
    /* 为当前实例设置代理变量self */
    var self = this;
    /* 获取模板元数据对象 */
    this.data = options.data;
    /* 获取模板时间对象 */
    this.methods = options.methods;
    /* 循环元数据对象添加访问代理 */
    Object.keys(this.data).forEach(function(key) {
        /* 调用方法给指定属性添加访问代理 */
        self.proxyKeys(key);
    });
    /* 调用观察者方法，监听元数据对象 */
    observe(this.data);
    /* 调用编译类，编译受控html模板 */
    new Compile(options.el, this);
    /* 执行mounted方法，通过call方法改变方法内this指向 */
    options.mounted.call(this);
}
/* 指定模板类原型对象 */
SelfVue.prototype = {
    /* 定义访问属性值代理方法 */
    proxyKeys: function (key) {
        /* 为当前实例设置代理变量self */
        var self = this;
        /* 通过描述属性设置代理访问 */
        Object.defineProperty(this, key, {
            /* 不可枚举 */
            enumerable: false,
            /* 描述属性 */
            configurable: true,
            /* 定义getter方法 */
            get: function getter () {
                /* self代理self的data属性 */
                return self.data[key];
            },
            /* 定义setter方法 */
            set: function setter (newVal) {
                /* self代理self的data属性 */
                self.data[key] = newVal;
            }
        });
    }
}
