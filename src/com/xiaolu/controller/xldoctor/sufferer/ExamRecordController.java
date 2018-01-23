package com.xiaolu.controller.xldoctor.sufferer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.sufferer.ExamRecordSerivce;
import com.xiaolu.util.PageData;

@Controller
@RequestMapping(value="/examRecord")
public class ExamRecordController extends BaseController{
	
	String menuUrl = "examRecord/listOfficeInit.do"; //菜单地址(权限用)
	@Resource(name = "examRecordRServiceImp")
	private ExamRecordSerivce examRecordRServiceImp;
	
	/**
	 * 图表
	 */
	@RequestMapping(value="/listRecordChart")
	public ModelAndView listOfficeInit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//查询时recordType带值
		if(pd.get("timeType")== null && pd.get("recordType") == null){
			pd.put("timeType", "week");
		}
		page.setPd(pd);
		List<PageData>	bloodChartList = examRecordRServiceImp.findBloodChart(pd);//血压数据
		List<PageData>	weighChartList = examRecordRServiceImp.findWeighChart(pd);//体重数据
		
		
		//血压趋势图startbaseFontSize='18'
		String mulXML = "";
		mulXML +="<graph caption='血压趋势图' xAxisName='日期' outCnvBaseFontSize='12'  yAxisName='值' subcaption='' hovercapbg='FFECAA' hovercapborder='F47E00' formatNumberScale='0' decimalPrecision='0' showvalues='0' numdivlines='7' numVdivlines='0' yaxisminvalue='1000' yaxismaxvalue='160'  rotateNames='0'>";
		mulXML += "<categories >";
		for(PageData bc:bloodChartList){
			mulXML += "<category name='"+bc.get("bDate")+"'  />";
		}
		mulXML += "</categories>";
		mulXML += "<dataset seriesName='收缩压' color='1D8BD1' anchorBorderColor='1D8BD1' anchorBgColor='1D8BD1'>";
		for(PageData bc:bloodChartList){
			mulXML += "<set value='"+bc.get("bDiastolic")+"' />";
		}
		mulXML += "</dataset>";

		mulXML += "<dataset seriesName='舒张压' color='F1683C' anchorBorderColor='F1683C' anchorBgColor='F1683C'>";
		for(PageData bc:bloodChartList){
			mulXML += "<set value='"+bc.get("bSystolic")+"' />";
		}
		mulXML += "</dataset>";
		mulXML += "</graph>";
		//血压趋势图end
		
		//体重趋势图start
		String strXML = "";
		strXML += "<graph caption='体重势图' outCnvBaseFontSize='12' xAxisName='日期' yAxisName='值' decimalPrecision='0' formatNumberScale='0'>";
		for(PageData bc:weighChartList){
			strXML += "<set name='"+bc.get("wDate")+"' value='"+bc.get("wWeight")+"' color='AFD8F8'/>";
		}
		strXML += "</graph>";
		//体重趋势图end
		
