package com.zdsoft.finance.app.repaymenttrial.vo;

import java.io.Serializable;
import java.math.BigDecimal;

import com.zdsoft.framework.core.common.util.ObjectHelper;
/**
 * 
 * 版权所有：重庆正大华日软件有限公司
 * @Title: TrialRepayPlanToolVo.java 
 * @ClassName: TrialRepayPlanToolVo 
 * @Description: 还款计划工具vo
 * @author jingjiyan 
 * @date 2017年3月13日 上午9:39:12 
 * @version V1.0
 */
public class TrialRepayPlanToolVo implements Serializable {
	
	private static final long serialVersionUID = -3052334612139578988L;

	private String projectId;//项目id
	
	private String projectLoanId;//放款id

	private BigDecimal aMT_Page=BigDecimal.ZERO;//本金
	
	private BigDecimal eachAmt=BigDecimal.ZERO;//特殊还款方式：前面期数本金相同，最后一期本金=总本金-前面每期本金和

	private Integer applyLoanDt;//放款日期
	
	private Integer applyRepayDt;//到期日期
	
	private String repayMethod;//还款方式
	
	private String period;//还款期数
	
	private String loanPeriodMonth;//期限月
	
	private String loanPeriodDay;//期限天
	
	private String selectFixRepaymentDt="1";//每期放款日 1、放款日 2、指定日 3、月末4、指定+月末
	
	private String repaymentDt;//还款指定日
	
	private String e_RateUnit;//贷款利率单位
	
	private String interestRate;//贷款利率
	
	private boolean h_InterestType=false;//项目算尾
	
	private boolean h_IsTailType=true;//期限内算尾
	
	private String repaymentDay="360";//还款计算天数
	
	private boolean h_IsInterest=false;//是否提前收息
	
	private Integer repayDt;//还款日
	
	private BigDecimal repayAmt=BigDecimal.ZERO;//还款金额
	
	private String repayType="1";//还款类型 1、正常还款 2、部分还款 3、提前结清
	
	private Integer lastRepayDt;//上次还款日 用于部分还款 提前结清
	
	private boolean yueLiSuanFan=false;//算利息是否用月利率算法false，天数算法true
	
	private int xiaoshuwei=2;//保留几位小数点
	
	private String lixiRepayWay;//还款日利息的算法
	

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getProjectLoanId() {
		return projectLoanId;
	}

	public void setProjectLoanId(String projectLoanId) {
		this.projectLoanId = projectLoanId;
	}

	public String getRepayMethod() {
		return repayMethod;
	}

	public void setRepayMethod(String repayMethod) {
		this.repayMethod = repayMethod;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getLoanPeriodMonth() {
		return ObjectHelper.isEmpty(loanPeriodMonth)?"0":loanPeriodMonth;
	}

	public void setLoanPeriodMonth(String loanPeriodMonth) {
		this.loanPeriodMonth = loanPeriodMonth;
	}

	public String getLoanPeriodDay() {
		return ObjectHelper.isEmpty(loanPeriodDay)?"0":loanPeriodDay;
	}

	public void setLoanPeriodDay(String loanPeriodDay) {
		this.loanPeriodDay = loanPeriodDay;
	}

	public String getSelectFixRepaymentDt() {
		return selectFixRepaymentDt;
	}

	public void setSelectFixRepaymentDt(String selectFixRepaymentDt) {
		this.selectFixRepaymentDt = selectFixRepaymentDt;
	}

	public String getRepaymentDt() {
		return repaymentDt;
	}

	public void setRepaymentDt(String repaymentDt) {
		this.repaymentDt = repaymentDt;
	}

	public String getE_RateUnit() {
		return e_RateUnit;
	}

	public void setE_RateUnit(String e_RateUnit) {
		this.e_RateUnit = e_RateUnit;
	}

	public String getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(String interestRate) {
		this.interestRate = interestRate;
	}

	public boolean isH_InterestType() {
		return h_InterestType;
	}

	public void setH_InterestType(boolean h_InterestType) {
		this.h_InterestType = h_InterestType;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getRepaymentDay() {
		return ObjectHelper.isEmpty(repaymentDay)?"360":repaymentDay;
	}

	public void setRepaymentDay(String repaymentDay) {
		this.repaymentDay = repaymentDay;
	}

	public boolean isH_IsTailType() {
		return h_IsTailType;
	}

	public void setH_IsTailType(boolean h_IsTailType) {
		this.h_IsTailType = h_IsTailType;
	}

	public boolean isH_IsInterest() {
		return h_IsInterest;
	}

	public void setH_IsInterest(boolean h_IsInterest) {
		this.h_IsInterest = h_IsInterest;
	}


	public String getRepayType() {
		return repayType;
	}

	public void setRepayType(String repayType) {
		this.repayType = repayType;
	}

	public Integer getApplyLoanDt() {
		return applyLoanDt;
	}

	public void setApplyLoanDt(Integer applyLoanDt) {
		this.applyLoanDt = applyLoanDt;
	}

	public Integer getApplyRepayDt() {
		return applyRepayDt;
	}

	public void setApplyRepayDt(Integer applyRepayDt) {
		this.applyRepayDt = applyRepayDt;
	}

	public Integer getRepayDt() {
		return repayDt;
	}

	public void setRepayDt(Integer repayDt) {
		this.repayDt = repayDt;
	}

	public Integer getLastRepayDt() {
		return lastRepayDt;
	}

	public void setLastRepayDt(Integer lastRepayDt) {
		this.lastRepayDt = lastRepayDt;
	}

	public boolean isYueLiSuanFan() {
		return yueLiSuanFan;
	}

	public void setYueLiSuanFan(boolean yueLiSuanFan) {
		this.yueLiSuanFan = yueLiSuanFan;
	}

	public int getXiaoshuwei() {
		return xiaoshuwei;
	}

	public void setXiaoshuwei(int xiaoshuwei) {
		this.xiaoshuwei = xiaoshuwei;
	}


	public String getLixiRepayWay() {
		return lixiRepayWay;
	}

	public void setLixiRepayWay(String lixiRepayWay) {
		this.lixiRepayWay = lixiRepayWay;
	}

	public BigDecimal getaMT_Page() {
		return aMT_Page;
	}

	public void setaMT_Page(BigDecimal aMT_Page) {
		this.aMT_Page = aMT_Page;
	}

	public BigDecimal getEachAmt() {
		return eachAmt;
	}

	public void setEachAmt(BigDecimal eachAmt) {
		this.eachAmt = eachAmt;
	}

	public BigDecimal getRepayAmt() {
		return repayAmt;
	}

	public void setRepayAmt(BigDecimal repayAmt) {
		this.repayAmt = repayAmt;
	}
	
}
