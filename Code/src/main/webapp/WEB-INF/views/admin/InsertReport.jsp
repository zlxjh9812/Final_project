<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="https://www.inven.co.kr/common/lib/js/framework/jquery-1.7.2.min_new.js?v=20130113a"></script>
<style type="text/css">

#reportsWrap { width: 100%; height: auto; display: block; }
#reportsWrap form { display: inline; }
#reportsWrap form .hiddenFields { display: none; }
#reportsTop { width: 100%; height: 38px; background: #09A8B6 url(https://static.inven.co.kr/image/play/reports/bg_pia_reports_top.gif) repeat-x left top; display: block; }
#reportsTop h3 { display: inline; float: left; margin: 10px 0 0 10px; padding-left: 30px; padding-top: 2px; color: #FFF; font-weight: bold; font-size: 9pt; background: url(https://static.inven.co.kr/image/play/reports/icon_pia_reports_redcard.gif) no-repeat left top; }
#reportsBody { float: left; display: inline; margin-top: 4px; width: 100%; height: auto; font-size: 9pt; border-top: 1px solid #CACACA; padding-bottom: 15px; }
#reportsDotline { margin: 1 0 1 0; width: 100%; height: 1px; overflow: hidden; background: url(https://static.inven.co.kr/image/play/reports/dot_pia_reports_grey.gif) repeat-x left top; }
#reportsBody dl { width: 100%; margin: 0; padding: 8px 0 6px; float: left; display: inline; background: url(https://static.inven.co.kr/image/play/reports/dot_pia_reports_grey.gif) repeat-x left bottom; }
#reportsBody dl.type-for-molka { display: none; }
#reportsBody dt { float: left; display: inline; margin-left: 7px; text-indent: 8px; width: 98px; _width: 112px; background: url(https://static.inven.co.kr/image/play/reports/cross_pia_reports_red.gif) no-repeat left 4px; font-weight: bold; }
#reportsBody dd { float: left; display: inline; }
#reportsBody dd span { padding: 0; float: left; display: inline; }
#reportsBody dd ul { margin: 0; padding: 0; float: left; display: inline; }
#reportsBody dd li { display: inline; float: left; line-height: 1.5; }
#reportsBody dd li span { margin-left: 5px; }
#reportsBody dd li label { margin-right: 10px; }
#reportsBody textarea { margin: 5px 0 0 6px; width: 97%; height: 132px; float: left; display: inline; border: 1px solid #C4CAD1; }
#reportsHelp { margin: 5px 0 0 6px; width: 97%; height: auto; float: left; display: inline; background: #F2F2F2; }
#reportsHelpMid { padding: 10px; height: auto; float: left; display: block; line-height: 20px; color: #555; }
#btnReportsSubmit { margin: 19px 0 0 10px; width: 93px; height: 25px; background: url(https://static.inven.co.kr/image/play/reports/btn_pia_reports_submit.gif) no-repeat left top; float: left; display: inline; }
#btnReportsSubmit a { width: 58px; height: 19px; _width: 93px; _height: 25px; padding-left: 35px; padding-top: 6px; color: #000; font-weight: normal; font-size: 9pt; background: url(https://static.inven.co.kr/image/play/reports/icon_pia_reports_redcard.gif) no-repeat 10px 4px; float: left; display: inline; text-decoration: none; }
#btnReportsClose { display: inline; float: right; margin: 19px 10px 0; width: 93px; height: 25px; }
#btnReportsClose a { display: inline; float: left; width: 93px; height: 19px; _height: 25px; background: url(https://static.inven.co.kr/image/play/reports/btn_pia_reports_submit.gif) no-repeat left top; text-align: center; padding-top: 6px; color: #000; font-weight: normal; font-size: 9pt; text-decoration: none; }

</style>
</head>
  
