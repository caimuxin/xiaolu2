/**
 * 
 */
package com.xiaolu.serviceimpl.xldoctor.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.service.xldoctor.app.EduAppService;
import com.xiaolu.util.PageData;

/**
 * 宣教接口实现
 * @author Xie Leipin
 *
 */
@Service("eduAppServiceImpl")
@SuppressWarnings("unchecked")
public class EduAppServiceImpl implements EduAppService {
	
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;

	@Override
	public List<PageData> findEduArticleByCategory(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("EduContentMapper.listEduArticleByCategory", pd);
	}

	@Override
	public PageData findEduArticleByConId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("EduContentMapper.findEduArticleById", pd);
	}

	@Override
	public void updateEduArticleBrowseByConId(PageData pd) throws Exception {
		dao.update("EduContentMapper.updateEduArticleBrowse", pd);
	}

	@Override
	public List<PageData> findContentById(PageData pd) throws Exception {

		return (List<PageData>) dao.findForList("EduContentMapper.findContentById",pd);
	}

	@Override
	public void updWeiXinPhonto(PageData pd) throws Exception {
		dao.update("UserInfoMapper.updWeiXinPhonto",pd);
	}

}
