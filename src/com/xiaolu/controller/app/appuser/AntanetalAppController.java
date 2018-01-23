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
import com.xiaolu.service.xldoctor.app.AntanetalAppService;
import com.xiaolu.util.PageData;
@Controller
@RequestMapping(value="/appantanetal")
public class AntanetalAppController extends BaseController{
	
	@Resource(name = "antanetalAppServiceImpl")
	private AntanetalAppService antanetalAppServiceImpl;
	
	/**
	 * 根据医院Id获取产科门诊科室
	 * @param id
	 */
	@RequestMapping(value="/getAntOffice")
	@ResponseBody
	public Object getOfficeByHospitalId(String hospitalId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			pd.put("hospitalId", hospitalId);
			pd.put("type","c");//产科门诊类
			dataList = antanetalAppServiceImpl.findOfficeByHospitalId(pd);
			map.put("officeList", dataList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 科室医生信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getOfficeDoctor")
	@ResponseBody
	public Object getOfficeDoctor(String hospitalId,String officeId,Integer pageNum,Integer pageSize){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> doctorList = null;
		try{
			pd.put("hospitalId", hospitalId);
			pd.put("officeId", officeId);
			if (pageNum!=null && pageSize!=null && pageSize > 0) {
				int queryBegin = pageNum * pageSize;
				pd.put("begin", queryBegin);
				pd.put("offset", pageSize);
			}
			doctorList = antanetalAppServiceImpl.findOfficeDoctor(pd);
			map.put("doctorList", doctorList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 医生周号源信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getWeekSource")
	@ResponseBody
	public Object getDoctorWeekSource(String hospitalId,String officeId,String doctorId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> sourceList = null;
		try{
			pd.put("hospitalId", hospitalId);
			pd.put("officeId", officeId);
			pd.put("doctorId", doctorId);
			sourceList = antanetalAppServiceImpl.findDoctorWeekSource(pd);
			map.put("weekSourceList", sourceList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 医生周号源信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getDaySource")
	@ResponseBody
	public Object getDoctorDaySource(String hospitalId,String officeId,String doctorId,String date){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		Calendar cal = Calendar .getInstance();
		SimpleDateFormat sdfDay = new SimpleDateFormat("HH:mm:ss");
		Date startDate = null;
		List<PageData> sourceList = null;
		try{
			pd.put("hospitalId", hospitalId);
			pd.put("officeId", officeId);
			pd.put("doctorId", doctorId);
			pd.put("date", date);
			sourceList = antanetalAppServiceImpl.findDoctorDaySource(pd);
			int timeType = 60;
			String endTime = null;
			for(PageData list:sourceList){
				if(list.get("timeType")!= null & !list.get("timeType").equals("")){
					timeType = Integer.parseInt(list.get("timeType").toString());
				}
				startDate = sdfDay.parse(list.get("time").toString());
				cal.setTime(startDate);
				cal.add(Calendar.MINUTE,timeType);
				endTime = sdfDay.format(cal.getTime());
				list.put("endTime",endTime);
			}
			map.put("daySourceList", sourceList);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 产科门诊预约
	 * @return
	 */
	@RequestMapping(value="/saveOrder")
	@ResponseBody
	public Object saveOrder(String hospitalId,String officeId,String userId,String doctorId,String date,String time){
		//String hospitalId,String officeId,String userId,String Date
		PageData pd = new PageData();
		List<PageData> tUsingPd = null;
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			 pd.put("userId", userId);
			 pd.put("officeId", officeId);
			 pd.put("hospitalId", hospitalId);
			 pd.put("doctorId", doctorId);
			 pd.put("date", date);
			 pd.put("time", time);
			 
			 tUsingPd = antanetalAppServiceImpl.findDoctorDaySource(pd);
			 
			 if(tUsingPd == null ||tUsingPd.size() ==0){
				 map.put("status", 0);
				 map.put("msg", "Bnum_error01");
				 return map;
			 }
			 
			 Object totalSObject = tUsingPd.get(0).get("zSource");
			 Object usingSObject = tUsingPd.get(0).get("zSourceusing");
			 int usingS = 0;
			 int totalS;
			 if(totalSObject == null){
				 map.put("status", 0);
				 map.put("msg", "Bnum_error01");
				 return map;
			 }
			 totalS = Integer.parseInt(totalSObject.toString());
			 if(usingSObject != null){
				 usingS = Integer.parseInt(usingSObject.toString());
			 }
			 if(totalS <= usingS){
				 map.put("status", 0);
				 map.put("msg", "Bnum_error01");
				 return map;
			 }
			 Integer  orderRunning = usingS + 1;
			 pd.put("orderRunning", orderRunning);//
			 pd.put("status", 1);
			 pd.put("orderType", "c");//c:产检预约
			 pd.put("orderDate", date);
			 pd.put("orderTime", time);
			 pd.put("createTime", new Date());
			 
			 antanetalAppServiceImpl.saveOrder(pd);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
}
