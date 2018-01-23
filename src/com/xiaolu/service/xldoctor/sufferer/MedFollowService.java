package com.xiaolu.service.xldoctor.sufferer;

import java.util.List;

import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

public interface MedFollowService {

	public List<PageData> listPageMedFollow(Page page)throws Exception;
	
	public PageData findMedFollowId(PageData pd)throws Exception;
	
	public void medFollowAdd(PageData pd)throws Exception;
	
	public void medFollowDel(PageData pd)throws Exception;
	
	public void medFollowUpd (PageData pd)throws Exception;
	
	public PageData findMedFollowPId(PageData pd)throws Exception;
	
	public PageData findMedFollowDId(PageData pd)throws Exception;
}
