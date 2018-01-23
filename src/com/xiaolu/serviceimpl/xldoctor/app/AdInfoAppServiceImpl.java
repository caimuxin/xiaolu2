package com.xiaolu.serviceimpl.xldoctor.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.service.xldoctor.app.AdInfoAppService;
import com.xiaolu.util.PageData;

@Service("adInfoAppServiceImpl")
public class AdInfoAppServiceImpl implements AdInfoAppService{
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	@Override
	public PageData getAdId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AdInfoMapper.getAdByIdForMobile",pd);
	}

	@Override
	public List<PageData> findAdInfolist(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("AdInfoMapper.findAdInfoForMobile", pd);
	}
}
