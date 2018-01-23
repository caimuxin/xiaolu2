/**
 * 
 */
package com.xiaolu.controller.app.appuser;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.xiaolu.controller.base.BaseController;
import com.xiaolu.service.xldoctor.app.WristStrapService;
import com.xiaolu.util.PageData;

/**
 * 计步
 * @author Xie Leipin
 *
 */
@Controller
@RequestMapping(value="/appWristStrap")
public class WristStrapAppController extends BaseController {

	@Resource(name = "wristStrapService")
	private WristStrapService wristStrapServiceImpl;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping(value="/getWeekWristStrap")
	@ResponseBody
	public Object getWeekWristStrap(String userId){
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			dataList = wristStrapServiceImpl.findWeekWristStrap(pd);
			map.put("infoList", dataList);
			if (dataList != null && !dataList.isEmpty()) {
				int dataIndex = 0;
				ArrayList<Integer> indexTemp = new ArrayList<Integer>();
				for (long i = 1; i <= 7; i++) {
					if (i == (Long) dataList.get(dataIndex).get("dayOfWeek")) {
						if (dataIndex != dataList.size() - 1) {
							dataIndex++;
						}
					} else {
						indexTemp.add((int)i);
					}
				}
				for (Integer integer : indexTemp) {
					int temp = integer - 1;
					dataList.add(temp, new PageData());
				}
//				PageData temp = dataList.get(0);
//				long dayOfWeek = (long) temp.get("dayOfWeek");
//				if (dayOfWeek > 1) {
//					for (long i = dayOfWeek - 1; i > 1; i--) {
//						dataList.add(0, new PageData());
//					}
//				}
			}
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	@RequestMapping(value="/getMonthWristStrap")
	@ResponseBody
	public Object getMonthWristStrap(String userId){
		PageData pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			dataList = wristStrapServiceImpl.findWeekWristStrapMonth(pd);
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
	 * 患者随访基本信息新增/编辑
	 */
	@RequestMapping(value="/saveWristStrap")
	@ResponseBody
	public Object saveWristStrap(String info){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String time = sdf.format(new Date());
		try{	
			List<PageData> pdlist =  (List<PageData>) JSON.parseArray(info,PageData.class);
			for(PageData tpd:pdlist){
				List<PageData>  temp = wristStrapServiceImpl.findWeekWristStrapByUidAndDate(tpd);
				if (temp != null && !temp.isEmpty()) {
					tpd.put("id", temp.get(0).get("id"));
					wristStrapServiceImpl.updateWristStrap(tpd);
				} else {
					tpd.put("createDate", time);
					wristStrapServiceImpl.saveWristStrap(tpd);
				}
			}
			
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
}
