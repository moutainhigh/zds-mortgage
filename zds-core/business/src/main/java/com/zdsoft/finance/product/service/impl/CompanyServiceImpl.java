package com.zdsoft.finance.product.service.impl;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zdsoft.finance.base.service.impl.BaseServiceImpl;
import com.zdsoft.finance.common.base.CustomRepository;
import com.zdsoft.finance.common.exception.BusinessException;
import com.zdsoft.finance.product.entity.Company;
import com.zdsoft.finance.product.repository.CompanyRepository;
import com.zdsoft.finance.product.service.CompanyService;
import com.zdsoft.framework.core.common.annotation.Log;
import com.zdsoft.framework.core.common.util.ObjectHelper;

/**
 * 机构操作接口实现
 * @author longwei
 * @date 2016/12/26
 * @version 1.0
 */
@Service("companyService")
public class CompanyServiceImpl extends BaseServiceImpl<Company, CustomRepository<Company,String>> implements CompanyService{

	@Log
	private Logger logger;
	
	@Autowired
	private CompanyRepository companyRepository;
	
	@Override
	@Transactional
	public void delete(String id) throws BusinessException {
		if(ObjectHelper.isEmpty(id)){
			logger.error("传入id为空");
			throw new BusinessException("传入id为空");
		}
		Company company=companyRepository.findOne(id);
		if(ObjectHelper.isEmpty(company)){
			logger.error("实体不存在");
			throw new BusinessException("实体不存在");
		}
		companyRepository.delete(company);
	}

}
