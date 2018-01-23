package com.xiaolu.service.xldoctor.education;

import java.util.List;

import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

public interface EduTypeService {
	
	/**
	 * 查询所有类别信息
	 */
	public List<PageData> listPdPageEduType(Page page) throws Exception;
	
	/**
	 * 查询父类
	 */
	public List<PageData> getEduTypeGrade(PageData pd)throws Exception;
	
	/**
	 * 根据Id查询类别信息
	 */
	public PageData getEduTypeId(PageData pd)throws Exception;
	
	/**
	 * 新增类别
	 */
	public void addEduType(PageData pd)throws Exception;
	
	/**
	 * 修改类别
	 */
	public void updEduType(PageData pd)throws Exception;
	
	/**
	 * 修改类别的状态
	 */
	public void updEduState(PageData pd)throws Exception;
	
	/**
	 * 根据name查询类别信息
	 */
	public PageData getEduTypeName(PageData pd)throws Exception;

}
