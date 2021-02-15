/**
 * 监听者
 * @param {Object} vm 模板实例对象
 * @param {String} exp 属性名
 * @param {Function} cb 回调函数
 */
function Watcher(vm, exp, cb) {
    /* 回调函数 */
    this.cb = cb;
    /* 模板实例对象 */
    this.vm = vm;
    /* 属性名 */
    this.exp = exp;
    /* 获取当前值，并将属性监听实例追加到订阅集合 */
    this.value = this.get();
}
/* 指定监听器原型对象 */
Watcher.prototype = {
    /* 更新方法代理方法 */
    update: function() {
        /* 调用更新方法 */
        this.run();
    },
    /* 更新方法 */
    run: function() {
        /* 获取模板元数据属性值 */
        var value = this.vm.data[this.exp];
        /* 获取旧的属性值 */
        var oldVal = this.value;
        /* 判断新旧值是否相等 */
        if (value !== oldVal) {
            /* 进行赋值 */
            this.value = value;
            /* 通过call调用回调方法，方法内this指向模板实例，传入新值和旧值 */
            this.cb.call(this.vm, value, oldVal);
        }
    },
    /* 将监听实例追加到订阅集合中 */
    get: function() {
        /* 将监听器实例缓存到数据执行类原型变量 */
        Dep.target = this;
        /* 获取值，触发属性的getter方法，将监听器实例追加到订阅集合中 */
        var value = this.vm.data[this.exp];
        /* 释放数据执行类原型变量 */
        Dep.target = null;
        /* 返回获取的当前元数据属性值 */
        return value;
    }
};
