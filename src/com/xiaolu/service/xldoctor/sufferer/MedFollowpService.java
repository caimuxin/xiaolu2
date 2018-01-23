package com.xiaolu.service.xldoctor.sufferer;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.util.PageData;
@Service("MedFollowpService")
public class MedFollowpService {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	public void medFollowPAdd(PageData pd) throws Exception {
		dao.save("MedFollowPMapper.medFollowPAdd",pd);
	}

	public void medFollowPDel(PageData pd) throws Exception {
		dao.delete("MedFollowPMapper.medFollowPDel",pd);
	}

	public void medFollowPUpd(PageData pd) throws Exception {
		dao.update("MedFollowPMapper.medFollowPUpd", pd);
	}
	
	public void attachmentDel(PageData pd) throws Exception {
		dao.update("MedFollowPMapper.attachmentDel", pd);
	}
}
