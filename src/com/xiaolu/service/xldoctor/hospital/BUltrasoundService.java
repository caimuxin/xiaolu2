package com.xiaolu.service.xldoctor.hospital;

import java.util.List;

import com.xiaolu.entity.xldoctor.Source;
import com.xiaolu.util.PageData;

public interface BUltrasoundService {
	
	public List<PageData> listAllParentOffice() throws Exception;
	
	
	public List<Source> listSourceByOfficeId(PageData pd) throws Exception;
	
	/**
	 * 根据科室id获取主号源信息
	 */
	public List<PageData> findDaySourceByOfficeId(PageData pd) throws Exception;
	
	/**
	 * 根据主号源id获取子号源信息
	 */
	public List<PageData> findTimeSourceByOfficeId(PageData pd) throws Exception;
	
	/**
	 * 查找一个星期同个时间段的号源
	 */
	public List<PageData> findTimeSourceByTime(PageData pd) throws Exception;
	
	/**
	 * 查找科室队列信息
	 */
	public List<PageData> findOfficeQueue(PageData pd) throws Exception;
	
	/**
	 * 查找队列提醒
	 */
	public List<PageData> findQueueAlert(PageData pd) throws Exception;
	
	/**
	 * 统计队列数
	 */
	public Integer getStatQueue(PageData pd) throws Exception;
}
