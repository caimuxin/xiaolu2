package com.xiaolu.service.xldoctor.sufferer;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xiaolu.dao.DaoSupport;
import com.xiaolu.util.PageData;

@Service("MedFollowdService")
public class MedFollowdService {

	@Resource(name="daoSupport")
	private DaoSupport dao;

	public void medFollowDAdd(PageData pd) throws Exception {
		dao.save("MedFollowDMapper.medFollowDAdd",pd);
	}

	public void medFollowDDel(PageData pd) throws Exception {
		dao.delete("MedFollowDMapper.medFollowDDel",pd);
	}

	public void medFollowDUpd(PageData pd) throws Exception {
		dao.update("MedFollowDMapper.medFollowDUpd", pd);
	}
}
