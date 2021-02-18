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
	$("#toast").html('<div class="toast-content">' + msg + '</div>')
	$("#toast").fadeIn(500)
	setTimeout(function () {
		$("#toast").fadeOut(500)
	}, seconds * 1000)
}

/* 答题说明 */
$("#explanation").fadeIn(800)
	.on('click', '#startAnswer', function () {
		$("body").removeAttr("class")
		$("#explanation").fadeOut()
	})

/* 页码事件 */
function pageNumberHandler(isCheck) {
	if (isCheck !== true && $("#form_container input:checked").length < 10) {
		toast('当前页有未完成题目!', 1.5)
		$('#page_number').find("option[value=" + $('#page_number').data('current') + "]").prop('selected', true)
		return
	}
	$('#page_number').data('current', $('#page_number').val())
	var val = $('#page_number').val() * 10
	var currentTopic = topic.slice(val, val + 10)
	var html = currentTopic.map(function (val, index) {
		return (
			'<div class="form-item" style="background:' + (index % 2 === 0 ? '#eee' : '#fff') + ';">' +
			'<p>' + val.id + '. ' + val.content + '</p>' +
			'<div class="radio">' +
			'<input id="key1' + val.id + '" value="1" type="radio" ' + (val.checked ? 'checked' : '') + ' name="' + val.id + '" />' +
			'<label for="key1' + val.id + '">是</label>' +
			'<input id="key2' + val.id + '" type="radio" value="" ' + (val.checked === false ? 'checked' : '') + ' name="' + val.id + '" />' +
			'<label for="key2' + val.id + '">否</label>' +
			'</div>' +
			'</div>'
		)
	})
	document.body.scrollTop = document.documentElement.scrollTop = 0
	$("#form_container").html(html)
}
pageNumberHandler(true)
/**
 * 获取对应类型的权重值
 * @param {String} type 类型
 */
function getTypeWeight(type) {
	return topic.filter(function (val) {
		return val.type === type && val.checked
	}).length
}
$(function () {
	/* 上一页/下一页 */
	$("#next,#prev").click(function () {
		var currentPage = Number($('#page_number').val()) + Number($(this).data('page'))
		if (currentPage === -1) {
			toast('已是第一页!', 1.5)
			return
		}
		if (currentPage === 9) {
			toast('已是最后一页!', 1.5)
			return
		}
		$('#page_number').find("[value=" + currentPage + "]").prop('selected', true)
		$('#page_number').change()
	})
	/* 选中事件 */
	$("#form_container").on('change', 'input', function () {
		topic[$(this).attr('name') - 1]['checked'] = Boolean($(this).val())
		var checkRadioLen = topic.filter(function (val) {
			return val.checked === undefined
		}).length
		$("#submit").prop('disabled', checkRadioLen > 0)
	})
	/* 提交按钮 */
	$("#submit").click(function (e) {
		e.preventDefault()
		var reqData = {}
		var that = this
		var topThree = describe.map(function (item) {
			return Object.assign({}, item, {
				count: getTypeWeight(item.type)
			})
		}).sort(function (a, b) {
			return b.count - a.count
		}).slice(0, 3)
		$(that).prop('disabled', true)
		reqData['checkout_type_1'] = topThree[0].type
		reqData['checkout_type_2'] = topThree[1].type
		reqData['checkout_type_3'] = topThree[2].type
		reqData['recordID'] = window.localStorage.getItem('recordID')
		$.ajax({
			type: "POST",
			url: "",
			data: JSON.stringify({
				version: '1',
				data: reqData
			}),
			dataType: 'json',
			contentType: 'application/json',
			success: function (res) {
				if (res.code === '0000') {
					// toast('操作成功!');
					/* 结束提示 */
					$("#endTip").fadeIn(800)
						.on('click', '#endTipSure', function () {
							$("#endTip").fadeOut()
							window.location.href = 'https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MjM5MjAxMjQwOA==&scene=126&bizpsid=0#wechat_redirect'
							window.localStorage.removeItem('recordID')
						})
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