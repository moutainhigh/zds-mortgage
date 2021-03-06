<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file='../../common/common_js.jsp' %>
<script type="application/javascript">
    var viewType = true;
</script>
<!-- 基本信息 -->
<%@include file="common/case_apply_view.jsp" %>
<!-- 押品信息列表 -->
<%@ include file="common/house_list.jsp" %>
<!--盖章明细-->
<%@ include file="common/contractSealDetail_list.jsp" %>
<div class="page-box" id="upFile">
</div>
<div class="page-box">
    <div class="p10">
        <h1 class="page-title">申请信息</h1>
        <div class="p5">
            <form id="" class="zui-form " method="post">
                <table class="table-detail">
                    <tr>
                        <td class="td-title pct10">申请类型</td>
                        <td class="pct20">
                            <dl class="form-item">
                                <dd class="detail">
                                    <input class="zui-combobox zui-validatebox" id="applyType" type="hidden"
                                           disabled="true"
                                           name="applyType" validate-type="Require" value="${contractSeal.applyType}"
                                           data-data="[{'id':'0','text':'盖章申请'},{'id':'1','text':'二次盖章'}]"
                                           data-valuefield="id" data-textfield="text"/>
                                </dd>
                            </dl>
                        </td>
                        <td class="td-title pct10">申请人</td>
                        <td class="pct20">
                            <label>
                                <input type="hidden" id="fileUuid" name="fileUuid" value="${uuid}"/>
                                <input type="zui-input zui-validatebox" id="launchEmpName" name="launchEmpName"
                                       disabled="disabled"
                                       value="${busiForm.launchEmpName}"/>
                                <input type="hidden" id="launchEmpCode" name="launchEmpCode"
                                       value="${busiForm.launchEmpCode}"/>
                            </label>
                        </td>
                        <td class="td-title pct10">申请时间</td>
                        <td class="pct20">
                            <input type="zui-input zui-validatebox" id="showApplyData" disabled="disabled"
                                   value="${busiForm.applyDate}"/>
                            <input type="hidden" name="applyDate" value="${busiForm.applyDate}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-title pct10">备注</td>
                        <td colspan="5">
                            <label>
                                    <textarea class="zui-area row-width" id="remark" name="remark" disabled="disabled"
                                              validate-type="Require,Length[0-200]"
                                              placeholder="最多可以输入200个字符">${contractSeal.remark }</textarea>
                            </label>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="caseContractId" id="caseContractId" value="${contract.id}">
            </form>
        </div>
    </div>
</div>
<div class="page-box">
    <div class="p10">
        <h1 class="page-title">快递单号</h1>
        <div class="p5">
            <form id="contractSealForm" class="zui-form " method="post">
                <table class="table-detail">
                    <tr>
                        <td class="td-title pct10">*退回信托快递单号</td>
                        <td class="pct20">
                            <dl class="form-item">
                                <dd class="detail">
                                    <label>
                                        <input class="zui-input zui-validatebox" id="trackingNoReceive" type="text"
                                               name="trackingNoReceive"
                                               validate-type="Require"
                                               value="${contractSeal.trackingNoReceive}"/>
                                    </label>
                                </dd>
                            </dl>
                            <input type="hidden" id="id" name="id" value="${contractSeal.id}"/>
                        </td>
                        <td class="td-title pct10"></td>
                        <td class="pct20">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    seajs.use(['jquery', 'zd/jquery.zds.page.callback', 'zd/tools', 'zd/jquery.zds.loading', 'zd/jquery.zds.combobox', 'zd/jquery.zds.table',
        'zd/switch', 'zd/jquery.zds.dialog', 'zd/jquery.zds.message',
        'zd/jquery.zds.form', 'datepicker'
    ], function ($, CALLBACK, ZTOOlS, Loading, ZCombobox) {
        $.ZUI.init();
        $("#upFile").load('<z:ukey key="com.zdsoft.finance.fileStore.fileShowListPage" context="admin" />&productId=${caseApply.productSubtypeId}&linkCode=${subStage}&caseApplyId=${caseApply.id}&businessId=${contractSeal.id}');
        //修改日期显示格式
        $("#showApplyData").val(ZTOOlS.strToTime("${busiForm.applyDate}"));
        $("#applyType").ZCombobox('disable');

        ZDS_WORKFLOW_CLIENT.saveFunction = function (datas) {
            var sealFormValidate = $.ZUI.validateForm($('#contractSealForm'));

            if (sealFormValidate) {
                var formArray = $("#contractSealForm").serializeArray();
                var args = JSON.parse(datas.args);
                formArray.push({name: "processInstanceId", value: args.processInstanceId});
                formArray.push({name: "taskInstanceId", value: args.taskInstanceId});
                formArray.push({name: "taskId", value: args.taskId});
                formArray.push({name: "taskName", value: args.taskName});
                formArray.push({name: "jobAppCd", value: args.jobAppCd});
                formArray.push({name: "projectId", value: "${projectId}"});
                formArray.push({name: "businessKey", value: "${businessKey}"});
                Loading.show();
                $.post('<z:ukey key="com.zdsoft.finance.contract.conCaseContractSeal.saveSealBackSend" context="admin"/>',
                    formArray, function (rdata) {
                        rdata = eval("(" + rdata + ")");
                        var msg = "";
                        if (rdata.resultStatus == 0) {
                            //执行回调函数
                            ZDS_WORKFLOW_CLIENT.callBackFuntion(datas, ZDS_WORKFLOW_PARAM._STATUS_SUCCESS, rdata.msg);
                        } else {
                            //执行回调函数
                            ZDS_WORKFLOW_CLIENT.callBackFuntion(datas, ZDS_WORKFLOW_PARAM._STATUS_ERROR, rdata.msg);
                        }
                        Loading.hide();
                    });
            }
        }
        //提交方法
        ZDS_WORKFLOW_CLIENT.submitFunction = ZDS_WORKFLOW_CLIENT.saveFunction;
    });
</script>