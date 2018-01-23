package com.xiaolu.controller.xldoctor.doctor;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.doctor.StatisticManageService;
import com.xiaolu.util.PageData;

@Controller
@RequestMapping(value="/statisticManage")
public class StatisticManageController extends BaseController{
	
	String menuUrl = "statisticManage/listRecordChart.do"; //菜单地址(权限用)
	@Resource(name = "statisticManageService")
	private StatisticManageService statisticManageServiceImpl;
	
	/**
	 * 统计图列表
	 */
	@RequestMapping(value="/listRecordChart")
	public ModelAndView listOfficeInit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<PageData>	pm = statisticManageServiceImpl.findPregnantMonth(pd);//怀孕月数统计
		List<PageData>	doctorlist = statisticManageServiceImpl.findDoctorStatistic(pd);//医生统计
		List<PageData>	pastlist = statisticManageServiceImpl.findPastStatistic(pd);//既往史
		List<PageData>	familylist = statisticManageServiceImpl.findFamilyStatistic(pd);//家族及个人史统计
		List<PageData>	doctorToplist = statisticManageServiceImpl.findDoctorTopStatistic(pd);//医生排名
		
		int oType = 0;
		int tType = 0;
		int thType = 0;
		int fType = 0;
		for(PageData temp:pm){
			if(temp.get("umonth")==null || temp.get("amount")==null){
				continue;
			}
			int umonthInt = Integer.parseInt(temp.get("umonth").toString());
			if(umonthInt>=0 && umonthInt<4){
				oType = oType+ Integer.parseInt(temp.get("amount").toString());
			}else
			if(umonthInt>=4 && umonthInt<7){
				tType = tType+ Integer.parseInt(temp.get("amount").toString());
			}else
			if(umonthInt>=7 && umonthInt<9){
				thType = oType+ Integer.parseInt(temp.get("amount").toString());
			}else
			if(umonthInt>=9 && umonthInt<11){
				fType = oType+ Integer.parseInt(temp.get("amount").toString());
			}
			
		}
		//怀孕统计
		String strXML = "";
		strXML += "<graph caption='怀孕周期统计'  outCnvBaseFontSize='12'   xAxisName='阶段' yAxisName='人' decimalPrecision='0' formatNumberScale='0'>";
		strXML += "<set name='1-3月' link='JavaScript:to_show(0,4);' value='"+oType+"' color='AFD8F8'/>";
		strXML += "<set name='4-6月' link='JavaScript:to_show(4,7);' value='"+tType+"' color='AFD8F8'/>";
		strXML += "<set name='7-8月' link='JavaScript:to_show(7,9);' value='"+thType+"' color='AFD8F8'/>";
		strXML += "<set name='9-10月' link='JavaScript:to_show(9,11);' value='"+fType+"' color='AFD8F8'/>";
		strXML += "</graph>";
		//怀孕统计
		
		
		List<String> colorList = new ArrayList<String>();
		colorList.add("AFD8F8");
		colorList.add("F6BD0F");
		colorList.add("8BBA00");
		colorList.add("FF8E46");
		colorList.add("008E8E");
		colorList.add("D64646");
		colorList.add("8E468E");
		colorList.add("588526");
		colorList.add("B3AA00");
		//医生职称饼图start
		String doctorXML = "";
		doctorXML += "<graph caption='医生统计' unescapeLinks='0' outCnvBaseFontSize='12' xAxisName='职称' yAxisName='人' decimalPrecision='0' formatNumberScale='0'>";
		String colorstr= null;
		int colorCount = 0;
		for(PageData bc:doctorlist){
			colorstr = colorList.get(colorCount);
			colorCount ++;
			if(colorCount>=colorList.size()){
				colorCount =0;
			}
			doctorXML += "<set name='"+bc.get("position")+"' value='"+bc.get("damount")+"' link='doctorManage/doctorInfoList.do?position="+bc.get("position")+"'  color='"+colorstr+"'/>";
			
		}
		doctorXML += "</graph>";
		//医生职称饼图end
		
		//既往史饼图start
		String pastXML = "";
		pastXML += "<graph caption='患者既往史统计' unescapeLinks='0' outCnvBaseFontSize='12' xAxisName='疾病' yAxisName='人' decimalPrecision='0' formatNumberScale='0'>";
		colorCount = 0;
		for(PageData bc:pastlist){
			colorstr = colorList.get(colorCount);
			colorCount ++;
			if(colorCount>=colorList.size()){
				colorCount =0;
			}
			pastXML += "<set name='"+bc.get("pastName")+"' value='"+bc.get("amount")+"' link='userInfoController/listPdPageUserInfo.do?pastName="+bc.get("pastName")+"'  color='"+colorstr+"'/>";
			
		}
		pastXML += "</graph>";
		//既往史饼图end
		
		//既往史饼图start
		String familyXML = "";
		familyXML += "<graph caption='家族及个人疾病史统计' unescapeLinks='0' outCnvBaseFontSize='12' xAxisName='疾病' yAxisName='人' decimalPrecision='0' formatNumberScale='0'>";
		colorCount = 0;
		for(PageData bc:familylist){
			colorstr = colorList.get(colorCount);
			colorCount ++;
			if(colorCount>=colorList.size()){
				colorCount =0;
			}
//			if(Integer.parseInt(bc.get("amount").toString())==0){
//				continue;
//			}
			familyXML += "<set name='"+bc.get("familyName")+"' value='"+bc.get("amount")+"' link='userInfoController/listPdPageUserInfo.do?familyName="+bc.get("familyName")+"'  color='"+colorstr+"'/>";
			
		}
		familyXML += "</graph>";
		//既往史饼图end
		
		mv.addObject("pd",pd);
		mv.addObject("strXML",strXML);
		mv.addObject("doctorXML",doctorXML);
		mv.addObject("pastXML",pastXML);
		mv.addObject("familyXML",familyXML);
		mv.addObject("doctorToplist",doctorToplist);
		mv.setViewName("doctor/doctormanage/statistic_list");
		return mv;
	}
	
	
}
