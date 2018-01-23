package com.xiaolu.controller.xldoctor.foundation;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.foundation.OfficeInfoService;
import com.xiaolu.util.AppUtil;
import com.xiaolu.util.PageData;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/officeInit")
public class OfficeInfoController extends BaseController{
	
	String menuUrl = "officeInit/listOfficeInit.do"; //菜单地址(权限用)
	@Resource(name = "officeInfoSerivceImpl")
	private OfficeInfoService officeInfoServiceImpl;
	
	/**
	 * 显示用户列表(用户组)
	 */
	@RequestMapping(value="/listOfficeInit")
	public ModelAndView listOfficeInit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String officeName = pd.getString("officeName");
		if(null != officeName && !"".equals(officeName)){
			officeName = officeName.trim();
			pd.put("officeName", officeName);
		}
		page.setPd(pd);
		List<PageData>	officeInitList = officeInfoServiceImpl.listPdPageOfficeInit(page);
		mv.setViewName("doctor/foundation/officeinit_list");
		mv.addObject("officeInitList", officeInitList);
		pd.put("tabId", 1);
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 获取科室模板
	 */
	@RequestMapping(value="/listOfficeTemplate")
	public ModelAndView listOfficeTemplate(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	templetList = officeInfoServiceImpl.listPdPageTemplet(page);			//列出用户列表
		mv.setViewName("doctor/foundation/officeinit_list");
		mv.addObject("templetList", templetList);
		pd.put("tabId", 2);
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 去新增医院信息页面
	 */
	@RequestMapping(value="/goOfficeInitAdd")
	public ModelAndView goAddH()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("doctor/foundation/officeinit_edit");
		mv.addObject("msg", "officeInitAdd");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 添加科室
	 */
	@RequestMapping(value="/officeInitAdd")
	public ModelAndView addOfficeInit(@RequestParam(value="officeName",required=false) String officeName,
			@RequestParam(value="oGradeN",required=false) String oGradeN){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			if(null == officeInfoServiceImpl.findOfficeInit(pd)){
				int gradev = Integer.parseInt(pd.get("oGradeV").toString());
				if( gradev==1 ){
					pd.put("oGradeN", "一级");
				}
				officeInfoServiceImpl.addOfficeInit(pd);
			}
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		mv.addObject("pd", pd);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 判断科室名称是否存在
	 */
	@RequestMapping(value="/hasOfficeInit")
	@ResponseBody
	public Object hasOfficeInit(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(officeInfoServiceImpl.findOfficeInit(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/editOfficeInit")
	public ModelAndView editU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		officeInfoServiceImpl.editOfficeInit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value="/goEditOfficeInit")
	public ModelAndView goEditU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		
		
		pd = officeInfoServiceImpl.findOfficeInit(pd);							//根据ID读取
		mv.setViewName("doctor/foundation/officeinit_edit");
		mv.addObject("msg", "editOfficeInit");
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	//异步加载 返回类型 下拉框切换
	@RequestMapping(value="/findTempletTree")
	@ResponseBody
	public Object findTempletBytempletName(){
		Map<String,Object> map = new HashMap<String,Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			List<PageData> templetList = officeInfoServiceImpl.findTemplet(pd);
			List<PageData> init =officeInfoServiceImpl.findBaseTree(pd);
			JSONArray templetJson = JSONArray.fromObject(templetList);
			JSONArray baseJson = JSONArray.fromObject(init);
			map.put("templetTree",templetJson);
			map.put("baseTree",baseJson);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);	
		return AppUtil.returnObject(new PageData(), map);
	}
	
	//异步加载 返回类型 更新模板树
	@RequestMapping(value="/updateTempletTree")
	@ResponseBody
	public Object updateTempletTree(){
		Map<String,Object> map = new HashMap<String,Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		Object addO = pd.get("addO");
		Object delO = pd.get("delO");
		
		try{
			JSONArray addJA = JSONArray.fromObject(addO);
			JSONArray delJA = JSONArray.fromObject(delO);
			@SuppressWarnings("unchecked")
			List<PageData> addlist =  (List<PageData>) JSONArray.toCollection(addJA,Map.class);
			@SuppressWarnings("unchecked")
			List<PageData> dellist =  (List<PageData>) JSONArray.toCollection(delJA,Map.class);
			
			if(addlist!=null && addlist.size()>0){
				officeInfoServiceImpl.saveOfficeTemplet(addlist);
			}
			if(delJA != null && delJA.size()>0){
				officeInfoServiceImpl.deleteOfficeTemplet(dellist);
			}
			}catch(Exception e){
				errInfo = "false";
				logger.error(e.toString(), e);
			}
		map.put("result", errInfo);	
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/**
	 * 删除officeInit
	 */
	@RequestMapping(value="/deleteOfficeInit")
	public void deleteOfficeInit(PrintWriter out){
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			officeInfoServiceImpl.deleteOfficeInit(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
}
