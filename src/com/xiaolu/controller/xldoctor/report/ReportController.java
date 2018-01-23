package com.xiaolu.controller.xldoctor.report;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.report.ReportService;
import com.xiaolu.util.Const;
import com.xiaolu.util.FileDownload;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;

@Controller
@RequestMapping(value = "/report")
public class ReportController extends BaseController {
	@Resource(name = "reportService")
	private ReportService reportService;
	
	/**
	 * 婚前保健情况年报表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/premaritalHealth")
	public ModelAndView premaritalHealth(Page page) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		page.setPd(pd);
		String time = pd.getString("time");
		try {
			if (StringUtils.isNotEmpty(time)) {
				pd.put("date", sdf.parse(time));
				List<PageData> result = reportService.findPremaritalHealth(page);
				mv.addObject("list", result);
				mv.addObject("time", pd.getString("time"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/premarital_health");

		return mv;
	}

	/**
	 * 新生儿疾病筛查情况表
	 * 
	 * @param type
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/newbornExamination_{type}")
	public ModelAndView newbornExamination(@PathVariable("type") String type, Page page, HttpServletResponse response)
			throws Exception {
		SimpleDateFormat sdf = null;
		if ("y".equals(type)) {
			sdf = new SimpleDateFormat("yyyy");
		} else if ("m".equals(type)) {
			sdf = new SimpleDateFormat("yyyy-MM");
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return new ModelAndView();
		}
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String time = pd.getString("time");
		pd.put("type", type);
		page.setPd(pd);
		try {
			if (StringUtils.isNotEmpty(time)) {
				pd.put("date", sdf.parse(time));
				List<PageData> result = reportService.findNewbornExamination(page);
				mv.addObject("list", result);
				mv.addObject("time", pd.getString("time"));
			}
			mv.addObject("type", type);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/newborn_examination");

		return mv;
	}

	/**
	 * 产前筛查情况表
	 * 
	 * @param type
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/prenatalExamination_{type}")
	public ModelAndView prenatalExamination(@PathVariable("type") String type, Page page, HttpServletResponse response)
			throws Exception {
		SimpleDateFormat sdf = null;
		if ("y".equals(type)) {
			sdf = new SimpleDateFormat("yyyy");
		} else if ("m".equals(type)) {
			sdf = new SimpleDateFormat("yyyy-MM");
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return new ModelAndView();
		}
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String time = pd.getString("time");
		pd.put("type", type);
		page.setPd(pd);
		try {
			if (StringUtils.isNotEmpty(time)) {
				pd.put("date", sdf.parse(time));
				List<PageData> result = reportService.findPrenatalExamination(page);
				mv.addObject("list", result);
				mv.addObject("time", pd.getString("time"));
			}
			mv.addObject("type", type);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/prenatal_examination");

		return mv;
	}

	/**
	 * 产前诊断情况年报表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/prenatalDisgnosis")
	public ModelAndView prenatalDisgnosis(Page page) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String time = pd.getString("time");
		page.setPd(pd);
		try {
			if (StringUtils.isNotEmpty(time)) {
				pd.put("date", sdf.parse(time));
				List<PageData> result = reportService.findPrenatalDisgnosis(page);
				mv.addObject("list", result);
				mv.addObject("time", pd.getString("time"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/prenatal_disgnosis");

		return mv;
	}

	/**
	 * 妇女常见病筛查情况年报表c
	 */
	@RequestMapping(value = "/findPregnantHealth")
	public ModelAndView findPregnantHealth(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			if(pd.get("searchDate")!=null){
				String datestr = pd.getString("searchDate");
				pd.put("titleYear", datestr);
				List<PageData> result = reportService.findPregnantHealth(page);
				mv.addObject("list", result);
			}
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/pregnant_health");

		return mv;
	}

