/**
 * 
 */
package com.xiaolu.controller.app.appuser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.serviceimpl.xldoctor.app.AdInfoAppServiceImpl;
import com.xiaolu.serviceimpl.xldoctor.app.EduAppServiceImpl;
import com.xiaolu.util.PageData;

/**
 * 宣教
 * @author Xie Leipin
 *
 */
@Controller
@RequestMapping(value="/appAdInfo")
public class AdInfoAppController extends BaseController {

	@Resource(name = "adInfoAppServiceImpl")
	private AdInfoAppServiceImpl adInfoAppServiceImpl;
	
	@RequestMapping(value="/getAdInfos")
	@ResponseBody
	public Object getAdInfos(String sectionType,String hospitalId){
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			dataList = adInfoAppServiceImpl.findAdInfolist(pd);
			map.put("adInfoList", dataList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	@RequestMapping(value="/getAdSubInfoArticle")
	@ResponseBody
	public ModelAndView getAdSubInfoArticle(String adId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd.put("adId", adId);
		try{
			PageData pdResult = adInfoAppServiceImpl.getAdId(pd);
			map.put("adInfo", pdResult);
			map.put("status", 1);
			ModelAndView mv = this.getModelAndView();
			if (pdResult == null) {
				pdResult = new PageData();
				pdResult.put("adSubInfo", "文章已被删除!");
			} 
			mv.setViewName("doctor/app/app_adinfo_article");
			mv.addObject("msg", "adInfoArticleDetail");
			mv.addObject("pd", pdResult);
			return mv;
		} catch(Exception e) {
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("doctor/app/app_adinfo_article");
		return mv;
	}
	
	/*
	 * 
		mv.setViewName("doctor/hospital/hospital_detail");
		mv.addObject("msg", "hospitalDetail");
		mv.addObject("pd", pd);
	 */
}
