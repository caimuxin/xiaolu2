package com.xiaolu.serviceimpl.xldoctor.sufferer;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.service.xldoctor.sufferer.HospitalizedTreatService;
import com.xiaolu.util.PageData;
@Service("hospitalizedTreatServiceImpl")
public class HospitalizedTreatServiceImpl implements HospitalizedTreatService{
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	@Override
	public void hospitalizedTreatAdd(PageData pd) throws Exception {
		dao.save("hospitalizedTreatMapper.hospitalizedTreatAdd",pd);
	}

	@Override
	public void hospitalizedTreatDel(PageData pd) throws Exception {
		dao.delete("hospitalizedTreatMapper.hospitalizedTreatDel",pd);
	}

	@Override
	public void hospitalizedTreatUpd(PageData pd) throws Exception {
		dao.update("hospitalizedTreatMapper.hospitalizedTreatUpd", pd);
	}

	@Override
	public void attachmentDel(PageData pd) throws Exception {
		dao.update("hospitalizedTreatMapper.attachmentDel", pd);
	}
}