	/**
	 * 妇女常见病筛查情况年报表c
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/gynecologicalDisease")
	public ModelAndView findGynecologicalDisease(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			
			if(pd.get("searchDate")!=null){
				String datestr = pd.getString("searchDate");
				pd.put("titleYear", datestr.substring(0, 4));
				List<PageData> result = reportService.findGynecologicalDisease(page);
				mv.addObject("list", result);
			}
			
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/gynecologica_disease");

		return mv;
	}

	/**
	 * 计划生育技术服务数量和质量情况年报表c
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/birthServeQuality")
	public ModelAndView findBirthServeQuality(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			
			if(pd.get("searchDate")!=null){
				String datestr = pd.getString("searchDate");
				pd.put("titleYear", datestr.substring(0, 4));
				List<PageData> result = reportService.findBirthServeQuality(page);
				mv.addObject("list", result);
			}
			
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/birth_servequality");

		return mv;
	}

	/**
	 * 中期引产情况年报表c
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/midtermInduced")
	public ModelAndView findMidtermInduced(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			if(pd.get("searchDate")!=null){
				String datestr = pd.getString("searchDate");
				pd.put("titleYear", datestr.substring(0, 4));
				List<PageData> result = reportService.findMidtermInduced(page);
				mv.addObject("list", result);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/midterm_induced");

		return mv;
	}
	
	
	/**
	 * 计划生育咨询随访服务情况表c
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/birthConsult")
	public ModelAndView findBirthConsult(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			if(pd.get("searchDate")!=null){
				String datestr = pd.getString("searchDate");
				pd.put("titleYear", datestr.substring(0, 4));
				List<PageData> result = reportService.findBirthConsult(page);
				mv.addObject("list", result);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/birth_consult");

		return mv;
	}
	
	/**
	 * 基层妇幼保健基本情况年报表c
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/womenChildrenHealth")
	public ModelAndView findWomenChildrenHealth(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			if(pd.get("searchDate")!=null){
				String datestr = pd.getString("searchDate");
				pd.put("titleYear", datestr.substring(0, 4));
				List<PageData> result = reportService.findWomenChildrenHealth(page);
				mv.addObject("list", result);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/womenchildren_health");

		return mv;
	}
	
	/**
	 * 七岁以下儿童保健和健康情况年报表c
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/childrenHealth")
	public ModelAndView findChildrenHealth(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			if(pd.get("searchDate")!=null){
				String datestr = pd.getString("searchDate");
				pd.put("titleYear", datestr.substring(0, 4));
				List<PageData> result = reportService.findChildrenHealth(page);
				mv.addObject("list", result);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/children_health");

		return mv;
	}
	
	
	/**
	 * 儿童与孕产妇健康状况年报表c
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/childPregnantHealthY")
	public ModelAndView findChildPregnantHealthY(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			if(pd.get("searchDate")!=null){
				String datestr = pd.getString("searchDate");
				pd.put("titleYear", datestr.substring(0, 4));
				List<PageData> result = reportService.findChildPregnantHealthY(page);
				mv.addObject("list", result);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/childrenpregnant_healthyear");

		return mv;
	}
	
	/**
	 * 儿童与孕产妇健康状况月报表c
	 */
	@RequestMapping(value = "/childPregnantHealthM")
	public ModelAndView findChildPregnantHealthM(Page page)throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd =new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try{
			if(pd.get("searchDate")!=null){
				String datestr = pd.getString("searchDate");
				pd.put("titleYear", datestr);
				List<PageData> result = reportService.findChildPregnantHealthM(page);
				mv.addObject("list", result);
			}
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/childrenpregnant_healthmonth");
		return mv;
	}
	