		mv.addObject("bloodChartList", bloodChartList);
		mv.addObject("pd",pd);
		mv.addObject("strXML",strXML);
		mv.addObject("mulXML",mulXML);
		mv.setViewName("doctor/sufferer/examrecord");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/examRecordList")
	public ModelAndView listExamRecord(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		Page dPage = new Page();
		dPage.setPd(pd);
		try{
			
			if(pd.get("timeType")== null && pd.get("recordType") == null){
				pd.put("timeType", "week");
			}
			List<PageData> 	weighList = examRecordRServiceImp.findWeighLisgPage(dPage);//体重数据
			List<PageData> 	heartList = examRecordRServiceImp.findOutPatientLisgPage(dPage);//胎心数据
			List<PageData>	bloodList = examRecordRServiceImp.findBloodLisgPage(page);//血压数据
			
			mv.addObject("bloodList",bloodList);
			mv.addObject("weighList",weighList);
			mv.addObject("heartList",heartList);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("pd",pd);
		mv.setViewName("doctor/sufferer/examrecord_list");
		
		return mv;
	}
	
	/**
	 * 异常血压列表
	 */
	@RequestMapping(value="/examBloodRecord")
	public ModelAndView listBloodRecord(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try{
			
			if(pd.get("timeType")== null && pd.get("recordType") == null){
				pd.put("timeType", "week");
			}
			List<PageData>	bloodList = examRecordRServiceImp.findunBloodLisgPage(page);//血压数据
			List<PageData>	statisticList = examRecordRServiceImp.findunBloodAmount(page);//数据统计
			mv.addObject("bloodList",bloodList);
			
			
			//既往史饼图start
			String pastXML = "";
			pastXML += "<graph caption='患者既往史统计' unescapeLinks='0' outCnvBaseFontSize='12' xAxisName='疾病' yAxisName='人' decimalPrecision='0' formatNumberScale='0'>";
				
			pastXML += "<set name='"+statisticList.get(0).get("unamount")+"' value='"+statisticList.get(0).get("unamount")+"'   color='AFD8F8'/>";
			pastXML += "<set name='"+statisticList.get(0).get("allamount")+"' value='"+statisticList.get(0).get("allamount")+"'   color='F6BD0F'/>";
			pastXML += "</graph>";
			mv.addObject("pastXML",pastXML);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("pd",pd);
		
		mv.setViewName("doctor/sufferer/examblood_list");
		
		return mv;
	}
	
	/**
	 * 异常体重列表
	 */
	@RequestMapping(value="/examWeightRecord")
	public ModelAndView listWeightRecord(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try{
			
			if(pd.get("timeType")== null && pd.get("recordType") == null){
				pd.put("timeType", "week");
			}
			List<PageData>	weightList = examRecordRServiceImp.findunWeighLisgPage(page);//体重数据
			
			mv.addObject("weightList",weightList);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("pd",pd);
		mv.setViewName("doctor/sufferer/examweight_list");
		
		return mv;
	}
	
	/**
	 * 异常体重列表
	 */
	@RequestMapping(value="/examHeartRecord")
	public ModelAndView listHeartRecord(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try{
			
			if(pd.get("timeType")== null && pd.get("recordType") == null){
				pd.put("timeType", "week");
			}
			List<PageData> 	heartList = examRecordRServiceImp.findunOutPatientLisgPage(page);//胎心数据
			
			mv.addObject("heartList",heartList);
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("pd",pd);
		mv.setViewName("doctor/sufferer/examheart_list");
		
		return mv;
	}
	
	/**
	 * 到血压确认
	 */
	@RequestMapping(value="/goBloodEdit")
	public ModelAndView goBloodEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Page page = this.getPage();
		page.setPd(pd);
		List<PageData>	bloodList = examRecordRServiceImp.findunBloodLisgPage(page);//血压数据
		pd = bloodList.get(0);
		mv.setViewName("doctor/sufferer/blood_edit");
		mv.addObject("msg", "bloodEdit");
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * 到体重确认
	 */
	@RequestMapping(value="/goWeightEdit")
	public ModelAndView goWeightEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Page page = this.getPage();
		page.setPd(pd);
		List<PageData>	weightList = examRecordRServiceImp.findunWeighLisgPage(page);//体重数据
		pd = weightList.get(0);
		mv.setViewName("doctor/sufferer/blood_edit");
		mv.addObject("msg", "weightEdit");
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * 到胎心确认
	 */
	@RequestMapping(value="/goHeartEdit")
	public ModelAndView goHeartEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Page page = this.getPage();
		page.setPd(pd);
		List<PageData> 	heartList = examRecordRServiceImp.findunOutPatientLisgPage(page);//胎心数据
		pd = heartList.get(0);
		mv.setViewName("doctor/sufferer/blood_edit");
		mv.addObject("msg", "heartEdit");
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * 血压确认
	 */
	@RequestMapping(value="/bloodEdit")
	public ModelAndView bloodEdit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			examRecordRServiceImp.updateBlood(pd);//血压数据
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 体重确认
	 */
	@RequestMapping(value="/weightEdit")
	public ModelAndView weightEdit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			examRecordRServiceImp.updateWeight(pd);//血压数据
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 胎心确认
	 */
	@RequestMapping(value="/heartEdit")
	public ModelAndView heartEdit(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			examRecordRServiceImp.updateHeart(pd);//血压数据
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
}
