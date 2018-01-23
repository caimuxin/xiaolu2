package com.xiaolu.service.xldoctor.sufferer;

import java.util.List;

import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

public interface UoutpatientService {
	/**
	 * 查询门诊信息
	 */
	public List<PageData> findUoutpatient(PageData pd)throws Exception;
	
	/**
	 *添加门诊信息
	 */
	
	public void uOutpatientAdd(PageData pd)throws Exception;

	
	/**
	 * 修改门诊信息
	 */
	public void uoutpatientaUpd(PageData pd)throws Exception;
	
	
	/**
	 * 删除门诊信息
	 */
	public void uoutpatientdel(PageData pd)throws Exception;
	/**
	 * 删除门诊图片
	 */
	public void oAttachmentDel(PageData pd)throws Exception;
}
