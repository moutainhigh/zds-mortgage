<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.zdsoft.cn/tags" prefix="z"%>
<div class="frm-content frm-bottom">
	<form id="addForm" class="zui-form form-search" action="javascript:void(0);">
		<input type="hidden" name="id" value="${vo.id}">
		<input type="hidden" name="projectId" value="${projectId}">
		<input type="hidden" name="processInstanceId" value="${processInstanceId}">
		<input type="hidden" name="businessKey" value="${businessKey}">
		<div class="page-box">
			<h1 class="page-title">基本信息</h1>
			<div class="p5">
				<table class="table-detail">
	                <tbody>
		                <tr>
		                    <td class="td-title pct10">机构名称</td>
		                    <td class="pct20">${vo.applyOrgNm}<input type="hidden" name="applyOrgNm" value="${vo.applyOrgNm}"/><input type="hidden" name="applyOrgCd" value="${vo.applyOrgCd}"/></td>
		                    <td class="td-title pct10">申请人</td>
		                    <td class="pct20">${vo.applyEmpNm}<input type="hidden" name="applyEmpNm" value="${vo.applyEmpNm}"/><input type="hidden" name="applyEmpCd" value="${vo.applyEmpCd}"/></td>
		                    <td class="td-title pct10">部门</td>
		                    <td class="pct30">${vo.applyDepNm}<input type="hidden" name="applyDepNm" value="${vo.applyDepNm}"/><input type="hidden" name="applyDepCd" value="${vo.applyDepCd}"/></td>
		                </tr>
		                <tr>
		                    <td class="td-title">申请时间</td>
		                    <td>
		                    	<span>
		                    		<fmt:parseDate value="${vo.applyTime}" var="yearMonth" pattern="yyyyMMdd"/>
		                    		<fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd"/>
		                    	</span>
		                    	<input type="hidden" name="applyTime" value="${vo.applyTime}"/>
		                    </td>
		                    <td class="td-title">状态</td>
		                    <td>${vo.statusNm}<input type="hidden" name="status" value="${vo.status}"></td>
		                    <td class="td-title pct10"></td>
		                    <td class="pct30"></td>
		                </tr>
	           		</tbody>
	            </table>
			</div>
			<h1 class="page-title">收费支拥</h1>
			<div class="p5">
				<div id="ztoolbar">
					<a class="zui-toolbar" iconCls="icon-btn08" text="新增" buttonCls="btn-blue" handler="add"></a>
	        	</div>
				<div id="costitemTable" class="zui-datagrid" zdata-options='{"url":"<z:ukey key="com.zdsoft.finance.prCostItem.listData" context="admin"/>&jsoncallback=?","singleSelect":true,"pagination":true,"idField":"id","tableCls":"table-index","toolbar":"#ztoolbar"}'>
					<table>
	        			<tr>
	            			<th data-options="field:productId" formatter="productFormat">产品</th>
	            			<th data-options="field:period">期数</th>
	            			<th data-options="field:amount">贷款金额</th>
	            			<th data-options="field:pledgePick">抵押顺位</th>
	            			<th data-options="field:detailNames">费用项</th>
	            			<th data-options="field:detailCollectionTypes">收款方式</th>
	            			<th data-options="field:detailStocks">财务确认营收(标准)</th>
	            			<th data-options="field:detailCostMonths">支佣(标准)</th>
	            			<th data-options="field:detailReceipts">净收入(标准)</th>
	            			<th data-options="field:id" formatter="operate">操作</th>
				        </tr>
					</table>
				</div>
			</div>
		</div>
		<input type="hidden" type="hidden" value="${vo.items}" id="prCostitem_ids" name="prCostitem_ids">
		<div>
			<p>
				<strong>提前还款规则1：</strong><br />
				提前还款违约金=应补交利息损失差额+提前还款手续费，其中：<br />
				1、应补交利息损失差额：按照“实际贷款期限对应收费标准×实际贷款期限”测算应收总费用，应补交利息损失差额=应收总费用-已收费用。<br />
				2、提前还款手续费：（1）贷款期限＜12个月的，无须支付提前还款手续费。（2）贷款期限=12个月的， 6个月（含）内提前还款的，需支付提前还款金额的3%作为提前还款手续费； 7-12个月（含）内提前还款的，需支付提前还款金额的1%作为提前还款手续费。<br />
				<br />
				<strong>提前还款规则2：</strong><br />
				提前还款违约金=应补交利息损失差额+提前还款手续费，其中：<br />
				1、应补交利息损失差额：针对“经营贷”产品，主借人提还无须缴纳“应补交利息损失差额”。&nbsp;<br />
				2、提前还款手续费：在借款6个月（含）内提前还款的，需支付提前还款本金的5%作为提前还款违约金；在借款7-12个月（含）内提前还款的，需支付提前还款金额的3%作为提前还款违约金；在借款12个月后提前还款，需支付提前还款金额的2%作为提前还款违约金；<br />
				备注：客户提前还款用于续贷，且新贷款本金≥原贷款余额，免收提还违约金。<br />
				<br />
				<strong>提前还款规则3：</strong><br />
				1、先息后本期间提还不收取提还违约金；<br />
				2、等额本息还款期间提还的：需支付提前还款金额的2%作为提还手续费。
			</p>
		</div>
	</form>
