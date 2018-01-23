package com.xiaolu.serviceimpl.xldoctor.hospital;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.entity.xldoctor.Source;
import com.xiaolu.service.xldoctor.hospital.BUltrasoundService;
import com.xiaolu.util.PageData;
@Service("bUltrasoundServiceImpl")
@SuppressWarnings("unchecked")
public class BUltrasoundServiceImpl implements BUltrasoundService{
	
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	/**
	 * 查找所有父级科室
	 */
	public List<PageData> listAllParentOffice() throws Exception {
		PageData pd = new PageData();
		pd.put("type", "b");
		pd.put("officePId", 0);
		return (List<PageData>) dao.findForList("OfficeMapper.findAllParentOffice", pd);
	}
	
	/**
	 * 根据科室id获取主号源信息
	 */
	
	@Override
	public List<PageData> findDaySourceByOfficeId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("BUltrasoundMapper.findDaySourceByOfficeId", pd);
	}
	
	/**
	 * 根据主号源id获取子号源信息
	 */
	@Override
	public List<PageData> findTimeSourceByOfficeId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("BUltrasoundMapper.findTimeSourceByOfficeId", pd);
	}
	
	@Override
	public List<Source> listSourceByOfficeId(PageData pd) throws Exception {
		return (List<Source>) dao.findForList("BUltrasoundMapper.findSourceByOfficeId", pd);
	}
	
	/**
	 * 查找一个星期同个时间段的号源
	 */
	@Override
	public List<PageData> findTimeSourceByTime(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("BUltrasoundMapper.findTimeSourceByTime", pd);
	}
	
	/**
	 * 查找科室队列信息
	 */
	@Override
	public List<PageData> findOfficeQueue(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("BUltrasoundMapper.findOfficeQueue", pd);
	}
	
	/**
	 * 查找队列提醒
	 */
	@Override
	public List<PageData> findQueueAlert(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("BUltrasoundMapper.findQueueAlert", pd);
	}

	@Override
	public Integer getStatQueue(PageData pd) throws Exception {
		return (Integer) dao.findForObject("BUltrasoundMapper.getStatQueue", pd);
	}
	
}
