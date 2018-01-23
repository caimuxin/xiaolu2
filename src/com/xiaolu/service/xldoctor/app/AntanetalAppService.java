package com.xiaolu.service.xldoctor.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.util.PageData;

@Service("antanetalAppServiceImpl")
@SuppressWarnings("unchecked")
public class AntanetalAppService {
	
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	/**
	 * 根据医院Id获取科室id号源信息
	 */
	
	public List<PageData> findOfficeByHospitalId(PageData pd)throws Exception {
		return (List<PageData>)dao.findForList("OfficeMapper.findOfficeByHospitalId", pd);
	}
	
	/**
	 * 科室医生信息
	 */
	public List<PageData> findOfficeDoctor(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.findDoctorInfo", pd);
	}
	
	/**
	 * 医生周号源信息
	 */
	public List<PageData> findDoctorWeekSource(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.findDoctorWeekSource", pd);
	}
	
	/**
	 * 医生日时间段号源信息
	 */
	public List<PageData> findDoctorDaySource(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.findDoctorDaySource", pd);
	}
	
	/**
	* 新增预约
	*/
	public void saveOrder(PageData pd)throws Exception{
		dao.save("BUltrasoundMapper.addOrder", pd);
	}
}
