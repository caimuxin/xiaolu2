package com.xiaolu.serviceimpl.xldoctor.app;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xiaolu.dao.DaoSupport;
import com.xiaolu.util.PageData;

@Service("MedFollowAppServiceImpl")
public class MedFollowAppServiceImpl{
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	public int medFllowWeekCount(PageData pd) throws Exception  {
		// TODO to-generated method stub
		return (Integer) dao.findForObject("MedFollowMapper.medFllowWeekCount",pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> medfllowDayList(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("MedFollowMapper.medfllowDayList", pd);
	}

}
