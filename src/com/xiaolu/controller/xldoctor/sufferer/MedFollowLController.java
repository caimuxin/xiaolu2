/**
 * 
 */
package com.xiaolu.controller.xldoctor.sufferer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.sufferer.MedFollowLnglatService;
import com.xiaolu.util.AppUtil;
import com.xiaolu.util.PageData;

/**
 * 随访轨迹
 */
@Controller
@RequestMapping(value="/MedFollowLnglat")
public class MedFollowLController extends BaseController {

	@Resource(name = "medFollowLnglatService")
	private MedFollowLnglatService medFollowLnglatServiceImpl;
	
	/**
	 * 查询所有随访记录
	 */
	@RequestMapping("/listPageMedFollow")
	public ModelAndView listPageMedFollow(Page page)throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		List<PageData> mflist=medFollowLnglatServiceImpl.findLnglat(pd);
		
		
		mv.addObject("pd",pd);
		mv.addObject("mflist",mflist);
		mv.setViewName("doctor/doctormanage/medfollow_lnglat");
		return mv;
	}
	
	/**
	 * 异步加载 查询所有随访记录
	 */
	@RequestMapping("/getMedFollow")
	@ResponseBody
	public Object getMedFollow(Page page){
		Map<String,Object> map = new HashMap<String,Object>();
		
		String errInfo = "success";
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		List<PageData> mflist;
		Map<String,List<PageData>> mapIdList = new HashMap<String,List<PageData>>();
		try {
			mflist = medFollowLnglatServiceImpl.findLnglat(pd);
			for(PageData pdt:mflist){
				if(mapIdList.containsKey(pdt.get("id"))){
					mapIdList.get(pdt.get("id")).add(pdt);
				}else{
					List<PageData> idList = new ArrayList<PageData>();
					idList.add(pdt);
					mapIdList.put(pdt.get("id").toString(),idList);
				}
					
			}
			List<List<PageData>> idType=new ArrayList<List<PageData>>();
			for(String key:mapIdList.keySet()){
				idType.add(mapIdList.get(key));
				pd.put(key, mapIdList.get(key));
			}
			map.put("medFollowList", idType);
			map.put("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
			errInfo ="false";
		}
		
		map.put("result", errInfo);	
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 根据医院id查询医生信息
	 */
	@RequestMapping(value="/userOption")
	@ResponseBody
	public Object findHospitalId(){
		PageData pd=new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		
		try {
			pd=this.getPageData();
			List<PageData> userList=medFollowLnglatServiceImpl.findUserLnglat(pd);
			map.put("list", userList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
}
