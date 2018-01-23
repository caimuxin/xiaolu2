package com.xiaolu.service.xldoctor.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.util.PageData;
@Service("wristStrapService")
public class WristStrapService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//查询计步数据
	@SuppressWarnings("unchecked")
	public List<PageData> findWeekWristStrap(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("WristStrapMapper.findWristStrap", pd);
	}
	
	//查询计步数据 月
	@SuppressWarnings("unchecked")
	public List<PageData> findWeekWristStrapMonth(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("WristStrapMapper.findWristStrapMonth", pd);
	}
	
	@SuppressWarnings("unchecked")
	public List<PageData> findWeekWristStrapByUidAndDate(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("WristStrapMapper.findWristStrapByUidAndDate", pd);
	}
	
	public void saveWristStrap(PageData pd) throws Exception{
		dao.save("WristStrapMapper.addWristStrap", pd);
	}
	
	public void updateWristStrap(PageData pd) throws Exception{
		dao.update("WristStrapMapper.updateWristStrap", pd);
	}
}
