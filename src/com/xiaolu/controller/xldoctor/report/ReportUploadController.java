package com.xiaolu.controller.xldoctor.report;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.system.User;
import com.xiaolu.service.xldoctor.report.ReportDataPaser;
import com.xiaolu.service.xldoctor.report.ReportService;
import com.xiaolu.util.Const;

@Controller
@RequestMapping(value = "/report/upload")
public class ReportUploadController extends BaseController {
	@Resource(name = "reportService")
	private ReportService reportService;

	/**
	 * 新增婚前保健情况年报表数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "premaritalHealth")
	public ModelAndView uploadPremaritalHealth(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 5);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.insertPremaritalHealth(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "报表数据格式错误！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}

	/**
	 * 新增新生儿疾病筛查情况报表数据
	 * 
	 * @param request
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "newbornExamination_{type}")
	public ModelAndView uploadNewbornExamination(MultipartHttpServletRequest request,
			@PathVariable("type") String type) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		ModelAndView mv = this.getModelAndView();
		SimpleDateFormat sdf = null;
		if ("m".equals(type)) {
			sdf = new SimpleDateFormat("yyyy-MM");
		} else if ("y".equals(type)) {
			sdf = new SimpleDateFormat("yyyy");
		} else {
			mv.addObject("body", "报表时间格式错误！");
		}
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 5);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				row.put("type", type);
				if (reportService.insertNewbornExamination(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "报表数据格式错误！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}

	/**
	 * 新增产前诊断情况年报表数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "prenatalDisgnosis")
	public ModelAndView uploadPrenatalDisgnosis(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 5);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.insertPrenatalDisgnosis(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "报表数据格式错误！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 新增产前筛查情况报表数据
	 * 
	 * @param request
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "prenatalExamination_{type}")
	public ModelAndView uploadPrenatalExamination(MultipartHttpServletRequest request,
			@PathVariable("type") String type) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		ModelAndView mv = this.getModelAndView();
		SimpleDateFormat sdf = null;
		if ("m".equals(type)) {
			sdf = new SimpleDateFormat("yyyy-MM");
		} else if ("y".equals(type)) {
			sdf = new SimpleDateFormat("yyyy");
		} else {
			mv.addObject("body", "报表时间格式错误！");
		}
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 4);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				row.put("type", type);
				if (reportService.insertPrenatalExamination(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "报表数据格式错误！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	

/**
	 * -Excel 导入 出生缺陷发生情况年报表 数据 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "insertFlawyear")
	public ModelAndView insertFlawyear (MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 4);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.flawyearAdd(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * -Excel 导入 出生缺陷发生情况月报表 数据 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "insertFlawmonth")
	public ModelAndView insertFlawmonth (MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 3);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.flawmonthAdd(row)){
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * -Excel 导入 婚前保健情况月报表 数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "insertPremaritalmonth")
	public ModelAndView insertPremaritalmonth (MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 5);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.premaritalmonthAdd(row)){
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * -Excel 导入 婚前保健情况月报表 数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "insertChildbirthmonth")
	public ModelAndView insertChildbirthmonth(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 3);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.childbirthmonthAdd(row)){
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	
	/**
	 * -Excel 导入 婚前保健情况年报表 数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "insertChildbirthyear")
	public ModelAndView insertChildbirthyear(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 3);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.childbirthyearAdd(row)){
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 新增病残儿和计划生育手术并发症分级鉴定情况年报表数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "complicationEvaluation")
	public ModelAndView uploadComplicationEvaluation(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 3);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.insertComplicationEvaluation(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "报表数据格式错误！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 新增幼托机构卫生保健管理情况年报表数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "preschoolsManagement")
	public ModelAndView uploadPreschoolsManagement(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 5);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.insertPreschoolsManagement(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "报表数据格式错误！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 新增新生儿疾病筛查、产前筛查、产前诊断开展机构情况年报表数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "institutionManagement")
	public ModelAndView uploadInstitutionManagement(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 4);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.insertInstitutionManagement(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "报表数据格式错误！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * -Excel导入《出生医学证明》管理使用情况年度统计表 数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "insertProveYear")
	public ModelAndView insertProveYear(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 5);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.proveyearAdd(row)){
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	
	/**
	 * -Excel导入 5岁以下儿童保健情况月报表 数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "insertHealthMonth")
	public ModelAndView insertHealthMonth(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 4);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.healthmonthAdd(row)){
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * -Excel导入 5岁以下儿童生命指标月报表 数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "insertLifeMonth")
	public ModelAndView insertLifeMonth(MultipartHttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(Const.SESSION_USERROL);
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 4);
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("createTime", date);
				row.put("creater", user.getNAME());
				if (reportService.lifemonthAdd(row)){
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
}
