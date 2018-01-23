package com.xiaolu.service.xldoctor.app;

import java.util.List;

import com.xiaolu.entity.xldoctor.Source;
import com.xiaolu.util.PageData;

/**
 * appb超接口
 * @author muxin
 *
 */
public interface BUltrasoundAppService {
	
	/*
	* 通过医院Id获取科室
	*/
	public List<PageData> findOfficeByHospitalId(PageData pd)throws Exception;
	
	/*
	* 通过科室Id获取主号源信息
	*/
	public List<Source> findMainSourceByOfficeId(PageData pd) throws Exception;
	
	/*
	* 通过主号源Id获取子号源信息
	*/
	public List<PageData> findSubSourceByOfficeId(PageData pd) throws Exception;
	
	/*
	* 获取所有号源信息
	*/
	public List<Source> listAllSourceOfSub(PageData pd) throws Exception;
	
	/*
	* 新增预约
	*/
	public void saveOrder(PageData pd)throws Exception;
	
	/*
	 * 查询号源使用情况
	 */
	public PageData findTSourceusing(PageData pd) throws Exception;
}
