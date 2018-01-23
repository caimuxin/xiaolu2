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

import com.alibaba.fastjson.JSON;
import com.xiaolu.controller.base.BaseController;
import com.xiaolu.service.xldoctor.sufferer.MedFollowLnglatService;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.PageData;

/**
 * 随访轨迹
 */
@Controller
@RequestMapping(value="/appMedFollowLnglat")
public class MedFollowLnglatController extends BaseController {

	@Resource(name = "medFollowLnglatService")
	private MedFollowLnglatService medFollowLnglatServiceImpl;
	
	//轨迹添加
	@RequestMapping(value="/addMedFollowLnglat")
	@ResponseBody
	public Object addMedFollowLnglat(String info){
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			List<PageData> pdlist =  (List<PageData>) JSON.parseArray(info,PageData.class);
			for(PageData tpd:pdlist){
				tpd.put("fDate", DateUtil.getTime());
				medFollowLnglatServiceImpl.addLnglat(tpd);
			}
			
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	/**
	 * 添加随访评价
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/addMedFollowEvaluate")
	@ResponseBody
	public Object addEvaluate(String info){
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			List<PageData> pdlist =  (List<PageData>) JSON.parseArray(info,PageData.class);
			for(PageData tpd:pdlist){
				medFollowLnglatServiceImpl.addEvaluate(tpd);
			}
			
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	/**
	 * 查询评价
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/getFollowEvaluate")
	@ResponseBody
	public Object findFoEvaluate(String userId){
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			dataList = medFollowLnglatServiceImpl.findFollowEvaluate(pd);
			map.put("infoList", dataList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	/**
	 * 查询产后随访
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/getMedFollowD")
	@ResponseBody
	public Object findMedFollowD(String userId){
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			pd.put("haveFinished", 1);
			dataList = medFollowLnglatServiceImpl.findMedFollowD(pd);
			map.put("infoList", dataList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	/**
	 * 根据随访id查询轨迹点
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/getFollowLnglat")
	@ResponseBody
	public Object findLnglatApp(String fId){
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			dataList = medFollowLnglatServiceImpl.findLnglatApp(pd);
			map.put("infoList", dataList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	/**
	 * 更新握手
	 * @param info
	 * @return
	 */
	@RequestMapping(value="/updateMedFollowLnglat")
	@ResponseBody
	public Object updateMedFollow(String userId,String doctorId){
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			dataList = medFollowLnglatServiceImpl.findMedFollowD(pd);
			if(dataList.size()==1){
				pd.put("fId", dataList.get(0).get("fId"));
			}else{
				map.put("status", 0);
				return map;
			}
			pd.put("haveFinished", 1);
			medFollowLnglatServiceImpl.updateLnglat(pd);
			
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
}
