package com.xiaolu.service.xldoctor.hospital;

import java.util.List;

import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

public interface HospitalService {
	/**
	 * 医院列表信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listPdPageHospital(Page page)throws Exception;
	
	public PageData findByHospitalId(PageData pd)throws Exception;
	
	/**
	*修改医院信息
	*/
	public void editHospital(PageData pd)throws Exception;
	
	/**
	* 通过HospitalName获取数据
	*/
	public PageData findByHospitalName(PageData pd)throws Exception;
	
	/**
	* 新增医院信息
	*/
	public void addHospital(PageData pd)throws Exception;
	
	/**
	 * 删除信息
	 */
	public void deleteHospital(PageData pd)throws Exception;
	
	/**
	* 批量删除医院信息
	*/
	public void deleteAllH(String[] ids)throws Exception;
	
	/**
	*医院列表(全部)
	*/
	public List<PageData> listAllHospital(PageData pd)throws Exception;
	
	/**
	 * 修改时 删除图片
	 */
	public void delHospitalPi(PageData pd)throws Exception;
	
	/**
	 * 根据医院id查询医生信息
	 */
	public List<PageData> getHospitalId(PageData pd) throws Exception;
}
