// 去掉空格
function myTrim(val){
    let str ='';
    for(var i=0;i<val.length;i++){
        if(val[i]===' '){
            continue;
        }else{
            str+=val[i];
        }
    }
    return str;
}
// 添加/更新
function add(selector1,selector2,url,close){
    var data = {};
    var result = true;
    $(selector1).each(function(index,item){
        var val = $(item).val();
        var name = $(item).attr("name");
        if(val === ''){
            result = false;
            $(selector2).text("不能为空！").css("color","red");
            return false;
        }else if(name === 'reg' && (val[0] !== '/' || val[val.length-1] !== '/')){
            result = false;
            $(selector2).text("规则字段内容不符合！").css("color","red");
            return false;
        }else{
            data[name] = name === 'reg'?(myTrim(val)):val;
        }
    });
    if(!result) { return; }
    $(selector2).text("*").css("color","black");
    $.ajax({
        url,
        type:"POST",
        data,
        success:function(data){
            $(selector1).val('');
            close && ($(".update").css("display","none"),search());
        },
        error(){
            alert("服务未开启");
        }
    })
}
// 删除
function del(id){
    if(!confirm("是否删除当前数据？")){ return; }
    $.ajax({
        url:'http://127.0.0.1:666/del',
        type:"POST",
        data:{id},
        success:function(data){
            if(data.code){
                search();
            }else{
                alert("删除失败");
            }
        },
        error(){
            alert("删除失败");
        }
    })  
}
// 更新
function update(id,el){
    $(".update").css("display","block");
    var parameters = [];
    $(el).parent().siblings().each(function(index,item){
        index !== 0 && (parameters.push($(item).text()))
    });
    parameters.push(id);
    $(".update>div>div>input").each(function(index,item){
        $(item).val(parameters[index]);
    })
}
// 取消
function cancel(){
    $(".update").css("display","none");
    $(".update>div>div.warn").text("*").css("color","black");
}
// 确认
function ascertain(){
    add(".update>div>div>input",".update>div>div.warn","http://127.0.0.1:666/update",true) && ($(".update").css("display","none"));
}
// 搜索
function search(){
    $.ajax({
        url:'http://127.0.0.1:666/search',
        type:"POST",
        data:{str:$('.search>input').val()},
        success:function(data){
            var list = data.message;
            if(data.code && list.length>0){
                var html = '';
                var num = 0;
                for(var items of list){
                    html+=`<tr>
                        <td>${++num}</td>
                        <td>${items.label}</td>
                        <td>${items.reg}</td>
                        <td>${items.warn}</td>
                        <td>
                            <button onclick='update(${items.id},this)'>修改</button>
                            <button onclick='del(${items.id})'>删除</button>
                        </td>
                    </tr>`
                }
                $("#listData").html(html);
            }else{
                noData()
            }
        },
        error(){
            noData()
            alert("服务未开启");
        }
    }) 
}
function noData(){
    $("#listData").html(`<tr class="noChange"><td class="no-data" colspan="5">没有要查询的数据</td></tr>`);
}
$("#add").click(()=>{add(".add input",".add>li:last","http://127.0.0.1:666/add",false)});
$('.search>input').on('input',search);