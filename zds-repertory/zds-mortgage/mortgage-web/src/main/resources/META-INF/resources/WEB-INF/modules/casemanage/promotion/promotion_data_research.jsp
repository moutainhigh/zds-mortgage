<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.zdsoft.cn/tags" prefix="z"%>
<%@ include file="../../common/common_js.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="frm-content frm-bottom">
	<div class="page-box" id="otherAssetsDiv">
		<div class="p10">
			<input id="caseApplyId" name="caseApplyId" value="${caseApplyId }" type="hidden"/>
			
			<!-- 房产情况 -->
			<%@ include file="otherproperty/customer_house_add.jsp"%>
			
			<br>
			
			<!-- 汽车情况 -->
			<%@ include file="otherproperty/assets_car_add.jsp"%>
			
			<br>
			
			<!-- 有价证券 -->
			<%@ include file="otherproperty/assets_securities_add.jsp"%>			
			
			<br>
			
			<!-- 存款情况 -->
			<%@ include file="otherproperty/assets_deposit_add.jsp"%>			
			
			<br>
			
			<!-- 设备情况 -->
			<%@ include file="otherproperty/assets_device_add.jsp"%>			
	
			
		</div>
	</div>
</div>
<script type="text/javascript">
		seajs.use(['jquery','zd/jquery.zds.page.callback','zd/jquery.zds.message','zd/jquery.zds.form','zd/jquery.zds.combobox','zd/jquery.zds.seleter'], 
		function($, CALLBACK) {
			//刷新
		     function doSearch() {
		    	 location.reload();
			}; 
		    //页面回调
		    ZDS_MESSAGE_CLIENT.refreshThis=function(){
				doSearch();
		    }; 

			$.ZUI.init("#otherAssetsDiv"); 
			
		});
</script>