package com.xiaolu.serviceimpl.xldoctor.hospital;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.hospital.HospitalService;
import com.xiaolu.util.PageData;
@Service("hospitalServiceImpl")
public class HospitalServiceImpl implements HospitalService{
	
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageHospital(Page page) throws Exception {
		return (List<PageData>) dao.findForList("HospitalMapper.hospitallistPage", page);
	}
	
	/**
	* 通过id获取数据
	*/
	public PageData findByHospitalId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("HospitalMapper.findByHospitalId", pd);
	}
	
	/**
	* 修改用户
	*/
	public void editHospital(PageData pd)throws Exception{
		String tabid = pd.get("tabId").toString();
		if(tabid !=null && tabid.equals("1")){
			dao.update("HospitalMapper.hospitalEditDetailF", pd);
		}else if(tabid !=null && tabid.equals("2")){
			dao.update("HospitalMapper.hospitalEditDetailTwo", pd);
		}else if(tabid !=null && tabid.equals("3")){
			dao.update("HospitalMapper.hospitalEditDetailThree", pd);
		}else if(tabid !=null && tabid.equals("edit")){
			dao.update("HospitalMapper.hospitalEdit", pd);
		}
	}
	
	/**
	* 通过HospitalName获取数据
	*/
	public PageData findByHospitalName(PageData pd)throws Exception{
		return (PageData)dao.findForObject("HospitalMapper.findByHospitalName", pd);
	}
	
	/**
	* 保存用户
	*/
	public void addHospital(PageData pd)throws Exception{
		dao.save("HospitalMapper.hospitalAdd", pd);
	}
	
	/**
	 * 删除医院信息
	 */
	public void deleteHospital(PageData pd)throws Exception{
		dao.delete("HospitalMapper.hospitalDelete", pd);
	}
	
	/**
	* 批量删除用户
	*/
	public void deleteAllH(String[] ids)throws Exception{
		dao.delete("HospitalMapper.hospitalDeleteAll", ids);
	}
	
	/**
	*用户列表(全部)
	*/
	@SuppressWarnings("unchecked")
	public List<PageData> listAllHospital(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("HospitalMapper.listAllHospital", pd);
	}
	
	/*
	* 删除图片
	*/
	public void delHospitalPi(PageData pd)throws Exception{
			dao.update("HospitalMapper.delHospitalp", pd);
	}

	/**
	 * 根据医院id查询医生信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getHospitalId(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.getHospitalId", pd);
	}
}
