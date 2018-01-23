package com.xiaolu.serviceimpl.xldoctor.sufferer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.sufferer.UoutpatientService;
import com.xiaolu.util.PageData;
@Service("UoutpatientServiceImpl")
public class UoutpatientServiceImpl implements UoutpatientService{
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	@SuppressWarnings("unchecked")
	public List<PageData> findUoutpatient(PageData pd) throws Exception {

		return (List<PageData>) dao.findForList("UoutpatientMapper.findUoutpatient",pd);
	}

	public void uOutpatientAdd(PageData pd) throws Exception {
		dao.save("UoutpatientMapper.uOutpatientAdd",pd);
	}

	@Override
	public void uoutpatientaUpd(PageData pd) throws Exception {
		dao.update("UoutpatientMapper.uOutpatientUpd",pd);
		
	}

	@Override
	public void uoutpatientdel(PageData pd) throws Exception {
		dao.delete("UoutpatientMapper.uOutpatientDel",pd);
	}

	@Override
	public void oAttachmentDel(PageData pd) throws Exception {
		dao.update("UoutpatientMapper.oAttachmentDel",pd);
	}
}
