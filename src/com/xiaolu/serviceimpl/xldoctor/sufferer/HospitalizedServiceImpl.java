package com.xiaolu.serviceimpl.xldoctor.sufferer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.sufferer.HospitalizedService;
import com.xiaolu.util.PageData;
@Service("hospitalizedServiceImpl")
public class HospitalizedServiceImpl implements HospitalizedService{
	
	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageHospitalized(Page page) throws Exception {

		return (List<PageData>) dao.findForList("HospitalizedMapper.hospitalizedlistPage",page);
	}

	
	public PageData findUserInfoId(PageData pd) throws Exception {
		
		return (PageData) dao.findForObject("HospitalizedMapper.findHospitalizedId",pd);
	}

	
	public void hospitalizedAdd(PageData pd) throws Exception {
		
		dao.save("HospitalizedMapper.hospitalizedAdd", pd);
	}

	
	public void hospitalizedDel(PageData pd) throws Exception {
		String mType=pd.getString("htype");
		if(mType !=null && mType.trim().equals("b")){
			dao.delete("HospitalizedMapper.hospitalizedDeld", pd);
		}else if(mType !=null && mType.trim().equals("t")){
			dao.delete("HospitalizedMapper.hospitalizedDelt", pd);
		}
	}

	
	public void hospitalizedUpd(PageData pd) throws Exception {
		
		dao.update("HospitalizedMapper.hospitalizedUpd", pd);
	}


	public PageData findHdId(PageData pd) throws Exception {

		return (PageData) dao.findForObject("HospitalizedMapper.findHdId",pd);
	}

	/**
	 * 根据医院id查询医生信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getHospitalId(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("DoctorMapper.getHospitalId", pd);
	}
}
