package com.xiaolu.service.xldoctor.app;

import java.util.List;

import com.xiaolu.util.PageData;

public interface AdInfoAppService {
	
	/**
	 * 查询所有广告
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findAdInfolist(PageData pd)throws Exception;
	
	public PageData getAdId(PageData pd)throws Exception;

}
