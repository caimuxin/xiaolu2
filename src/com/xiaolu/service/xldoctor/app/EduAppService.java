package com.xiaolu.service.xldoctor.app;

import java.util.List;

import com.xiaolu.util.PageData;

/**
 * app宣教接口
 * @author Xie Leipin
 *
 */
public interface EduAppService {
	
	/*
	* 通过eduId获取文章列表
	*/
	public List<PageData> findEduArticleByCategory(PageData pd)throws Exception;
	
	/*
	* 通过文章Id获取文章具体信息
	*/
	public PageData findEduArticleByConId(PageData pd) throws Exception;
	
	/*
	* 通过文章Id获取文章具体信息
	*/
	public void updateEduArticleBrowseByConId(PageData pd) throws Exception;
	
	/**
	 * 通过id获取文章信息 微信端
	 */
	public List<PageData> findContentById(PageData pd)throws Exception;
	
	
	/**
	 * 修改微信头像
	 * 
	 */
	public void updWeiXinPhonto(PageData pd)throws Exception;
}
