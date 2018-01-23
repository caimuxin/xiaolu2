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

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.service.xldoctor.app.VersionsService;
import com.xiaolu.util.PageData;

/**
 * 版本控制
 *
 */
@Controller
@RequestMapping(value="/appversions")
public class VersionsController extends BaseController {

	@Resource(name = "versionsService")
	private VersionsService versionsServiceImpl;
	
	/**
	 * 获取最新版本
	 */
	@RequestMapping(value="/findVersion" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object findVersion(String appId)throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			PageData result = versionsServiceImpl.findVersion(pd);
			map.put("versionInfo", result);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 获取历史版本
	 */
	@RequestMapping(value="/findVersionHi" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object findVersionHi(String appId)throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			List<PageData> result = versionsServiceImpl.findVersionHi(pd);
			map.put("versionsList", result);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
}