	/**
	 * 出生缺陷发生情况年报表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/flawyearlist")
	public ModelAndView flawyearlist(Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData> fyList = reportService.flawyearlistPage(page);
			mv.addObject("fyList", fyList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

		mv.setViewName("doctor/report/pregnant_flawyear");
		return mv;
	}

	
	/**
	 * 出生缺陷发生情况月报表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/flawmonthlist")
	public ModelAndView flawmonthlist(Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData> fmList = reportService.flawmonthlistPage(page);
			mv.addObject("fmList", fmList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

		mv.setViewName("doctor/report/pregnant_flawmonth");
		return mv;
	}

	

	/**
	 * 接产机构分娩情况年表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/childbirthyearlist")
	public ModelAndView childbirthyearlist(Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData> cyList = reportService.childbirthyearlistPage(page);
			mv.addObject("cyList", cyList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

		mv.setViewName("doctor/report/pregnant_childbirthyear");
		return mv;
	}

	
	/**
	 * 接产机构分娩情况月表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/childbirthmonthlist")
	public ModelAndView childbirthmonthlist(Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData> cmList = reportService.childbirthmonthlistPage(page);
			mv.addObject("cmList", cmList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

		mv.setViewName("doctor/report/pregnant_childbirthmonth");
		return mv;
	}

	
	/**
	 * 婚前保健情况月报表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/premaritalmonthlist")
	public ModelAndView premaritalmonthlist(Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData> pmList = reportService.premaritalmonthlistPage(page);
			mv.addObject("pmList", pmList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

		mv.setViewName("doctor/report/pregnant_premaritalmonth");
		return mv;
	}
	
	/**
	 * 病残儿和计划生育手术并发症分级鉴定情况表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/complicationEvaluation")
	public ModelAndView complicationEvaluation(Page page) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		page.setPd(pd);
		String time = pd.getString("time");
		try {
			if (StringUtils.isNotEmpty(time)) {
				pd.put("date", sdf.parse(time));
				List<PageData> result = reportService.findComplicationEvaluation(page);
				mv.addObject("list", result);
				mv.addObject("time", pd.getString("time"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/complication_evaluation");

		return mv;
	}
	
	/**
	 * 幼托机构卫生保健管理情况年报表 
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/preschoolsManagement")
	public ModelAndView preschoolsManagement(Page page) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		page.setPd(pd);
		String time = pd.getString("time");
		try {
			if (StringUtils.isNotEmpty(time)) {
				pd.put("date", sdf.parse(time));
				List<PageData> result = reportService.findPreschoolsManagement(page);
				mv.addObject("list", result);
				mv.addObject("time", pd.getString("time"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/preschools_management");

		return mv;
	}
	
	/**
	 *新生儿疾病筛查、产前筛查、产前诊断开展机构情况年报表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/institutionManagement")
	public ModelAndView institutionManagement(Page page) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		page.setPd(pd);
		String time = pd.getString("time");
		try {
			if (StringUtils.isNotEmpty(time)) {
				pd.put("date", sdf.parse(time));
				List<PageData> result = reportService.findInstitutionManagement(page);
				mv.addObject("list", result);
				mv.addObject("time", pd.getString("time"));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/report/institution_management");

		return mv;
	}
	
	/**
	 * 出生医学证明》管理使用情况年度统计表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/proveyearlist")
	public ModelAndView proveyearlist(Page page){
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		try {
			List<PageData> pyList=reportService.proveyearlistPage(page);
			mv.addObject("pyList",pyList);
			mv.addObject("pd",pd);
		} catch (Exception e) {
			logger.error(e.toString(),e);
		}
		
		mv.setViewName("doctor/report/newborn_proveyear");
		return mv;
	}
	
	
	/**
	 * 5岁以下儿童保健情况月报表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/healthmonthlist")
	public ModelAndView healthmonthlist(Page page){
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		try {
			List<PageData> hmList=reportService.healthmonthlistPage(page);
			mv.addObject("hmList", hmList);
			mv.addObject("pd",pd);
		} catch (Exception e) {
			logger.error(e.toString(),e);
		}
		
		mv.setViewName("doctor/report/newborn_healthmonth");
		return mv;
		
	}
	
	/**
	 * 5岁以下儿童生命指标月报表 
	 * @param page
	 * @return
	 */
	@RequestMapping(value="lifemonthlist")
	public ModelAndView lifemonthlist(Page page){
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		try {
			List<PageData>lmList=reportService.lifemonthlistPage(page);
			mv.addObject("lmList",lmList);
			mv.addObject("pd",pd);
		} catch (Exception e) {
			logger.error(e.toString(),e);
		}
		mv.setViewName("doctor/report/newborn_lifemonth");
		return mv;
		
	}
	
	
	/**
	 * 地区家庭医生执行率 
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/familyDoctor")
	public ModelAndView familyDoctor(Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try {
			List<PageData> fdList = reportService.familyDoctorCount(page);
			mv.addObject("fdList", fdList);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}

		mv.setViewName("doctor/report/family_doctor");
		return mv;
	}
	
	@RequestMapping(value = "upload")
	public ModelAndView upload(@RequestParam("action") String action, @RequestParam("url") String url) {
		ModelAndView mv = this.getModelAndView();
		mv.addObject("action", action);
		mv.addObject("url", url);
		mv.setViewName("doctor/report/uploadexcel");
		return mv;
	}
	
	/**
	 * 下载模版
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response,@RequestParam("excelName") String excelName)throws Exception{
		excelName+=".xlsx";
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + excelName, excelName);
		
	}
}
