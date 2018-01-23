package com.xiaolu.service.xldoctor.education;

import java.util.List;

import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

public interface AdInfoService {
	
	/**
	 * 查询所有广告
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAdInfolistPage(Page page)throws Exception;
	
	/**
	 * 批量删除
	 * @param CONTENT_ID
	 * @throws Exception
	 */
	public void deleteAdInfo(String [] AD_ID)throws Exception;
	
	public void delAdInfo(PageData pd)throws Exception;
	
	public void addAdInfo(PageData pd)throws Exception;
	
	public void updAdInfo(PageData pd)throws Exception;
	
	public PageData getAdId(PageData pd)throws Exception;
	
	public void delPurl(PageData pd)throws Exception;
	
	public void delSuburl(PageData pd)throws Exception;

}
