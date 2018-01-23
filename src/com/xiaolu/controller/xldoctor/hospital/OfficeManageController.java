package com.xiaolu.controller.xldoctor.hospital;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.service.xldoctor.hospital.OfficeManageService;
import com.xiaolu.util.AppUtil;
import com.xiaolu.util.PageData;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/officeManage")
public class OfficeManageController extends BaseController{
	
	@Resource(name = "officeManageServiceImpl")
	private OfficeManageService officeManageServiceImpl;
	
	@RequestMapping(value="/officeList")
	public ModelAndView getOfficeByHospital(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			List<PageData> hospitalList = officeManageServiceImpl.findAllHospital(pd);
			if(hospitalList !=null && hospitalList.size()>0){
				pd.put("hospitalId", hospitalList.get(0).get("hospitalId"));
				
				List<PageData> officeList = officeManageServiceImpl.findAllOffice(pd);
				JSONArray officeJson = JSONArray.fromObject(officeList);
				mv.addObject("officeList",officeJson);
				mv.addObject("hospitalList", hospitalList);
			}
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("pd",pd);
		mv.setViewName("doctor/hospital/officemanage_list");
		return mv;
	}
	
	//异步加载 返回类型 下拉框切换
	@RequestMapping(value="/officeByHospitalId")
	@ResponseBody
	public Object getOfficeByHospitalId(){
		Map<String,Object> map = new HashMap<String,Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			List<PageData> officeList = officeManageServiceImpl.findAllOffice(pd);
			List<PageData> initList = officeManageServiceImpl.findOfficeInit(pd);
			JSONArray initJson = JSONArray.fromObject(initList);
			JSONArray officeJson = JSONArray.fromObject(officeList);
			map.put("officeRight",officeJson);
			map.put("initList",initJson);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);	
		return AppUtil.returnObject(new PageData(), map);
	}
	
	//异步加载测试@ResponseBody 返回类型--测试
	@RequestMapping(value="/officeRight")
	@ResponseBody
	public Object getOfficeByHospitalRight(){
		Map<String,Object> map = new HashMap<String,Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			pd.put("hospitalId", 1);
			List<PageData> officeList = officeManageServiceImpl.findAllOffice(pd);
			
			JSONArray officeJson = JSONArray.fromObject(officeList);
			map.put("officeRight",officeJson);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);	
		return AppUtil.returnObject(new PageData(), map);
	}
	
	//科室管理模板编辑 跳转到树编辑
	@RequestMapping(value="/toOfficeTreeEdit")
	public ModelAndView toOfficeEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			//医院科室信息
			List<PageData> hospitalList = officeManageServiceImpl.findAllHospital(pd);//医院下拉框
			if(hospitalList !=null && hospitalList.size()>0){
				//
				List<PageData> officeList = officeManageServiceImpl.findAllOffice(pd);
				List<PageData> initList = officeManageServiceImpl.findOfficeInit(pd);
				JSONArray officeJson = JSONArray.fromObject(officeList);
				JSONArray initJson = JSONArray.fromObject(initList);
				mv.addObject("officeList",officeJson);
				mv.addObject("hospitalList",hospitalList);
				mv.addObject("initList",initJson);
			}
			//科室模板
			List<PageData> officeTempletList = officeManageServiceImpl.findAllOfficeTemplet();
			if(officeTempletList!=null && officeTempletList.size()>0){
				pd.put("templetName", officeTempletList.get(0).get("templetName"));
				List<PageData> templetList = officeManageServiceImpl.findTemplet(pd);
				JSONArray templetJson = JSONArray.fromObject(templetList);
				mv.addObject("officeTempletList",officeTempletList);
				mv.addObject("templetJson",templetJson);
			}
			
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.setViewName("doctor/hospital/officemanage_edit");
		mv.addObject("pd",pd);
		return mv;
	}
	
	//异步加载 返回类型 下拉框切换 切换模板树
	@RequestMapping(value="/findTempletBytempletName")
	@ResponseBody
	public Object findTempletBytempletName(){
		Map<String,Object> map = new HashMap<String,Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			List<PageData> templetList = officeManageServiceImpl.findTemplet(pd);
			
			JSONArray templetJson = JSONArray.fromObject(templetList);
			map.put("templetTree",templetJson);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);	
		return AppUtil.returnObject(new PageData(), map);
	}
	
	//异步加载 返回类型 下拉框切换 切换基础树
	@RequestMapping(value="/findInitTree")
	@ResponseBody
	public Object findInitBytempletName(){
		Map<String,Object> map = new HashMap<String,Object>();
		String errInfo = "success";
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			List<PageData> init =officeManageServiceImpl.findOfficeInitByTempletName(pd);
			JSONArray baseJson = JSONArray.fromObject(init);
			map.put("baseTree",baseJson);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);	
		return AppUtil.returnObject(new PageData(), map);
	}
	
	//异步加载 返回类型 更新医院树
	@RequestMapping(value="/updateOfficeTree")
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
				officeManageServiceImpl.saveOfficeInfo(addlist);
			}
			if(delJA != null && delJA.size()>0){
				officeManageServiceImpl.deleteOfficeInfo(dellist);
			}
			}catch(Exception e){
				errInfo = "false";
				logger.error(e.toString(), e);
			}
		map.put("result", errInfo);	
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 多树页面
	 */
	@RequestMapping(value="/mulztree")
	public ModelAndView ztree() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/tools/multztree");
		mv.addObject("pd", pd);
		return mv;
	}
}