</div>
<!-- 编辑 -->
<div id="dialog_edit" style="display: none;">
	<div id="costitem_add_form">
		<form class="zui-form" id="addFormDialog">
			<input type="hidden" name="id" />
			<table class="table-detail" style="width: 900px;">
                <tbody>
	                <tr>
	                	<td class="td-title pct15">
	                		<b class="c-red mr5">*</b>产品：
						</td>
						<td class="pct20">
							<dl class="form-item">
								<dd class="detail">
		                            <input class="zui-combobox zui-validatebox" type="hidden" id="productParentId"
		                                   data-width="94"
		                                   name="productParentId"
		                                   data-url="<z:ukey key='com.zdsoft.finance.getParentProduct' context='admin'/>&jsoncallback=?"
		                                   data-callback="productParentIdChange"
		                                   data-height="300"
		                                   data-defaultvalue=""
		                                   data-valuefield="id" data-textfield="text">
	                        	</dd>
								<dd class="detail">
		                            <input class="zui-combobox zui-validatebox" type="hidden" id="productId"
		                                   name="productId" data-width="94"
		                                   data-url="<z:ukey key='com.zdsoft.finance.getProductByParentId' context='admin'/>&jsoncallback=?"
		                                   data-callback=""
		                                   data-height="300"
		                                   data-defaultvalue=""
		                                   data-valuefield="id" data-textfield="text">
								</dd>
							</dl>
						</td>
	                	<td class="td-title pct15">
	                		<b class="c-red mr5">*</b>期数：
						</td>
						<td class="pct20">
							<dl class="form-item form-auto">
								<dd class="detail">
									<input class="zui-input zui-validatebox" style="width: 40px;float: left;" validate-type="Require" name="periodStart" />
								</dd>
								<dd class="detail">
									<input class="zui-combobox zui-validatebox" data-width="70" validate-type="Require" type="hidden" name="periodStartUnit"
										data-url="<z:res resource='public.simplecode.selector' isDefault='true'/>&jsoncallback=?&target=true&categoryCd=0931"
									    data-valuefield="fullcode" data-textfield="name" />
										<span class="word" style="float: left;">至</span>
								</dd>
								<dd class="detail">
									<input class="zui-input zui-validatebox" style="width: 40px;float: left;" validate-type="Require" name="periodEnd" />
								</dd>
								<dd class="detail">
									<input class="zui-combobox zui-validatebox" data-width="70" validate-type="Require" type="hidden" name="periodEndUnit"
										data-url="<z:res resource='public.simplecode.selector' isDefault='true'/>&jsoncallback=?&target=true&categoryCd=0931"
									    data-valuefield="fullcode" data-textfield="name" />
								</dd>
							</dl>
						</td>
					</tr>
					<tr>
						<td class="td-title pct15">
	                		<b class="c-red mr5">*</b>贷款金额(元)：
						</td>
						<td class="pct20">
							<dl class="form-item">
								<dd class="detail">
									<input class="zui-input width2-1 zui-validatebox" validate-type="Require" name="amountStart">
									<span class="word">至</span>
									<input class="zui-input width2-1 zui-validatebox" validate-type="Require" name="amountEnd">
								</dd>
							</dl>
						</td>
						<td class="td-title pct15">
	                		<b class="c-red mr5">*</b>抵押顺位：
						</td>
						<td class="pct20">
							<dl class="form-item form-auto">
								<dd class="detail">
									<input class="zui-combobox zui-validatebox" validate-type="Require" data-width="112" id="pledgePickStart" name="pledgePickStart" type="hidden" data-multiple="false"
			                               data-data="[{'id':'1抵','text':'1抵'},{'id':'2抵','text':'2抵'}]"
			                               data-valuefield="id" data-textfield="text">
									<span class="word" style="float: left;">至</span>
								</dd>
								<dd class="detail">
									<input class="zui-combobox zui-validatebox" validate-type="Require" data-width="112" id="pledgePickEnd" name="pledgePickEnd" type="hidden" data-multiple="false"
			                               data-data="[{'id':'1抵','text':'1抵'},{'id':'2抵','text':'2抵'}]"
			                               data-valuefield="id" data-textfield="text">
		                    	</dd>
		                	</dl>
						</td>
	                </tr>
	                <tr>
	                	<td class="td-title pct15">
	                		<b class="c-red mr5">*</b>逾期收费(%/天)：
						</td>
						<td class="pct20">
							<label>
								<input class="zui-input zui-validatebox" validate-type="Require" name="overdueFee">
							</label>
						</td>
						<td class="td-title pct15">
	                		<b class="c-red mr5">*</b>展期收费(%/天)：
						</td>
						<td class="pct20">
							<label>
								<input class="zui-input zui-validatebox" validate-type="Require" name="renewalFee">
							</label>
						</td>
	                </tr>
	                <tr>
	                	<td class="td-title pct15">
	                		<b class="c-red mr5">*</b>终端：
						</td>
						<td class="pct20">
							<dl class="form-item form-auto">
								<dd class="detail">
									<input class="zui-combobox zui-validatebox" validate-type="Require" id="terminal" name="terminal" type="hidden" data-multiple="false"
		                               data-data="[{'id':'直客','text':'直客'}]"
		                               data-valuefield="id" data-textfield="text">
	                        	</dd>
	                        </dl>
						</td>
	                	<td class="td-title pct15">
	                		<b class="c-red mr5">*</b>还款方式：
						</td>
						<td class="pct20">
							<dl class="form-item form-auto">
								<dd class="detail">
									<input class="zui-combobox zui-validatebox" validate-type="Require" id="repaymentType" name="repaymentType" type="hidden" data-multiple="false"
		                               data-data="[{'id':'按月付款','text':'按月付款'},{'id':'到期还本','text':'到期还本'},{'id':'按季还本','text':'按季还本'},{'id':'组合还款','text':'组合还款'}]"
		                               data-valuefield="id" data-textfield="text">
								</dd>
	                        </dl>
						</td>
	                </tr>
	                <tr>
	                	<td class="td-title pct15">
	                		<b class="c-red mr5">*</b>提前还款违约金(所有已收费用，一律不退)：
						</td>
						<td class="pct20">
							<dl class="form-item form-auto">
								<dd class="detail">
									<input class="zui-combobox zui-validatebox" validate-type="Require" id="prepayment" name="prepayment" type="hidden" data-multiple="false"
		                               data-data="[{'id':'提前还款规则1','text':'提前还款规则1'},{'id':'提前还款规则2','text':'提前还款规则2'},{'id':'提前还款规则3','text':'提前还款规则3'}]"
		                               data-valuefield="id" data-textfield="text">
								</dd>
	                        </dl>
						</td>
						<td class="td-title pct15"></td>
						<td class="pct20"></td>
	                </tr>
	            </tbody>
		    </table>
			<div style="margin-top: 10px;">
				<table class="table-detail" style="width: 900px;">
	                <tbody>
		                <tr>
		                    <td class="td-title pct10" style="text-align: center;">费用项</td>
		                    <td class="td-title pct10" style="text-align: center;">收款方式</td>
		                    <td class="td-title pct20" style="text-align: center;">财务确认营收(标准)</td>
		                    <td class="td-title pct10" style="text-align: center;">支佣(标准)</td>
		                    <td class="td-title pct10" style="text-align: center;">净收入(标准)</td>
		                </tr>
		                <tr>
		                    <td>利息<input type="hidden" name="detailCode" value="interest"><input type="hidden" name="detailName" value="利息"></td>
		                    <td>
		                    	<dl class="form-item form-auto">
									<dd class="detail">
				                    	<input class="zui-combobox zui-validatebox" data-width="150" name="detailCollectionType" type="hidden" data-multiple="false"
			                               data-data="[{'id':'放款前收','text':'放款前收'},{'id':'分期收','text':'分期收'}]"
			                               data-valuefield="id" data-textfield="text">
	                               </dd>
		                        </dl>
                            </td>
		                    <td>
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailStock">%/笔
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailMonth">%/月
                            </td>
		                    <td>
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailCostMonth">%/月
                            </td>
		                    <td>
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailReceipt">%
                            </td>
		                </tr>
		                <tr>
		                    <td>服务费<input type="hidden" name="detailCode" value="serviceCharge"><input type="hidden" name="detailName" value="服务费"></td>
		                    <td>
		                    	<dl class="form-item form-auto">
									<dd class="detail">
				                    	<input class="zui-combobox zui-validatebox" data-width="150" name="detailCollectionType" type="hidden" data-multiple="false"
			                               data-data="[{'id':'放款前收','text':'放款前收'},{'id':'分期收','text':'分期收'}]"
			                               data-valuefield="id" data-textfield="text">
	                               </dd>
		                        </dl>
                            </td>
		                    <td>
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailStock">%/笔
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailMonth">%/月
                            </td>
		                    <td>
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailCostMonth">%/月
                            </td>
		                    <td>
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailReceipt">%
                            </td>
		                </tr>
		                <tr>
		                    <td>保证金<input type="hidden" name="detailCode" value="cashDeposit"><input type="hidden" name="detailName" value="保证金"></td>
		                    <td>
		                    	<dl class="form-item form-auto">
									<dd class="detail">
				                    	<input class="zui-combobox zui-validatebox" data-width="150" name="detailCollectionType" type="hidden" data-multiple="false"
			                               data-data="[{'id':'放款前收','text':'放款前收'},{'id':'分期收','text':'分期收'}]"
			                               data-valuefield="id" data-textfield="text">
	                               </dd>
		                        </dl>
                            </td>
		                    <td>
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailStock">%/笔
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailMonth">%/月
                            </td>
		                    <td>
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailCostMonth">%/月
                            </td>
		                    <td>
		                    	<input class="zui-input zui-validatebox nwidth2" name="detailReceipt">%
                            </td>
		                </tr>
	           		</tbody>
	            </table>
			</div>
		</form>
	</div>
