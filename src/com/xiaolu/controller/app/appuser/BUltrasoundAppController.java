package com.xiaolu.controller.app.appuser;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.xldoctor.Source;
import com.xiaolu.service.xldoctor.app.BUltrasoundAppService;
import com.xiaolu.util.PageData;

@Controller
@RequestMapping(value="/appbultra")
public class BUltrasoundAppController extends BaseController{

	@Resource(name = "bUltrasoundAppServiceImpl")
	private BUltrasoundAppService bUltrasoundAppServiceImpl;
	
	/**
	 * 根据医院Id获取科室
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getBOffice")
	@ResponseBody
	public Object getOfficeByHospitalId(String id){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			pd.put("hospitalId", id);
			pd.put("type","B");
			dataList = bUltrasoundAppServiceImpl.findOfficeByHospitalId(pd);
			map.put("officeList", dataList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	/**
	 * 根据科室Id获取所有号源信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getSource")
	@ResponseBody
	public Object getSourceByOfficeId(String id){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<Source> dataList = null;
		try{
			pd.put("officeId", id);
			dataList = bUltrasoundAppServiceImpl.listAllSourceOfSub(pd);
			map.put("sourceList", dataList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	/**
	 * 根据科室Id获取号源信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getDaySource")
	@ResponseBody
	public Object getDaySourceByOfficeId(String hId,String id){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<Source> dataList = null;
		try{
			pd.put("officeId", id);
			dataList = bUltrasoundAppServiceImpl.findMainSourceByOfficeId(pd);
			map.put("daySourceList", dataList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	/**
	 * 根据科室Id获取号源信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getTimeSource")
	@ResponseBody
	public Object getTimeSourceByOfficeId(String hId,String id){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		Calendar cal = Calendar .getInstance();
		String type = "A";
		int addtime = 60;
		Date date = null;
		String tempdate = null;
		SimpleDateFormat sdfDay = new SimpleDateFormat("HH:mm:ss");
		try{
			pd.put("sourceId", id);
			dataList = bUltrasoundAppServiceImpl.findSubSourceByOfficeId(pd);
			//计算结束时间
			for(PageData list:dataList){
				type = list.get("timeType").toString();
				if(type.equals("A")){
					addtime = 60;
				}
				date = sdfDay.parse(list.get("startTime").toString());
				cal.setTime(date);
				cal.add(Calendar.MINUTE,addtime);
				tempdate = sdfDay.format(cal.getTime());
				list.put("endTime",tempdate);
			}
			map.put("timeSourceList", dataList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	/**
	 * B超预约
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/saveOrder")
	@ResponseBody
	public Object saveOrder(String hospitalId,String officeId,String userId,String date,String time){
		//String hospitalId,String officeId,String userId,String Date
		PageData pd = new PageData();
		PageData tUsingPd = null;
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			 pd.put("userId", userId);
			 pd.put("officeId", officeId);
			 pd.put("hospitalId", hospitalId);
			 pd.put("orderDate", date);
			 pd.put("orderTime", time);
			 
			 tUsingPd = bUltrasoundAppServiceImpl.findTSourceusing(pd);
			 
			 if(tUsingPd == null){
				 map.put("status", 0);
				 map.put("msg", "Bnum_error01");
				 return map;
			 }
			 
			 String totalS = tUsingPd.get("tSource").toString();
			 String usingS = tUsingPd.get("tSourceusing").toString();
			 if(totalS == null || totalS.equals("") ||totalS.equals(usingS)){
				 map.put("status", 0);
				 map.put("msg", "Bnum_error01");
				 return map;
			 }
			 Integer  orderRunning = Integer.parseInt(usingS)+1;
			 pd.put("orderRunning", orderRunning);//
			 pd.put("status", 1);
			 pd.put("orderType", "b");//b：b超预约
			 pd.put("createTime", new Date());
			 
			 bUltrasoundAppServiceImpl.saveOrder(pd);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
}
