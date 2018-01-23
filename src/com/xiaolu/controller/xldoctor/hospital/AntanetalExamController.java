package com.xiaolu.controller.xldoctor.hospital;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.hospital.AntanetalExamService;
import com.xiaolu.util.PageData;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/antanetalExam")
public class AntanetalExamController extends BaseController{

	@Resource(name = "antanetalExamServiceImpl")
	private AntanetalExamService antanetalExamServiceImpl;
	
	@RequestMapping(value="/AntanetalExam")
	public ModelAndView listAntanetalExam(){
		ModelAndView mv = this.getModelAndView();
		
		return mv;
	}
	
	@RequestMapping(value="/listAntanetalExam")
	public ModelAndView listofficeMenu(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> officeList = null;
		List<PageData> doctorList = null;
		JSONArray officeJson = null;
		String officeId = null;
		try{
			 pd.put("hospitalId", "672722a820c44e11941596d08abe9505");//医院Id
			 pd.put("type", "n");
			 officeList = antanetalExamServiceImpl.findAllOffice(pd);
			 
			 if(pd.get("officeId") == null){
				//首次加载默认officeOrder 1
				for(PageData data:officeList){
					if(data.get("officeOrder") == null ||"".equals(data.get("officeOrder"))){
						continue;
					}
					if(data.get("officeOrder").toString().equals("1")){
						officeId = data.get("officeId").toString();
						pd.put("officeId", officeId);
					}
				}
			}
			 page.setPd(pd);
			 if(pd.get("search")!=null && pd.get("search").toString().equals("y")){
				 pd.remove("officeId");
			 }
			 doctorList = antanetalExamServiceImpl.listPdPageDoctor(page);//科室医生
			 String tempTime = null;
			 List<PageData> tSource = null;
			 for(PageData dl:doctorList){
				 pd.put("doctorId", dl.get("doctorId"));
				 List<PageData> totalTimeSource = new ArrayList<PageData>();//一周号源
				 for(int i=0;i<8;i++){
					 PageData tAreaObject = new PageData();
					 tempTime = getTempTime(i);
					 pd.put("dTime", tempTime);
					 tSource = antanetalExamServiceImpl.findDoctorTSourceByTime(pd);//每天同时间段号源
					 tAreaObject.put("timeArea", tSource);
					 totalTimeSource.add(tAreaObject);
				 }
				 dl.put("totalTimeSource", totalTimeSource);
			 }
			 
			 officeJson = JSONArray.fromObject(officeList);
			 if(pd.get("doctorName")!=null && !"".equals(pd.get("doctorName").toString())){
				 mv.addObject("serDoctorName",pd.get("doctorName"));
			 }
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		List<PageData> weekInfo = printWeekdays();
		mv.addObject("officeList",officeJson);
		mv.addObject("tabId",1);
		mv.addObject("weekInfo",weekInfo);
		mv.addObject("doctorList",doctorList);
		mv.setViewName("doctor/hospital/bultrasound_list");
		
		return mv;
	}
	
	//获取单前周日期
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
}