</div>
<!-- 查看 -->
<div id="dialog_view" style="display: none;">
	<div>
		<form class="zui-form">
			<table class="table-detail" style="width: 900px;">
                <tbody>
	                <tr>
	                	<td class="td-title pct15">
	                		产品：
						</td>
						<td class="pct20">
							<span lang="product"></span>
						</td>
	                	<td class="td-title pct15">
	                		期数：
						</td>
						<td class="pct20">
							<span lang="period"></span>
						</td>
					</tr>
					<tr>
						<td class="td-title pct15">
	                		贷款金额：
						</td>
						<td class="pct20">
							<span lang="amount"></span>
						</td>
						<td class="td-title pct15">
	                		抵押顺位：
						</td>
						<td class="pct20">
							<span lang="pledgePick"></span>
						</td>
	                </tr>
	                <tr>
	                	<td class="td-title pct15">
	                		逾期收费：
						</td>
						<td class="pct20">
							<span lang="overdueFee"></span>
						</td>
						<td class="td-title pct15">
	                		展期收费：
						</td>
						<td class="pct20">
							<span lang="renewalFee"></span>
						</td>
	                </tr>
	                <tr>
	                	<td class="td-title pct15">
	                		终端：
						</td>
						<td class="pct20">
							<span lang="terminal"></span>
						</td>
	                	<td class="td-title pct15">
	                		还款方式：
						</td>
						<td class="pct20">
							<span lang="repaymentType"></span>
						</td>
	                </tr>
	                <tr>
	                	<td class="td-title pct15">
	                		提前还款违约金(所有已收费用，一律不退)：
						</td>
						<td class="pct20">
							<span lang="prepayment"></span>
						</td>
						<td class="td-title pct15"></td>
						<td class="pct20"></td>
	                </tr>
	            </tbody>
		    </table>
			<div style="margin-top: 10px;">
				<table class="table-detail" style="width: 900px;">
	                <tbody>
		                <tr>
		                    <td class="td-title pct10" style="text-align: center;">费用项</td>
		                    <td class="td-title pct10" style="text-align: center;">收款方式</td>
		                    <td class="td-title pct20" style="text-align: center;">财务确认营收(标准)</td>
		                    <td class="td-title pct10" style="text-align: center;">支佣(标准)</td>
		                    <td class="td-title pct10" style="text-align: center;">净收入(标准)</td>
		                </tr>
		                <tr>
		                    <td>利息</td>
		                    <td>
		                    	<span lang="detailCollectionType0"></span>
                            </td>
		                    <td>
		                    	<span lang="detailStock0"></span>
		                    	<span lang="detailMonth0"></span>
                            </td>
		                    <td>
		                    	<span lang="detailCostMonth0"></span>
                            </td>
		                    <td>
		                    	<span lang="detailReceipt0"></span>
                            </td>
		                </tr>
		                <tr>
		                    <td>服务费</td>
		                    <td>
		                    	<span lang="detailCollectionType1"></span>
                            </td>
		                    <td>
		                    	<span lang="detailStock1"></span>
		                    	<span lang="detailMonth1"></span>
                            </td>
		                    <td>
		                    	<span lang="detailCostMonth1"></span>
                            </td>
		                    <td>
		                    	<span lang="detailReceipt1"></span>
                            </td>
		                </tr>
		                <tr>
		                    <td>保证金</td>
		                    <td>
		                    	<span lang="detailCollectionType2"></span>
                            </td>
		                    <td>
		                    	<span lang="detailStock2"></span>
		                    	<span lang="detailMonth2"></span>
                            </td>
		                    <td>
		                    	<span lang="detailCostMonth2"></span>
                            </td>
		                    <td>
		                    	<span lang="detailReceipt2"></span>
                            </td>
		                </tr>
	           		</tbody>
	            </table>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
