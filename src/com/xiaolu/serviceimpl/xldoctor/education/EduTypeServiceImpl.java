package com.xiaolu.serviceimpl.xldoctor.education;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xiaolu.dao.DaoSupport;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.education.EduTypeService;
import com.xiaolu.util.PageData;

@Service("eduTypeServiceImpl")
public class EduTypeServiceImpl implements EduTypeService{
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	/**
	 * 查询所有类别信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageEduType(Page page) throws Exception {

		return (List<PageData>) dao.findForList("EduTypeMapper.findEduTypelistPage",page);
	}
	
	/**
	 * 新增类别
	 */
	public void addEduType(PageData pd) throws Exception {

		 dao.save("EduTypeMapper.addEduType",pd);
	}
	
	/**
	 * 修改类别
	 */
	public void updEduType(PageData pd) throws Exception {
		
		dao.update("EduTypeMapper.updEduType", pd);
	}

	/**
	 * 修改类别的状态
	 */
	public void updEduState(PageData pd) throws Exception {

		dao.update("EduTypeMapper.updEduState", pd);
	}

	/**
	 * 根据Id查询类别信息
	 */
	public PageData getEduTypeId(PageData pd) throws Exception {
		
		return (PageData) dao.findForObject("EduTypeMapper.getEduTypeId", pd);
	}

	
	/**
	 * 查询父类
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getEduTypeGrade(PageData pd) throws Exception {

		return (List<PageData>) dao.findForList("EduTypeMapper.getEduTypeFid",pd);
	}

	/**
	 * 根据name查询类别信息
	 */
	public PageData getEduTypeName(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("EduTypeMapper.getEduTypeName",pd);
	}
}
