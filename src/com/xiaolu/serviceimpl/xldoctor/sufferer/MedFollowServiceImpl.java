package com.xiaolu.serviceimpl.xldoctor.sufferer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.sufferer.MedFollowService;
import com.xiaolu.util.PageData;
@Service("MedFollowServiceImpl")
public class MedFollowServiceImpl implements MedFollowService{
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	@SuppressWarnings("unchecked")
	public List<PageData> listPageMedFollow(Page page) throws Exception {
		
		return (List<PageData>) dao.findForList("MedFollowMapper.medFollowlistPage",page);
	}

	public PageData findMedFollowId(PageData pd) throws Exception {
		
		return (PageData) dao.findForObject("MedFollowMapper.findMedFollowId",pd);
	}

	public void medFollowAdd(PageData pd) throws Exception {
		dao.save("MedFollowMapper.medFollowAdd",pd);
	}

	public void medFollowDel(PageData pd) throws Exception {
		dao.delete("MedFollowMapper.medFollowDel",pd);
	}

	public void medFollowUpd(PageData pd) throws Exception {
		dao.update("MedFollowMapper.medFollowUpd",pd);
	}

	@Override
	public PageData findMedFollowPId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("MedFollowMapper.findMedFollowPId",pd);
	}

	@Override
	public PageData findMedFollowDId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("MedFollowMapper.findMedFollowDId",pd);
	}

}