seajs.use(['jquery','zd/jquery.zds.page.callback','zd/jquery.zds.form','zd/jquery.zds.message','zd/jquery.zds.dialog','zd/jquery.zds.combobox','zd/jquery.zds.table','zd/jquery.zds.seleter'], function($, CALLBACK) {
	//编辑dialog
	$("#dialog_edit").Zdialog({
        width: 950, height: 400, closed: true, title: "新增",
        buttons: [
            {
                id: 'message-btn',
                text: '确定',
                buttonCls: 'btn-blue',
                handler: function () {
                	costItemSave();
                }
            },
            {
                id: 'message-btn',
                text: '取消',
                buttonCls: 'btn-gray',
                handler: function () {
                    $("#dialog_edit").Zdialog("close");
                }
            }
        ]
    });
	//查看dialog
	$("#dialog_view").Zdialog({
        width: 950, height: 400, closed: true, title: "查看",
        buttons: [
            {
                id: 'message-btn',
                text: '关闭',
                buttonCls: 'btn-gray',
                handler: function () {
                    $("#dialog_view").Zdialog("close");
                }
            }
        ]
    });
	
	//添加
	CALLBACK.add = function(){
		$("#addFormDialog input[name='id']").val("");
		$("#productId").ZCombobox("setValue","");
		$("#dialog_edit").Zdialog("open");
	}
	CALLBACK.productFormat = function(row,value){
		return row.productParentName + "/" + row.productName;
	};
	//操作
	CALLBACK.operate = function(row,value){
		var html = "<a title='详情' class='handler-icon icon-btn31' onclick='detail'></a>";
		html += "<a title='编辑' class='handler-icon icon-btn22' onclick='edit'></a>";
		html += "<a title='删除' class='handler-icon icon-btn12' onclick='del'></a>";
		return html;
	};
	//详情
	CALLBACK.detail = function(index,row){
		$("span[lang='product']").text(row.productParentName + "/" + row.productName);
		$("span[lang='period']").text(row.period);
		$("span[lang='amount']").text(row.amount);
		$("span[lang='pledgePick']").text(row.pledgePick);
		$("span[lang='overdueFee']").text(row.overdueFee + "(%/天)");
		$("span[lang='renewalFee']").text(row.renewalFee + "(%/天)");
		$("span[lang='terminal']").text(row.terminal);
		$("span[lang='repaymentType']").text(row.repaymentType);
		$("span[lang='prepayment']").text(row.prepayment);
		$("span[lang='detailCollectionType0']").text(row.detailCollectionType[0]);
		$("span[lang='detailStock0']").text(row.detailStock[0]==null?"":row.detailStock[0]+"%/笔");
		$("span[lang='detailMonth0']").text(row.detailMonth[0]==null?"":row.detailMonth[0]+"%/月");
		$("span[lang='detailCostMonth0']").text(row.detailCostMonth[0]==null?"":row.detailCostMonth[0]+"%/月");
		$("span[lang='detailReceipt0']").text(row.detailReceipt[0]==null?"":row.detailReceipt[0]+"%");
		
		$("span[lang='detailCollectionType1']").text(row.detailCollectionType[1]);
		$("span[lang='detailStock1']").text(row.detailStock[1]==null?"":row.detailStock[1]+"%/笔");
		$("span[lang='detailMonth1']").text(row.detailMonth[1]==null?"":row.detailMonth[1]+"%/月");
		$("span[lang='detailCostMonth1']").text(row.detailCostMonth[1]==null?"":row.detailCostMonth[1]+"%/月");
		$("span[lang='detailReceipt1']").text(row.detailReceipt[1]==null?"":row.detailReceipt[1]+"%");
		
		$("span[lang='detailCollectionType2']").text(row.detailCollectionType[2]);
		$("span[lang='detailStock2']").text(row.detailStock[2]==null?"":row.detailStock[2]+"%/笔");
		$("span[lang='detailMonth2']").text(row.detailMonth[2]==null?"":row.detailMonth[2]+"%/月");
		$("span[lang='detailCostMonth2']").text(row.detailCostMonth[2]==null?"":row.detailCostMonth[2]+"%/月");
		$("span[lang='detailReceipt2']").text(row.detailReceipt[2]==null?"":row.detailReceipt[2]+"%");
		$("#dialog_view").Zdialog("open");
	};
	//编辑
	CALLBACK.edit = function(index,row){
		$("#addFormDialog input[name='id']").val(row.id);
		$("#addFormDialog input[name='productId']").ZCombobox("setValue",row.productId);
		$("#addFormDialog input[name='productParentId']").ZCombobox("setValue",row.productParentId);
		$("#addFormDialog input[name='periodStart']").val(row.periodStart);
		$("#addFormDialog input[name='periodStartUnit']").ZCombobox("setValue",row.periodStartUnit);
		$("#addFormDialog input[name='periodEnd']").val(row.periodEnd);
		$("#addFormDialog input[name='periodEndUnit']").ZCombobox("setValue",row.periodEndUnit);
		$("#addFormDialog input[name='amountStart']").val(row.amountStart);
		$("#addFormDialog input[name='amountEnd']").val(row.amountEnd);
		$("#addFormDialog input[name='pledgePickStart']").ZCombobox("setValue",row.pledgePickStart);
		$("#addFormDialog input[name='pledgePickEnd']").ZCombobox("setValue",row.pledgePickEnd);
		$("#addFormDialog input[name='overdueFee']").val(row.overdueFee);
		$("#addFormDialog input[name='renewalFee']").val(row.renewalFee);
		$("#addFormDialog input[name='terminal']").ZCombobox("setValue",row.terminal);
		$("#addFormDialog input[name='repaymentType']").ZCombobox("setValue",row.repaymentType);
		$("#addFormDialog input[name='prepayment']").ZCombobox("setValue",row.prepayment);
		
		$($("#addFormDialog input[name='detailCollectionType']")[0]).ZCombobox("setValue",row.detailCollectionType[0]);
		$($("#addFormDialog input[name='detailStock']")[0]).val(row.detailStock[0]);
		$($("#addFormDialog input[name='detailMonth']")[0]).val(row.detailMonth[0]);
		$($("#addFormDialog input[name='detailCostMonth']")[0]).val(row.detailCostMonth[0]);
		$($("#addFormDialog input[name='detailReceipt']")[0]).val(row.detailReceipt[0]);
		
		$($("#addFormDialog input[name='detailCollectionType']")[1]).ZCombobox("setValue",row.detailCollectionType[1]);
		$($("#addFormDialog input[name='detailStock']")[1]).val(row.detailStock[1]);
		$($("#addFormDialog input[name='detailMonth']")[1]).val(row.detailMonth[1]);
		$($("#addFormDialog input[name='detailCostMonth']")[1]).val(row.detailCostMonth[1]);
		$($("#addFormDialog input[name='detailReceipt']")[1]).val(row.detailReceipt[1]);
		
		$($("#addFormDialog input[name='detailCollectionType']")[2]).ZCombobox("setValue",row.detailCollectionType[2]);
		$($("#addFormDialog input[name='detailStock']")[2]).val(row.detailStock[2]);
		$($("#addFormDialog input[name='detailMonth']")[2]).val(row.detailMonth[2]);
		$($("#addFormDialog input[name='detailCostMonth']")[2]).val(row.detailCostMonth[2]);
		$($("#addFormDialog input[name='detailReceipt']")[2]).val(row.detailReceipt[2]);
		
		$("#dialog_edit").Zdialog("open");
	};
	//删除
	CALLBACK.del = function(index,row){
		$.ajax({
			url:'<z:ukey key="com.zdsoft.finance.prCostItem.del" context="admin"/>&jsoncallBack=?',
			data:{
				id:row.id
			},
			type:"post",
			dataType:"jsonp",
			success:function(rdata){
				if(rdata.status == 1){
					$.ZMessage.success("提示", rdata.msg, function () {
						var prCostitem_ids = $("#prCostitem_ids").val();
						prCostitem_ids = prCostitem_ids.replaceAll(rdata.id,"");
						$("#prCostitem_ids").val(prCostitem_ids);
						$('#costitemTable').ZTable("reload",{"id|IN|S" : prCostitem_ids});
	                });
				}else{
					$.ZMessage.error("错误", rdata.msg, function () {
	                });
				}
			}
		});
	};
	
	$.ZUI.init();
	//重新初始化 表格
	$('#costitemTable').ZTable("reload",{"id|IN|S" : $("#prCostitem_ids").val()});
	
	//保存dialog
	function costItemSave(){
		var validate = $.ZUI.validateForm($('#addFormDialog'));
    	if (!validate) {
    		$.ZMessage.error("错误", "数据验证失败!", function () {
            });
            return false;
        }
    	var formData = $("#addFormDialog").serializeArray();
    	$.ajax({
			url:'<z:ukey key="com.zdsoft.finance.prCostItem.save" context="admin"/>&jsoncallBack=?',
			data:formData,
			type:"post",
			dataType:"jsonp",
			traditional:true,
			success:function(rdata){
				if(rdata.status == 1){
					$.ZMessage.success("提示", rdata.msg, function () {
						$("#dialog_edit").Zdialog("close");
						var prCostitem_ids = $("#prCostitem_ids").val() + "," + rdata.id;
						$("#prCostitem_ids").val(prCostitem_ids);
						$('#costitemTable').ZTable("reload",{"id|IN|S" : prCostitem_ids});
	                });
				}else{
					$.ZMessage.error("错误", rdata.msg, function () {
	                });
				}
			}
		});
	}
	
	//保存
    ZDS_WORKFLOW_CLIENT.saveFunction = function (datas) {
		 var WORKFLOW_FLAG=ZDS_WORKFLOW_PARAM._STATUS_VALIDATE_ERROR;//1、提交，需要，默认提交失败！
		//---------start------流程中有修改页面，需要提交业务数据操作------------------
		//流程参数
		var args = JSON.parse(datas);
		var params = $('#addForm').serialize();
        params += '&processInstanceId=' + args.processInstanceId;
        params += '&taskInstanceId=' + args.taskInstanceId;
        params += '&taskId=' + args.taskId;
        params += '&taskName=' + args.taskName;
        params += '&jobAppCd=' + args.jobAppCd;
		$.ajax({
			url:'<z:ukey key="com.zdsoft.finance.prCostitemApply.editJobSave" context="admin"/>',
			data:params,
			type:"post",
			async: false,
			dataType:"json",
			traditional:true,
			success:function(rdata){
				if(rdata.resultStatus == 0){
					WORKFLOW_FLAG=ZDS_WORKFLOW_PARAM._STATUS_SUCCESS;
				}else{
					$.ZMessage.error("错误", rdata.msg, function () {
	                });
				}
			}
		});
    	//---------end------流程中有修改页面，需要提交业务数据操作------------------
    	
    	//4、返回流程状态
    	return WORKFLOW_FLAG;
    };
    
    //提交方法
    ZDS_WORKFLOW_CLIENT.submitFunction = ZDS_WORKFLOW_CLIENT.saveFunction;
});
</script> 
</html>