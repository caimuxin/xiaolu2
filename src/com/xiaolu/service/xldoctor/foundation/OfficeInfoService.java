package com.xiaolu.service.xldoctor.foundation;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

@Service("officeInfoSerivceImpl")
public class OfficeInfoService {
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	/**
	 *查找列表数据 
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageOfficeInit(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.officeInitlistPage", page);
	}
	
	/**
	 *查找列表数据 
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageTemplet(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.findTempletNamelistPage", page);
	}
	
	/**
	* officeInit获取数据
	*/
	public PageData findOfficeInit(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OfficeMapper.findOfficeInit", pd);
	}
	
	/**
	* 新增科室
	*/
	public void addOfficeInit(PageData pd)throws Exception{
		dao.save("OfficeMapper.officeInitAdd", pd);
	}
	
	/**
	* 修改用户
	*/
	public void editOfficeInit(PageData pd)throws Exception{
		dao.update("OfficeMapper.editOfficeInit", pd);
	}
	/**
	* 删除用户
	*/
	public void deleteOfficeInit(PageData pd)throws Exception{
		dao.delete("OfficeMapper.deleteOfficeInit", pd);
	}
	
	@SuppressWarnings("unchecked")
	public List<PageData> findTemplet(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.findTempletTree", pd);
	}
	
	/**
	 * 科室模板基础树
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findBaseTree(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.findBaseTree", pd);
	}
	
	/**
	 * 科室模板添加节点
	 */
	public Object saveOfficeTemplet(List<PageData> list) throws Exception{
		return dao.batchSave("OfficeMapper.saveTemplet", list);
	}
	
	/**
	 * 科室模板删除节点
	 */
	public Object deleteOfficeTemplet(List<PageData> list) throws Exception{
		return dao.batchSave("OfficeMapper.deleteOfficeTemplet", list);
	}
}
