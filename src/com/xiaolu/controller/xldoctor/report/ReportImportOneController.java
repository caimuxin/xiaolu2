package com.xiaolu.controller.xldoctor.report;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.service.xldoctor.report.ReportDataPaser;
import com.xiaolu.service.xldoctor.report.ReportService;
import com.xiaolu.util.Const;
import com.xiaolu.util.ExcelUtils;
import com.xiaolu.util.FileDownload;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;

@Controller
@RequestMapping(value = "/reportImportOne")
public class ReportImportOneController extends BaseController {
	@Resource(name = "reportService")
	private ReportService reportService;
	
	
	/**
	 * 孕产妇保健和健康情况年报表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "read_pregnant_health")
	@ResponseBody
	public ModelAndView uploadPregnantHealth(MultipartHttpServletRequest request) {
		ModelAndView mv = this.getModelAndView();
		try {
			MultipartFile excel = request.getFile("excel");
			String fileName = excel.getName();
			boolean isExcel2003 = ExcelUtils.isExcel2003(fileName);
			ExcelUtils utils = new ExcelUtils();
			List<List<String>> data = utils.read(excel.getInputStream(), isExcel2003);
			String titlestr = data.get(0).get(0);
			int start =titlestr.indexOf("(");
			int end = titlestr.indexOf(")");
			String dateStr = titlestr.substring(start+1, end);
			dateStr = dateStr+"-01-01 00:00:00";
			int count = data.size();
			
			for(int i=4;i<count;i++){
				List tempList = data.get(i);
				PageData pd = new PageData();
				pd.put("reporttime", dateStr);
				
				for(int j=0;j<tempList.size();j++){
					
					if(!tempList.get(j).equals("")){
						pd.put("p"+j, tempList.get(j));
					}
				}
				reportService.savePregnantHealth(pd);
			}
			int insertcount = count -4;
			mv.addObject("body", "成功导入：" + insertcount + "条记录！");
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 妇女常见病筛查情况年报表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "gynecologicalDisease")
	public ModelAndView uploadExcel(MultipartHttpServletRequest request) {
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 2);//第三行开始导入
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("reporttime", date);
				if (reportService.saveGynecologicalDisease(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 计划生育技术服务数量和质量情况年报表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "birthServeQuality")
	public ModelAndView uploadBirthServeQuality(MultipartHttpServletRequest request) {
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 5);//第6行开始导入
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("reporttime", date);
				if (reportService.saveBirthServeQuality(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	
	/**
	 * 中期引产情况年报表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "midtermInduced")
	public ModelAndView uploadMidtermInduced(MultipartHttpServletRequest request) {
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 4);//第5行开始导入
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("reporttime", date);
				if (reportService.saveMidtermInduced(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 计划生育咨询随访服务情况表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "birthConsult")
	public ModelAndView uploadBirthConsult(MultipartHttpServletRequest request) {
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 3);//第5行开始导入
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("reporttime", date);
				if (reportService.saveBirthConsult(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 基层妇幼保健基本情况年报表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "womenChildrenHealth")
	public ModelAndView uploadWomenChildrenHealth(MultipartHttpServletRequest request) {
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 5);//第5行开始导入
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("reporttime", date);
				if (reportService.saveWomenChildrenHealth(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 七岁以下儿童保健和健康情况年报表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "childrenHealth")
	public ModelAndView uploadChildrenHealth(MultipartHttpServletRequest request) {
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 4);//第5行开始导入
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("reporttime", date);
				if (reportService.saveChildrenHealth(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 儿童与孕产妇健康状况月报表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "childPregnantHealthMonth")
	public ModelAndView uploadChildPregnantHealthMonth(MultipartHttpServletRequest request) {
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 4);//第5行开始导入
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("reporttime", date);
				if (reportService.saveChildPregnantHealthMonth(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	/**
	 * 儿童与孕产妇健康状况年报表
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "childPregnantHealthYear")
	public ModelAndView uploadChildPregnantHealthYear(MultipartHttpServletRequest request) {
		MultipartFile excel = request.getFile("excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		ModelAndView mv = this.getModelAndView();
		try {
			Date date = null;
			int count = 0;
			ArrayList<HashMap<String, Object>> list = ReportDataPaser.parse(excel.getInputStream(), excel.getName(), 4);//第5行开始导入
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> row = list.get(i);
				if (date == null) {
					date = sdf.parse((String) row.get("time"));
				}
				row.put("reporttime", date);
				if (reportService.saveChildPregnantHealthYear(row)) {
					count++;
				}
			}
			mv.addObject("body", "成功导入：" + count + "条记录！");
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			mv.addObject("body", "导入失败！");
		}
		mv.setViewName("doctor/report/upload_result");
		return mv;
	}
	
	
	/**
	 *  儿童与孕产妇健康状况年报
	 */
	@RequestMapping(value="/childPregnantHealthYearExcel")
	public void downChildPregnantHealthYearExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "childrenpregnant_healthyear.xlsx", "儿童与孕产妇健康状况年报.xlsx");
		
	}
	
	/**
	 *  儿童与孕产妇健康状况月报
	 */
	@RequestMapping(value="/childPregnantHealthMonthExcel")
	public void downChildPregnantHealthMonthExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "childrenpregnant_healthmonth.xlsx", "儿童与孕产妇健康状况月报.xlsx");
		
	}
	
	/**
	 *  七岁以下儿童保健和健康情况年报表
	 */
	@RequestMapping(value="/childrenHealthExcel")
	public void downChildrenHealthExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "children_health.xlsx", "七岁以下儿童保健和健康情况年报表.xlsx");
		
	}
	
	/**
	 *  计划生育咨询随访服务情况表
	 */
	@RequestMapping(value="/womenChildrenHealthExcel")
	public void downWomenChildrenHealthExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "womenchildren_health.xlsx", "基层妇幼保健基本情况年报表.xlsx");
		
	}
	
	/**
	 * 计划生育技术服务数量和质量情况年报表
	 */
	@RequestMapping(value="/birthConsultExcel")
	public void downBirthConsultExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "birth_consult.xlsx", "计划生育咨询随访服务情况年报表.xlsx");
		
	}
	
	/**
	 * 中期引产情况年报表
	 */
	@RequestMapping(value="/midtermInducedExcel")
	public void downMidtermInducedExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "midterm_Induced.xlsx", "中期引产情况年报表.xlsx");
		
	}
	
	/**
	 * 计划生育技术服务数量和质量情况年报表
	 */
	@RequestMapping(value="/birthServeQualityExcel")
	public void downBirthServeQualityExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "birthServe_quality.xlsx", "计划生育技术服务数量和质量情况年报表.xlsx");
		
	}
	
	/**
	 * 妇女常见病筛查情况年报表
	 */
	@RequestMapping(value="/gynecologicalDiseaseExcel")
	public void downGynecologicalDiseaseExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "gynecological_disease.xlsx", "妇女常见病筛查情况年报表.xlsx");
		
	}
	
	/**
	 * 孕产妇保健和健康情况年报表
	 */
	@RequestMapping(value="/pregnant_healthExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "pregnant_health.xlsx", "孕产妇保健和健康情况年报表.xlsx");
		
	}
	
	
}
