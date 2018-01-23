package com.xiaolu.service.xldoctor.sufferer;

import java.util.List;

import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

public interface HospitalizedService {
	
	public List<PageData> listPdPageHospitalized(Page page)throws Exception;
	
	public PageData findUserInfoId(PageData pd)throws Exception;
	
	public PageData findHdId(PageData pd)throws Exception;

	public void hospitalizedAdd(PageData pd)throws Exception;
	
	public void hospitalizedDel(PageData pd)throws Exception;
	
	public void hospitalizedUpd (PageData pd)throws Exception;
	
	/**
	 * 根据医院id查询医生信息
	 */
	public List<PageData> getHospitalId(PageData pd) throws Exception;
}
