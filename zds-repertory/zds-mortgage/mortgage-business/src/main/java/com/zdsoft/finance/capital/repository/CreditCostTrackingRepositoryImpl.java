package com.zdsoft.finance.capital.repository;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.zdsoft.finance.capital.entity.CreditCostTracking;
import com.zdsoft.framework.core.common.util.ObjectHelper;

/**
 * 
 * 版权所有：重庆正大华日软件有限公司
 * 
 * @Title: CreditCostTrackingRepositoryImpl.java
 * @ClassName: CreditCostTrackingRepositoryImpl
 * @Description: 应付费用跟踪RepositoryImpl
 * @author liuwei
 * @date 2017年2月8日 上午10:25:21
 * @version V1.0
 */
public class CreditCostTrackingRepositoryImpl {

	@PersistenceContext
	private EntityManager em;

	/**
	 * 
	 * @Title: findByConditions 
	 * @Description: 通过查询条件查询应付费用跟踪
	 * @author liuwei 
	 * @param conditions  查询条件
	 * @return 应付费用跟踪列表
	 */
	@SuppressWarnings("unchecked")
	public List<CreditCostTracking> findByConditions(Map<String, Object> conditions) {

		// 组装Hql以及查询条件
		StringBuffer hql = new StringBuffer(
				"select t from CreditCostTracking t where t.isDeleted = false and t.creditEntrust is not null ");

		if (ObjectHelper.isNotEmpty(conditions)) {
			if (ObjectHelper.isNotEmpty(conditions.get("capitallist_id"))) {
				hql.append(" and t.creditEntrust.capitallist.id = :capitallist_id ");
			}
			if (ObjectHelper.isNotEmpty(conditions.get("creditEntrustName"))) {
				hql.append(" and t.creditEntrust.creditEntrustName like :creditEntrustName ");
			}
			if (ObjectHelper.isNotEmpty(conditions.get("creditEntrustId"))) {
				hql.append(" and t.creditEntrust.id = :creditEntrustId ");
			}
		}
		
		hql.append(" order by t.createTime desc ");
		Query query = em.createQuery(hql.toString());

		if (ObjectHelper.isNotEmpty(conditions)) {
			if (ObjectHelper.isNotEmpty(conditions.get("capitallist_id"))) {
				query.setParameter("capitallist_id", conditions.get("capitallist_id"));
			}
			if (ObjectHelper.isNotEmpty(conditions.get("creditEntrustName"))) {
				query.setParameter("creditEntrustName", "%" + conditions.get("creditEntrustName") + "%");
			}
			if (ObjectHelper.isNotEmpty(conditions.get("creditEntrustId"))) {
				query.setParameter("creditEntrustId", conditions.get("creditEntrustId"));
			}
		}
		

		List<CreditCostTracking> costTrackings = query.getResultList();
		return costTrackings;
	}
}
