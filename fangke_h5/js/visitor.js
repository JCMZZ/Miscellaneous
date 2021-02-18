/*手机自适应设置*/
window.onload = window.onresize = window.onscroll = function () {
	fontSize()
	pageShow()
}

function pageShow() {
	var oBox = document.getElementsByTagName('body')[0]
	oBox.style.visibility = 'visible'
}

function fontSize() {
	document.documentElement.style.fontSize = 100 * (document.documentElement.clientWidth / 750) + 'px'
}

/* toast 提示框 */
function toast(msg, seconds) {
	msg || (msg = '提示框')
	seconds || (seconds = 3)
	$("#toast").text(msg)
	$("#toast").fadeIn(500)
	setTimeout(function () {
		$("#toast").fadeOut(500)
	}, seconds * 1000)
}
/* 到访时间 */
function nowDate() {
	var date = new Date()
	var year = date.getFullYear()
	var month = date.getMonth() + 1
	month < 10 && (month = '0' + month)
	var day = date.getDate()
	day < 10 && (day = '0' + day)
	var hour = date.getHours()
	hour < 10 && (hour = '0' + hour)
	var minute = date.getMinutes()
	minute < 10 && (minute = '0' + minute)
	var seconds = date.getSeconds()
	seconds < 10 && (seconds = '0' + seconds)
	var time = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + seconds
	$("#visit_time").val(time)
}
/* 事由事件 */
function visitReasonHandler(obj) {
	var val = $(obj).val()
	$("#formQuarters input").val('')
		.attr('require', val === '01' || val === '02')
	$("#formQuarters").css("display", val === '01' || val === '02' ? "block" : "none")
		.children("small").css("display", "none")
}
$(function () {
	nowDate()
	/* 提交按钮 */
	$("#submit").click(function (e) {
		e.preventDefault()
		var that = this
		var reqData = {
			version: 1
		}
		var data = {}
		var isSubmit = false
		var inpDoms = Array.prototype.slice.call($(".form input,.form select").not("[require=false]"))
		for (var i = 0; i < inpDoms.length; i++) {
			var dom = inpDoms[i]
			var val = $(dom).val().trim()
			var reg = $(dom).data('reg')
			var smallDom = $(dom).parent().children('small')
			if (reg && !new RegExp(reg).test(val)) {
				isSubmit = true
				smallDom.css('display', 'block')
			} else {
				smallDom.css('display', 'none')
			}
			data[$(dom).attr('name')] = val
		}
		if (isSubmit) {
			return
		}
		$(that).prop('disabled', true)
		reqData['data'] = data
		$.ajax({
			type: "POST",
			url: "",
			data: JSON.stringify(reqData),
			dataType: 'json',
			contentType: 'application/json',
			success: function (res) {
				if (res.code === '0000') {
					toast('操作成功!')
					window.localStorage.setItem('recordID', res.result.recordID)
					var officialAccounts = 'https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MjM5MjAxMjQwOA==&scene=126&bizpsid=0#wechat_redirect'
					window.location.href = $("#visit_reason").val() !== '01' ? officialAccounts : officialAccounts
				} else {
					toast('操作失败!')
					$(that).prop('disabled', false)
				}
			},
			error: function () {
				toast('操作失败!')
				$(that).prop('disabled', false)
			}
		})
	})
})