<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.zdsoft.cn/tags" prefix="z"%>
<div id="accountDialogDiv">
    <div id="InfoDialog">
        <form id="accountForm" class="zui-form mt15" >
        	<input type="hidden" name="id"  id="id" value="${infoVo.id }" >
            <input type="hidden" id="terminalId" name="terminalId" value="${terminalId}">
            
            <dl class="form-item">
                <dt class="title"><b class="c-red mr5">*</b>开户银行:</dt>
               <dd class="detail">
                	 <label>
                    	<input class="zui-input zui-validatebox" validate-type="Require,Length[1-20]" name="bankName"  id="bankName" value="${infoVo.bankName}" >
                    </label>
                </dd>
            </dl>
            <dl class="form-item">
                <dt class="title"><b class="c-red mr5">*</b>开户名:</dt>
                <dd class="detail">
                	 <label>
                    	<input class="zui-input zui-validatebox" validate-type="Require,Length[1-20]" name="accountName"  id="accountName" value="${infoVo.accountName}" >
                    </label>
                </dd>
            </dl>
            <dl class="form-item">
                <dt class="title"><b class="c-red mr5">*</b>帐号/卡号:</dt>
                <dd class="detail">
                	 <label>
                    	<input class="zui-input zui-validatebox" validate-type="Require,Number,Length[1-20]" name="bankAccount"  id="bankAccount" value="${infoVo.bankAccount}" >
                    </label>
                </dd>
            </dl>
            <dl class="form-item">
                <dt class="title"><b class="c-red mr5">*</b>返佣收款人姓名:</dt>
                <dd class="detail">
                	 <label>
                    	<input class="zui-input zui-validatebox" name="brokeragePersonName"  validate-type="Require,Length[1-20]" id="brokeragePersonName" value="${infoVo.brokeragePersonName}" >
                    </label>
                </dd>
            </dl>
            <dl class="form-item">
                <dt class="title">账户描述:</dt>
                <dd class="detail">
                    <label>
                    	<input class="zui-input zui-validatebox" validate-type="Length[0-32]" name="accountDetail"  id="accountDetail" value="${infoVo.accountDetail}" >
                    </label>
                </dd>
            </dl>
            <dl class="form-item">
                <dt class="title">账户状态:</dt>
                <dd class="detail">
                	 <label>
                    	<input class="zui-combobox zui-validatebox" id="approveType" name="approveType" type="hidden" value="${infoVo.approveType }"
		                              data-url="<z:res resource="public.simplecode.selector" isDefault="true"/>&jsoncallback=?&target=true&categoryCd=YWDM00163"
		                              data-valuefield="fullcode"  data-textfield="name" >
                    </label>
                </dd>
            </dl>
            <dl class="form-item">
                <dt class="title">活动帐号:</dt>
                <dd class="detail">
                	 <label>
                    	<input class="zui-input zui-validatebox" validate-type="Length[0-20]" name="aliveAccount"  id="aliveAccount" value="${infoVo.aliveAccount}" >
                    </label>
                </dd>
            </dl>
        </form>
    </div>
</div>
	<script type="text/javascript">
    seajs.use(['jquery','zd/jquery.zds.form','zd/jquery.zds.table'], function ($) {
    	$("#accountDialogDiv").Zdialog({
            width: 700, height: 300, closed: false, title: "${operationType eq 'add' ? '新增':operationType eq 'mod'? '编辑' :'查看'}返佣账户 ",isDestroy:true,
            buttons: 
            [
                {
                    id: 'message-btn',
                    text: '确定',
                    buttonCls: 'btn-blue',
                    handler: function () {
                    	var contactForm = $('#accountForm').serialize();
                    	var isValidate = $.ZUI.validateForm($('#accountForm'));
        				if(isValidate){
                            $.ajax({
                                type: 'post',
                                url: '<z:ukey key="com.zdsoft.finance.cooperator.brokerageAccount.save" context="admin"/>',
                                data: contactForm,
                                dataType: 'json',
                                success: function (data) {
                                    if (data.resultStatus == 0) {
                                    	$.ZMessage.success("提示", "保存成功", function () {
                    	                    $(".zd-message").ZWindow("close");
                    	                });
                                    	$('#account_datagrid_list').ZTable("reload", {});
                                    	$("#accountDialogDiv").Zdialog("close");
                                    }
                                },
                                error: function () {
                                	$.ZMessage.error("错误", "系统异常，请联系管理员", function () {
                                        $(".zd-message").ZWindow("close");
                                    });
                                	$("#accountDialogDiv").Zdialog("close");
                                }
                            });
        				}
                    }
                },
                {
                    id: 'message-btn',
                    text: '关闭',
                    buttonCls: 'btn-gray',
                    handler: function () {
                    	$("#accountDialogDiv").Zdialog("close");
                    }
                }
            ]
        });
    	$(document).ready(function(){
    		var type = "${operationType}";
        	if(type == 'view'){
        		$('#message-btn').hide();
        		$('#aliveAccount').attr("disabled","disabled");
        		$('#brokeragePersonName').attr("disabled","disabled");
        		$('#bankAccount').attr("disabled","disabled");
        		$('#accountName').attr("disabled","disabled");
        		$('#bankName').attr("disabled","disabled");
        		$('#accountDetail').attr("disabled","disabled");
        		$("#approveType").data("choose","disable");
        		$("#zds_btn_message-btn").hide();
        	}
    	});
    	//初始化
        $.ZUI.init();
    	
    });
</script>