package com.xiaolu.service.xldoctor.hospital;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;
@Service("antanetalExamServiceImpl")

public class AntanetalExamService {
	
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;

	/**
	 * 查找科室
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findAllOffice(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OfficeMapper.findAllOffice", pd);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageDoctor(Page page) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.findDoctorInfoWeblistPage", page);
	}
	/**
	 *根据时间段 查找每日相同时间段的号源 
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findDoctorTSourceByTime(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.findDoctorSourceBytime", pd);
	}
	
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageHospital(Page page) throws Exception {
		return (List<PageData>) dao.findForList("HospitalMapper.hospitallistPage", page);
	}
}
