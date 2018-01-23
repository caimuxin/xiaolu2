package com.xiaolu.service.xldoctor.doctor;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

@Service("doctorManageServiceImpl")
@SuppressWarnings("unchecked")
public class DoctorManageService {
	
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	public List<PageData> docotrInfoList(Page pd) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.doctorlistPage", pd);
	}
	
	/**
	 * 医院下拉框信息
	 */
	public List<PageData> hospitalOption(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("HospitalMapper.hospitalOption", pd);
	}
	
	/**
	 * 医院下拉框信息
	 */
	public List<PageData> officeOption(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("OfficeMapper.findOfficeOption", pd);
	}
	
	/**
	 * 批量删除患者信息
	 */
	public void doctorInfoDelAll(String[] ids) throws Exception {
		dao.delete("DoctorMapper.doctorInfoDelAll",ids);
	}
	
	/**
	 * excel保存
	 * @throws Exception 
	 */
	
	public void saveDE(PageData pd) throws Exception{
		dao.save("DoctorMapper.saveDoctorExel",pd);
	}
	
	/**
	 * 保存
	 * @throws Exception 
	 */
	
	public void saveDoctor(PageData pd) throws Exception{
		dao.save("DoctorMapper.saveDoctorInfo",pd);
		dao.save("DoctorMapper.saveDocusers",pd);
	}
	
	/**
	 * 根据id查询医生信息
	 */
	public PageData findDoctorId(PageData pd)throws Exception{
		
		return (PageData) dao.findForObject("DoctorMapper.findDoctorId",pd);
	}
	
	/**
	 * 修改医生信息
	 */
	public void updDoctor(PageData pd) throws Exception{
		dao.save("DoctorMapper.updDoctor",pd);
	}
	
	/**
	 * 删除医生头像
	 * 
	 */
	public void delDoctorPhoto(PageData pd) throws Exception{
		dao.save("DoctorMapper.delDoctorPhoto",pd);
	}
	
	/**
	 * 查询医生所对应的患者信息
	 */
	public List<PageData> diseaseListPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.diseaselistPage",page);
	}
	
	
	/**
	 * 根据医院id查询医生信息
	 */
	public List<PageData> getHospitalId(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.getHospitalId", pd);
	}
}
