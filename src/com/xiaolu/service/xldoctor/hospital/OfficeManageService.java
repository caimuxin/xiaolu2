package com.xiaolu.service.xldoctor.hospital;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.util.PageData;

@Service("officeManageServiceImpl")
@SuppressWarnings("unchecked")
public class OfficeManageService{
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	/**
	 * 查找科室
	 */
	public List<PageData> findAllOffice(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.findOfficeAndHospital", pd);
	}
	
	public List<PageData> findAllHospital(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.findAllHospital", pd);
	}
	
	
	public List<PageData> findAllOfficeTemplet() throws Exception {
		PageData pd = null;
		return (List<PageData>) dao.findForList("OfficeMapper.findOfficeTempletName", pd);
	}
	
	public List<PageData> findTemplet(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.findTempletTree", pd);
	}
	
	/**
	 * 科室模板基础树
	 */
	public List<PageData> findOfficeInit(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.findBaseTreeForOM", pd);
	}
	
	/**
	 * 科室模板基础树
	 */
	public List<PageData> findOfficeInitByTempletName(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.findBaseTree", pd);
	}
	

	/**
	 * officeInfo添加节点
	 */
	public Object saveOfficeInfo(List<PageData> list) throws Exception{
		return dao.batchSave("OfficeMapper.saveOfficeInfo", list);
	}
	
	/**
	 * officeInfo删除节点
	 */
	public Object deleteOfficeInfo(List<PageData> list) throws Exception{
		return dao.batchDelete("OfficeMapper.deleteOfficeInfo", list);
	}
}
