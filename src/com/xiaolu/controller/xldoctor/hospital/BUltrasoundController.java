package com.xiaolu.controller.xldoctor.hospital;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.xldoctor.Source;
import com.xiaolu.service.xldoctor.hospital.BUltrasoundService;
import com.xiaolu.util.PageData;
@Controller
@RequestMapping(value="/bUltrasound")
public class BUltrasoundController extends BaseController{
	
	String menuUrl ="bUltrasound/listBUltrasound.do";
	@Resource(name = "bUltrasoundServiceImpl")
	private BUltrasoundService bUltrasoundServiceImpl;
	
	/**
	 * 科室菜单
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listBUltrasound")
	public ModelAndView listBUltrasound()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData statInfo = new PageData();
		Date date =  new Date();
		List<PageData> officeList = bUltrasoundServiceImpl.listAllParentOffice();//科室信息
		
		PageData pd = this.getPageData();
		
		pd.put("qDate",date);
		List<PageData> officeQueue = bUltrasoundServiceImpl.findOfficeQueue(pd);//每个科室的队列
		
		String officeId = null;
		
	
		if(pd.get("officeId") == null){
			//首次加载默认officeOrder 1
			for(PageData data:officeList){
				Object order = data.get("officeOrder");
				if(order != null && order.toString().equals("1")){
					officeId = data.get("officeId").toString();
					pd.put("officeId", officeId);
				}
			}
		}
		
		//当天队列提示
		int am_pm = getAM_PM(date);
		if(am_pm== 0){
			pd.put("startTime", "08:00:00");
			pd.put("endTime", "12:00:00");
			statInfo.put("AM_PM", 0);
			
		}else{
			pd.put("startTime", "14:00:00");
			pd.put("endTime", "17:00:00");
			statInfo.put("AM_PM", 1);
		}
		
		List<PageData> cuQueueList = bUltrasoundServiceImpl.findQueueAlert(pd);
		
		//上下午统计
		pd.put("startTime", "08:00:00");
		pd.put("endTime", "12:00:00");
		Integer amStat= bUltrasoundServiceImpl.getStatQueue(pd);//科室时间段队列统计
		statInfo.put("amStat", amStat);
		pd.put("startTime", "14:00:00");
		pd.put("endTime", "17:00:00");
		Integer pmStat= bUltrasoundServiceImpl.getStatQueue(pd);//科室时间段队列统计
		statInfo.put("pmStat", pmStat);
//		pd.remove("startTime");
//		pd.remove("endTime");
		
		pd.put("findById", "n");//排除officeId字段
		List<PageData> daySource = bUltrasoundServiceImpl.findDaySourceByOfficeId(pd);//号源主信息
		
		//每个时间段的号源
		List<PageData> totalList = new ArrayList<PageData>();
		List<PageData> mainSubList = null;
		String tempTime = null;
		for(int i=0;i<8;i++){
			PageData mainList = new PageData();
			tempTime = getTempTime(i);
			pd.put("bTime",tempTime);
			mainSubList = bUltrasoundServiceImpl.findTimeSourceByTime(pd);
			mainList.put("timeS", mainSubList);
			totalList.add( mainList);
		}
		
		
		String tempOfficePId = null;
		String tempSOfficeId = null;
		int totalSource = 0; //总号源
		int totalSourceUsing = 0 ; //已用号源
		int totalHaveSource = 0;	//有效号源
		//号源统计
		for(PageData officeP:officeList){
			tempOfficePId = officeP.get("officeId").toString();
			int source =0;
			int sourceUsing = 0;
			for(PageData dayS:daySource){
				tempSOfficeId = dayS.get("officeId").toString();
				if(tempOfficePId.equals(tempSOfficeId)){
					source = source + Integer.parseInt(dayS.get("dSource").toString());//科室总号源
					sourceUsing = sourceUsing + Integer.parseInt(dayS.get("dSourceUsing").toString());//科室已用号源
					totalSource = totalSource + Integer.parseInt(dayS.get("dSource").toString());//总号源
					totalSourceUsing = totalSourceUsing + Integer.parseInt(dayS.get("dSourceUsing").toString());//已用总号源
					officeP.put("dSource", source);
					officeP.put("dSourceUsing", sourceUsing);
					officeP.put("haveSource", source - sourceUsing);
				}
			}
		}
		totalHaveSource = totalSource - totalSourceUsing;
		List<PageData> weekInfo = printWeekdays();
		mv.setViewName("doctor/hospital/bultrasound_list");
		
		mv.addObject("officeList",officeList);//科室列表，科室号源统计
		//mv.addObject("daySource",daySource);//号源信息
		mv.addObject("totalSource",totalSource);//总号源，科室号源统计
		mv.addObject("totalSourceUsing",totalSourceUsing);//占用号源，科室号源统计
		mv.addObject("totalHaveSource",totalHaveSource);//有效号源，科室号源统计
		mv.addObject("mainList",totalList);//每个时间段号源
		mv.addObject("officeId",pd.get("officeId"));//科室Id
		mv.addObject("dayOrder",getDayOfWeek());//日期显示
		mv.addObject("officeQueue",officeQueue);//科室队列统计
		mv.addObject("cuQueueList",cuQueueList);//队列提示
		mv.addObject("statInfo",statInfo);
		mv.addObject("weekInfo",weekInfo);
		mv.addObject("tabId",2);//tabId：2 B超预约
		return mv;
	}
	
	/**
	 * 根据科室Id获取号源
	 * @return
	 */
	@RequestMapping(value="/listSourceDetail")
	public ModelAndView toSourceDetail(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("officeId", 2);
		try{
			List<Source> sourceDetail = bUltrasoundServiceImpl.listSourceByOfficeId(pd);
			mv.addObject("sourceList",sourceDetail);
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	//获取时间段
	public String getTempTime(int index){
		if(index == 0){
			return "08:00:00";
		}else
		if(index == 1){
			return "09:00:00";
		}else
		if(index == 2){
			return "10:00:00";
		}else
		if(index == 3){
			return "11:00:00";
		}else
		if(index == 4){
			return "14:00:00";
		}else
		if(index == 5){
			return "15:00:00";
		}else
		if(index == 6){
			return "16:00:00";
		}else
		if(index == 7){
			return "17:00:00";
		}
		return "";
	}
	
	//获取当周第一天最后一天 
	public PageData getDayOfWeek(){
	  PageData pd = new PageData();
	  Date date = new Date();
	  SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
	  SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	  SimpleDateFormat format2 = new SimpleDateFormat("yyyy");
	  SimpleDateFormat format3 = new SimpleDateFormat("M/d");
	  Calendar calendar = Calendar.getInstance();
	  pd.put("cuDate", format1.format(date));
	  pd.put("currentDay", format.format(date));
	  pd.put("year", format2.format(date));
	  //获取本周是今年的第几周
	  calendar.setFirstDayOfWeek(Calendar.MONDAY);
	  calendar.setTime(date);
	  pd.put("weekOfYear", calendar.get(Calendar.WEEK_OF_YEAR));
	  //获取本周的第一天日期
	  calendar.setFirstDayOfWeek(Calendar.MONDAY);
      calendar.setTime(date);
      calendar.set(Calendar.DAY_OF_WEEK,calendar.getFirstDayOfWeek());
      pd.put("firstDayOfWeek", format3.format(calendar.getTime()));
      //获取本周的最后一天
      calendar.setFirstDayOfWeek(Calendar.MONDAY);
      calendar.setTime(date);
      calendar.set(Calendar.DAY_OF_WEEK,
                   calendar.getFirstDayOfWeek() + 6);
      pd.put("lastDayOfWeek", format3.format(calendar.getTime()));
      return pd;
	}
	
	//查找队列排队信息
	public int getAM_PM(Date date){
		GregorianCalendar ca = new GregorianCalendar();  
	    ca.setTime(date);
	    int am_pm = ca.get(GregorianCalendar.AM_PM);
		return am_pm;
	}
	
	  
    private List<PageData> printWeekdays() {
        Calendar calendar = Calendar.getInstance();
        while (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            calendar.add(Calendar.DATE, -1);
        }
        List<PageData> listPd = new ArrayList<PageData>();
        Date date = new Date();
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_EE");
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = dateFormat2.format(date); 
        for (int i = 0; i < 7; i++) {
        	PageData pd = new PageData();
        	String[] dayTemp = dateFormat.format(calendar.getTime()).split("_");
        	pd.put("bDate", dayTemp[0]);
        	pd.put("weekDay", dayTemp[1]);
        	if(dateStr.equals(dayTemp[0])){
        		pd.put("cuDay", 1);
        	}else{
        		pd.put("cuDay", 0);
        	}
            calendar.add(Calendar.DATE, 1);
            listPd.add(pd);
        }
        return listPd;
    }
	
}
