package com.xiaolu.service.xldoctor.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.util.PageData;

@Service("hospitalAppServiceImpl")
@SuppressWarnings("unchecked")
public class HospitalAppService {

	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	/**
	 * 根据Id查找医院信息
	 */
	public PageData findHospitalInfoById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("HospitalMapper.hospitalInfoApp", pd);
	}
	
	/**
	 * 默认医院
	 * @throws Exception 
	 */
	public List<PageData> findHospitalDefaulth(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("HospitalMapper.hospitalDefaultApp", pd);
	}
	
	/**
	 * 根据名称或代码查找医院
	 * @throws Exception 
	 */
	
	
	public List<PageData> findHospitalList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("HospitalMapper.hospitalNameApp", pd);
	}
	
	/**
	 * 医生列表接口
	 * @throws Exception 
	 */
	public List<PageData> findDoctorList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.findDoctorListInfo", pd);
	}
	
	/**
	 * 医生详情接口
	 * @throws Exception 
	 */
	public PageData findDoctorDetail(PageData pd) throws Exception{
		return (PageData)dao.findForObject("DoctorMapper.findDoctorDetail", pd);
	}
	
	/**
	 * 我的医生信息
	 * @throws Exception 
	 */
	public List<PageData> findMyDoctorInfo(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("DoctorMapper.findMyDoctorInfo", pd);
	}
	
	/**
	 * 我的关注医生
	 */
	public void saveCollection(PageData pd) throws Exception{
		dao.save("UserAppMapper.saveCollection", pd);
	}
	
}