<body>
<script type="text/javascript">
function submitReport() {
  	var fmObj = document.getElementById("fmReport");
  	var $value = $('.reporttype1').val();
  	console.log($value);
  	if ($value == "불법촬영물") { alert("불법촬영물 분류를 선택해 주세요."); return; }
  	if (fmObj.rcontent.value == "") { alert("신고내용을 작성해 주세요."); fmObj.rcontent.focus(); return; }
  	fmObj.submit();
  }
	$(document).ready(function() {

  $(".reporttype1 input").click(function() {
		console.log($(this).val());
      if ($(this).prop("checked") == true && $(this).val() == '불법촬영물') {
          $("dl.type-for-molka").show();
         
      } else {
          $("dl.type-for-molka").hide();
      }

  });
	});
  </script>
<div id = "reportWrap">
	<form id="fmReport" name="fmReport" action="insertReviewReport.do" onsubmit="submitReport(); return false;">
<div class="hiddenFields">
<input type="hidden" name="seq" value="${board.bseq }">
<input type="hidden" name="tableNum" value="${board.boardnum }">
<input type="hidden" name="UserId" value="${User.userId }">
<input type="hidden" name="targetID" value="${board.userId }">
</div>
	<div id="reportsTop">
		<h3>신고하기</h3>
	</div>
	<div id="reportsBody">
		<dl>
			<dt>제목</dt>
			<dd><span>${board.title }</span></dd>
		</dl>
        		<dl>
			<dt>작성자 아이디</dt>
			<dd><span>${board.userId }</span></dd>
		</dl>
        		<dl>
			<dt>신고자 아이디</dt>
			<dd><span>${User.userId }</span></dd>
		</dl>
		<dl>
			<dt>신고사유</dt>
			<dd>
				<ul id="reportOption" class = "reporttype1">
   				 <li><input type="radio" id="reportstype_0" name="reportOption" value="욕설/비방" checked=""><label for="reportstype_0">욕설/비방</label></li>
				<li><input type="radio" id="reportstype_1" name="reportOption" value="도배"><label for="reportstype_1">도배</label></li>
				<li><input type="radio" id="reportstype_2" name="reportOption" value="홍보/상업성"><label for="reportstype_2">홍보/상업성</label></li>
				<li><input type="radio" id="reportstype_3" name="reportOption" value="음란성"><label for="reportstype_3">음란성</label></li>
				<li><input type="radio" id="reportstype_4" name="reportOption" value="불법촬영물"><label for="reportstype_4">불법촬영물</label></li>
				<li><input type="radio" id="reportstype_5" name="reportOption" value="기타"><label for="reportstype_5">기타</label></li>
                </ul>
			</dd>
		</dl>
        <dl class="type-for-molka" style="display: none;">
            <dt>분류</dt>
            <dd>
				<ul id="reportOption" class = "reporttype2">
                    <li><input type="radio" id="reportstype_6" name="reportOption" value="성적 불법촬영"><label for="reportstype_6">성적 불법촬영물</label></li>
                    <li><input type="radio" id="reportstype_7" name="reportOption" value="성적 허위영상"><label for="reportstype_7">성적 허위영상물</label></li>
                    <li><input type="radio" id="reportstype_8" name="reportOption" value="아동청소년성착취물"><label for="reportstype_8">아동청소년성착취물</label></li>
				</ul>
            </dd>
        </dl>
		<textarea id="rcontent" name="reportDetail"></textarea>
		<div id="reportsHelp">
			<div id="reportsHelpTop"></div>
			<div id="reportsHelpMid">신고 게시물은 삭제되며, 해당 게시물을 올린 유저는 덧글쓰기 및 글쓰기 제한을 받을 수 있습니다.<br>단, 허위신고일 경우, 신고자의 활동에 제한을 받게 되오니, 그 점 유의해 주시기 바랍니다.  </div>
			<div id="reportsHelpBot"></div>
		</div>
		<div id="btnReportsSubmit"><a href="javascript:submitReport();">신고하기</a></div>
		<div id="btnReportsClose"><a href="javascript:window.open('about:blank','_self').close();">닫 기</a></div>
	</div>
</form>

</div>

</body>
</html>