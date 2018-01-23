package com.xiaolu.serviceimpl.xldoctor.education;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.education.EduContentService;
import com.xiaolu.util.PageData;

@Service("eduContentServiceImpl")
public class EduContentServiceImpl implements EduContentService{

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageContent(Page page) throws Exception {

		return (List<PageData>) dao.findForList("EduContentMapper.contentlistPage", page);
		
	}

	@Override
	public void delContent(String[] CONTENT_ID) throws Exception {

		dao.delete("EduContentMapper.deleteContent",CONTENT_ID);
	}

	@Override
	public void addEduContent(PageData pd) throws Exception {
		dao.save("EduContentMapper.addEduContent",pd);
	}

	@Override
	public PageData getContentName(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EduContentMapper.getContentName",pd);
	}

	@Override
	public void updEduContent(PageData pd) throws Exception {
		dao.update("EduContentMapper.updEduContent",pd);
	}

	@Override
	public PageData getContentId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData) dao.findForObject("EduContentMapper.getContentId",pd);
	}

	@Override
	public void delEduPhoto(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("EduContentMapper.delEduPhoto",pd);
	}
}
