package com.xiaolu.controller.app.appuser;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.serviceimpl.xldoctor.app.MedFollowAppServiceImpl;
import com.xiaolu.util.PageData;

@Controller
@RequestMapping("/appMedFollow")
public class MedFollowAppController extends BaseController{
	
	@Resource(name="MedFollowAppServiceImpl")
	private MedFollowAppServiceImpl medFollowAppServiceImpl;

	
	/**
	 * 查询一周随访的人数
	 * @param dateStr
	 * @return
	 */
	
	@RequestMapping(value="/medFllowWeekCounts",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object medFllowWeekCounts(String dateStr,String doctorId){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd=this.getPageData();
		try{
			List<String> dateList = printWeekdays(dateStr);
			Map<String,Integer> rMap =new LinkedHashMap<String,Integer>();
			for(String fd:dateList){
				pd.put("curWDate", fd);
				int result=medFollowAppServiceImpl.medFllowWeekCount(pd);
				if(result>0){
					rMap.put(fd, 1);
				}else{
					rMap.put(fd, 0);
				}
			}
			map.put("followObject", rMap);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	private List<String> printWeekdays(String dateStr) throws ParseException {
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date reDate =  dateFormat2.parse(dateStr);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(reDate);
        while (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            calendar.add(Calendar.DATE, -1);
        }
        List<String> dateList = new ArrayList<String>();
        for (int i = 0; i < 7; i++) {
        	String dayTemp = dateFormat2.format(calendar.getTime());
        	dateList.add(dayTemp);
        	calendar.add(Calendar.DATE, 1);
        }
        return dateList;
    }
	
	
	/**
	 * 获取指定某一天的应该去随访的用户信息
	 * @param dateStr
	 * @return
	 */
	@RequestMapping(value="/medfllowDayLists",produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object medfllowDayLists(String dateStr,String doctorId){
		Map<String,Object> map=new HashMap<String,Object>();
		
		PageData pd=new PageData();
		pd=this.getPageData();
		
		try {
			if (StringUtils.isNotBlank(doctorId)) {
				List<PageData> followDate=medFollowAppServiceImpl.medfllowDayList(pd);
				map.put("status",1);
				map.put("followDate", followDate);
			}else{
				map.put("status","医生Id不能为空！");
			}
		} catch (Exception e) {
			map.put("status",0);
			logger.error(e.toString(), e);
		}
		return map;
	}
}
