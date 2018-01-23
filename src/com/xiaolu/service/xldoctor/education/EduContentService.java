package com.xiaolu.service.xldoctor.education;

import java.util.List;

import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

public interface EduContentService {
	
	/**
	 * 条件查询宣教内容信息
	 */
	public List<PageData> listPdPageContent(Page page)throws Exception;
	
	/**
	 * 批量删除
	 * @param CONTENT_ID
	 * @throws Exception
	 */
	public void delContent(String [] CONTENT_ID)throws Exception;
	
	
	/**
	 * 新增宣教内容信息
	 */
	public void addEduContent(PageData pd)throws Exception;
	
	 
	/**
	* 修改宣教内容信息
	*/
	public void updEduContent(PageData pd)throws Exception;
	
	/**
	 * 根据文章标题查询文章信息
	 */
	public PageData getContentName(PageData pd)throws Exception;
	
	
	/**
	 * 根据文章ID查询文章信息
	 */
	public PageData getContentId(PageData pd)throws Exception;
	
	
	/**
	 *删除图片
	 * 
	 */
	public void delEduPhoto(PageData pd)throws Exception;
}
