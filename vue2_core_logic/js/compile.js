compile/**
 * 编译模板类
 * @param {String} el DOM选择器  
 * @param {Object} vm 模板实例对象
 */
function Compile(el, vm) {
    /* 实例赋值 */
    this.vm = vm;
    /* 获取编译模板html */
    this.el = document.querySelector(el);
    /* 定义html片段变量 */
    this.fragment = null;
    /* 初始化编译 */
    this.init();
}
/* 指定编译模板类原型对象 */
Compile.prototype = {
    /* 初始户编译模板方法 */
    init: function () {
        /* 判断是否获取到html模板 */
        if (this.el) {
            /* 获取el所有后代节点的html片段集合 */
            this.fragment = this.nodeToFragment(this.el);
            /* 解析DOM节点 */
            this.compileElement(this.fragment);
            /* 将解析后的DOM节点重新插入到模板受控根节点下 */
            this.el.appendChild(this.fragment);
        } else {
            /* 未找到受控节点时提示 */
            console.log('Dom元素不存在');
        }
    },
    /* 循环遍历html子节点，追加到html片段对象中 */
    nodeToFragment: function (el) {
        /* 创建html片段对象 */
        var fragment = document.createDocumentFragment();
        /* 获取当前节点的子节点 */
        var child = el.firstChild;
        /* 循环遍历，如果子节点存在将子节点追加到html片段对象中 */
        while (child) {
            /* 将Dom元素移入fragment中 */
            /* 使用appendChid方法将原DOM树中的节点添加到DocumentFragment中时，会删除原DOM树上的节点!!! */
            fragment.appendChild(child);
            /* 获取子节点并赋值给child变量 */
            child = el.firstChild
        }
        /* 返回整个html片段对象 */
        return fragment;
    },
    /* 解析DOM节点 */
    compileElement: function (el) {
        /* 获取所有子节点 */
        var childNodes = el.childNodes;
        /* 为当前实例设置代理变量self */
        var self = this;
        /* 循环DOM实例进行指令解析 */
        [].slice.call(childNodes).forEach(function(node) {
            /* 插值表达式正则 */
            var reg = /\{\{(.*)\}\}/;
            /* 获取节点文本内容 */
            var text = node.textContent;
            /* 判断是否为元素节点 */
            if (self.isElementNode(node)) {  
                /* 模板指令解析，事件、数据绑定 */
                self.compile(node);
                /* 判断是否为文本节点和带有插值表达式 */
            } else if (self.isTextNode(node) && reg.test(text)) {
                /* 解析插值表达式，绑定数据显示文本 */
                self.compileText(node, reg.exec(text)[1]);
            }
            /* 判断当前节点是否还存在子节点 */
            if (node.childNodes && node.childNodes.length) {
                /* 如果存在递归调用解析DOM节点方法 */
                self.compileElement(node);
            }
        });
    },
    /* 元素节点编译 */
    compile: function(node) {
        /* 获取元素的所有属性(获取伪数组) */
        var nodeAttrs = node.attributes;
        /* 为当前实例设置代理变量self */
        var self = this;
        /* 使用call方法调用数组原型forEach方法，调用对象为nodeAttrs */
        Array.prototype.forEach.call(nodeAttrs, function(attr) {
            /* 获取当前属性名称 */
            var attrName = attr.name;
            /* 判断是否为模板指令 */
            if (self.isDirective(attrName)) {
                /* 获取属性值 */
                var exp = attr.value;
                /* 提取指令名称 v-on v-前缀*/
                var dir = attrName.substring(2);
                /* 判断是否为事件指令 */
                if (self.isEventDirective(dir)) {
                    /* 绑定事件 */
                    self.compileEvent(node, self.vm, exp, dir);
                } else {
                    /* 输入控件实现数据绑定 */
                    self.compileModel(node, self.vm, exp, dir);
                }
                /* 将模板指令移除 */
                node.removeAttribute(attrName);
            }
        });
    },
    /**
     * 节点文本绑定更新
     * @param {Object} node DOM元素
     * @param {String} exp 属性名
     */
    compileText: function(node, exp) {
        /* 为当前实例设置代理变量self */
        var self = this;
        /* 获取绑定的文本值 */
        var initText = this.vm[exp];
        /* 更新元素文本内容 */
        this.updateText(node, initText);
        /* 根据属性添加监听器 */
        new Watcher(this.vm, exp, function (value) {
            /* 调用方法更新节点内容 */
            self.updateText(node, value);
        });
    },
    /**
     * 事件绑定方法
     * @param {Object} node DOM对象
     * @param {Object} vm 模板实例对象
     * @param {String} exp 指令属性值
     * @param {String} dir 指令类型
     */
    compileEvent: function (node, vm, exp, dir) {
        /* 截取事件类型 */
        var eventType = dir.split(':')[1];
        /* 获取事件注册函数 */
        var cb = vm.methods && vm.methods[exp];
        /* 判断是否获取到事件和事件函数 */
        if (eventType && cb) {
            /* 向元素添加监听属性，事件函数绑定对象为模板实例，设置冒泡阶段执行 */
            node.addEventListener(eventType, cb.bind(vm), false);
        }
    },
    /**
     * 绑定v-model
     * @param {Object} node DOM对象
     * @param {Object} vm 模板实例对象
     * @param {String} exp 指令属性值
     * @param {String} dir 指令类型 
     */
    compileModel: function (node, vm, exp, dir) {
        /* 为当前实例设置代理变量self */
        var self = this;
        /* 获取绑定的元数据值 */
        var val = vm[exp];
        /* 更新输入控件值 */
        this.modelUpdater(node, val);
        /* 根据属性添加监听器 */
        new Watcher(this.vm, exp, function (value) {
            /* 更新输入控件值 */
            self.modelUpdater(node, value);
        });
        /* 向输入控件添加input事件 */
        node.addEventListener('input', function(e) {
            /* 获取当前输入控件值 */
            var newValue = e.target.value;
            /* 优化赋值，如果当前值等于实际值则不更新元数据 */
            if (val === newValue) {
                /* 返回当前操作 */
                return;
            }
            /* 更新元数据 */
            self.vm[exp] = newValue;
        });
    },
    /* 向节点写入内容 */
    updateText: function (node, value) {
        /* 原生赋值，如果为undefined赋值为空，否则赋值为真实值 */
        node.textContent = typeof value == 'undefined' ? '' : value;
    },
    /* 向输入控件写值 */
    modelUpdater: function(node, value, oldValue) {
        /* 原生赋值，如果为undefined赋值为空，否则赋值为真实值 */
        node.value = typeof value == 'undefined' ? '' : value;
    },
    /* 是否为模板指令 */
    isDirective: function(attr) {
        /* 判断属性是否带有v-前缀 */
        return attr.indexOf('v-') == 0;
    },
    /* 是否为事件指令 */
    isEventDirective: function(dir) {
        /* 判断指令是带有on: */
        return dir.indexOf('on:') === 0;
    },
    /* 是否为元素节点 */
    isElementNode: function (node) {
        /* 判断元素节点类型是否为1 */
        return node.nodeType == 1;
    },
    /* 是否为文本节点 */
    isTextNode: function(node) {
        /* 判断元素节点类型是否为3 */
        return node.nodeType == 3;
    }
}
