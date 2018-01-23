package com.xiaolu.serviceimpl.xldoctor.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.entity.xldoctor.Source;
import com.xiaolu.service.xldoctor.app.BUltrasoundAppService;
import com.xiaolu.util.PageData;

@Service("bUltrasoundAppServiceImpl")
@SuppressWarnings("unchecked")
public class BUltrasoundAppServiceImpl implements BUltrasoundAppService{
	
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	/**
	 * 根据医院Id获取科室id号源信息
	 */
	@Override
	public List<PageData> findOfficeByHospitalId(PageData pd)throws Exception {
		return (List<PageData>)dao.findForList("OfficeMapper.findOfficeByHospitalId", pd);
	}

	/**
	 * 根据科室id获取主号源信息
	 */
	@Override
	public List<Source> findMainSourceByOfficeId(PageData pd) throws Exception {
		return (List<Source>)dao.findForList("BUltrasoundMapper.findMainSourceByOfficeId", pd);
	}
	
	/**
	 * 根据主号源id获取子号源信息
	 */
	@Override
	public List<PageData> findSubSourceByOfficeId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("BUltrasoundMapper.findSubSourceByOfficeId", pd);
	}
	
	public List<Source> listAllSourceOfSub(PageData pd) throws Exception {
		List<Source> rl = this.findMainSourceByOfficeId(pd);
		PageData temppd = new PageData();
		for(Source data : rl){
			temppd.put("sourceId", data.getSourceId());
			List<PageData> subList = this.findSubSourceByOfficeId(temppd);
			data.setSubSource(subList);
		}
		return rl;
	}
	
	/**
	* 新增预约
	*/
	public void saveOrder(PageData pd)throws Exception{
		dao.save("BUltrasoundMapper.addOrder", pd);
	}
	
	public PageData findTSourceusing(PageData pd) throws Exception{
		return (PageData) dao.findForObject("BUltrasoundMapper.findSourceUsing", pd);
	}
}
