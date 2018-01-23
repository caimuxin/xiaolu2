package com.xiaolu.serviceimpl.xldoctor.education;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xiaolu.dao.DaoSupport;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.education.AdInfoService;
import com.xiaolu.util.PageData;

@Service("adInfoServiceImpl")
public class AdInfoServiceImpl implements AdInfoService{
	
	@Resource(name="daoSupport")
	private DaoSupport dao;

	@SuppressWarnings("unchecked")
	public List<PageData> findAdInfolistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("AdInfoMapper.findAdInfolistPage",page);
	}

	public void deleteAdInfo(String[] AD_ID) throws Exception {
		dao.delete("AdInfoMapper.deleteAdInfo", AD_ID);
	}

	@Override
	public void delAdInfo(PageData pd) throws Exception {
		dao.delete("AdInfoMapper.delAdInfo",pd);
	}

	@Override
	public void addAdInfo(PageData pd) throws Exception {

		dao.save("AdInfoMapper.addAdInfo",pd);
	}

	@Override
	public void updAdInfo(PageData pd) throws Exception {
		dao.update("AdInfoMapper.updAdInfo",pd);
	}

	@Override
	public PageData getAdId(PageData pd) throws Exception {

		return (PageData) dao.findForObject("AdInfoMapper.getAdId",pd);
	}

	@Override
	public void delPurl(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("AdInfoMapper.delPurl",pd);
	}

	@Override
	public void delSuburl(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("AdInfoMapper.delSuburl",pd);
	}
}
