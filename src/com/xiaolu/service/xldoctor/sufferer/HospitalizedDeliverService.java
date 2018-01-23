package com.xiaolu.service.xldoctor.sufferer;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.util.PageData;

@Service("hospitalizedDeliverService")
public class HospitalizedDeliverService {
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	public void hospitalizedDeliverAdd(PageData pd) throws Exception {
		dao.save("HospitalizedDeliverMapper.hospitalizedDeliverAdd",pd);
	}

	public void hospitalizedDeliverDel(PageData pd) throws Exception {
		dao.delete("HospitalizedDeliverMapper.hospitalizedDeliverDel",pd);
	}

	public void hospitalizedDeliverUpd(PageData pd) throws Exception {
		dao.update("HospitalizedDeliverMapper.hospitalizedDeliverUpd", pd);
	}
	
	/**
	 * 图片的删除
	 * @param pd
	 * @throws Exception
	 */
	public void attachmentDel(PageData pd) throws Exception {
		dao.update("HospitalizedDeliverMapper.attachmentDel", pd);
	}
	
}
