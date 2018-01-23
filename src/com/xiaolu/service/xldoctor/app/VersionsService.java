package com.xiaolu.service.xldoctor.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.util.PageData;

/**
 * 版本控制接口
 *
 */
@Service("versionsService")
public class VersionsService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//获取版本接口
	public PageData findVersion(PageData pd) throws Exception{
		return (PageData) dao.findForObject("VersionsMapper.findVersion", pd);
	}
	
	//获取历史版本接口
	@SuppressWarnings("unchecked")
	public List<PageData> findVersionHi(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("VersionsMapper.findVersionHi", pd);
	}
}
