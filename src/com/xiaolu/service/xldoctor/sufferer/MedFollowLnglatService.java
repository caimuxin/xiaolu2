package com.xiaolu.service.xldoctor.sufferer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.util.PageData;
@Service("medFollowLnglatService")
@SuppressWarnings("unchecked")
public class MedFollowLnglatService {
	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	//添加轨迹点(app调用)
	public void addLnglat(PageData pd) throws Exception{
		dao.save("MedFollowLnglat.addLnglat", pd);
	}
	
	//查询轨迹点
	public List<PageData> findLnglat(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("MedFollowLnglat.medFollowLnglat", pd);
	}
	
	//根据医生查询有轨迹的患者
	public List<PageData> findUserLnglat(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("MedFollowLnglat.findUserByDoctor", pd);
	}
	
	//查询轨迹点App(app调用)
	public List<PageData> findLnglatApp(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("MedFollowLnglat.medFollowLnglatApp", pd);
	}
	
	//添加评价(app调用)
	public void addEvaluate(PageData pd) throws Exception{
		dao.save("MedFollowLnglat.addEvaluate", pd);
	}
	
	//查询评价
	public List<PageData> findFollowEvaluate(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("MedFollowLnglat.medFollowEvaluate", pd);
	}	
	
	//查询产后随访评价
	public List<PageData> findMedFollowD(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("MedFollowLnglat.medFollowD", pd);
	}	
	
	//更新轨迹(app调用)
	public void updateLnglat(PageData pd) throws Exception {
		//dao.update("MedFollowLnglat.updateLnglat", pd);
		dao.update("MedFollowLnglat.updateFollowDF", pd);
	}
}
