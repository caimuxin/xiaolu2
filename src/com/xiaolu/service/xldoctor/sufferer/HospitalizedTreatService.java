package com.xiaolu.service.xldoctor.sufferer;

import com.xiaolu.util.PageData;

public interface HospitalizedTreatService {
	
	public void hospitalizedTreatAdd(PageData pd)throws Exception;
	
	public void hospitalizedTreatDel(PageData pd)throws Exception;
	
	public void hospitalizedTreatUpd (PageData pd)throws Exception;
	
	/**
	 * 删除图片
	 */
	public void attachmentDel(PageData pd)throws Exception;

}
