package com.xiaolu.service.xldoctor.report;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.entity.Page;
import com.xiaolu.entity.xldoctor.Area;
import com.xiaolu.util.PageData;

@Service("reportService")
@SuppressWarnings("unchecked")
public class ReportService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 婚前保健情况年报表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findPremaritalHealth(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findPremaritalHealthlistPage", page);
	}

	/**
	 * 新生儿疾病筛查情况表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findNewbornExamination(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findNewbornExaminationlistPage", page);
	}

	/**
	 * 产前筛查情况表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findPrenatalExamination(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findPrenatalExaminationlistPage", page);
	}

	/**
	 * 产前诊断情况年表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findPrenatalDisgnosis(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findPrenatalDisgnosislistPage", page);
	}

	/**
	 * 孕产妇保健和健康情况年报表c
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findPregnantHealth(Page pd) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findPregnantHealthlistPage", pd);
	}

	/**
	 * 妇女常见病筛查情况年报表c
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findGynecologicalDisease(Page pd) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findGynecologicalDiseaselistPage", pd);
	}

	/**
	 * 计划生育技术服务数量和质量情况年报表c
	 * 
	 * @throws Exception
	 */

	public List<PageData> findBirthServeQuality(Page pd) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findBirthServeQualitylistPage", pd);
	}
	
	/**
	 * 中期引产情况年报表c
	 * 
	 * @throws Exception
	 */

	public List<PageData> findMidtermInduced(Page pd) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findMidtermInducedlistPage", pd);
	}
	
	/**
	 * 计划生育咨询随访服务情况表c
	 * 
	 * @throws Exception
	 */

	public List<PageData> findBirthConsult(Page pd) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findBirthConsultlistPage", pd);
	}
	
	/**
	 * 基层妇幼保健基本情况年报表c
	 * 
	 * @throws Exception
	 */

	public List<PageData> findWomenChildrenHealth(Page pd) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findWomenChildrenHealthlistPage", pd);
	}
	
	/**
	 * 七岁以下儿童保健和健康情况年报表c
	 * 
	 * @throws Exception
	 */

	public List<PageData> findChildrenHealth(Page pd) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findChildrenHealthlistPage", pd);
	}
	
	/**
	 * 儿童与孕产妇健康状况年报表c
	 * 
	 * @throws Exception
	 */

	public List<PageData> findChildPregnantHealthY(Page pd) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findChildPregnantHealthYlistPage", pd);
	}
	
	/**
	 * 儿童与孕产妇健康状况月报表c
	 * 
	 * @throws Exception
	 */

	public List<PageData> findChildPregnantHealthM(Page pd) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findChildPregnantHealthMlistPage", pd);
	}
	
	/**
	 * 出生缺陷发生情况年报表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> flawyearlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.flawyearlistPage", page);
	}
	
	public List<Area> flawyearlists() throws Exception {
		return (List<Area>) dao.findForList("ReportMapper.flawyearlists", null);
	}

	/**
	 * 出生缺陷发生情况月报表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> flawmonthlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.flawmonthlistPage", page);
	}

	/**
	 * 接产机构分娩情况年表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> childbirthyearlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.childbirthyearlistPage", page);
	}

	/**
	 * 接产机构分娩情况月表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> childbirthmonthlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.childbirthmonthlistPage", page);
	}

	/**
	 * 婚前保健情况月报表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> premaritalmonthlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.premaritalmonthlistPage", page);
	}
	
	/**
	 * 病残儿和计划生育手术并发症分级鉴定情况表 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findComplicationEvaluation(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findComplicationEvaluationlistPage", page);
	}
	
	/**
	 * 幼托机构卫生保健管理情况年报表 
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findPreschoolsManagement(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findPreschoolsManagementlistPage", page);
	}
	
	/**
	 * 新生儿疾病筛查、产前筛查、产前诊断开展机构情况年报表
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findInstitutionManagement(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.findInstitutionManagementlistPage", page);
	}

	
	/**
	 * 《出生医学证明》管理使用情况年度统计表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> proveyearlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.proveyearlistPage", page);
	}
	
	/**
	 * 5岁以下儿童保健情况月报表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> healthmonthlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.healthmonthlistPage", page);
	}
	
	/**
	 * 5岁以下儿童生命指标月报表 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> lifemonthlistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("ReportMapper.lifemonthlistPage",page);
	}
	
	/**
	 * excel孕产妇保健和健康情况年报表c
	 * @throws Exception 
	 */
	
	public void savePregnantHealth(PageData pd) throws Exception{
		dao.save("ReportImportOneMapper.addPregnantHealth",pd);
	}
	
	/**
	 * excel妇女常见病筛查情况年报表c
	 * @throws Exception 
	 */
	public boolean saveGynecologicalDisease(Map map) throws Exception {
		return (int) dao.save("ReportImportOneMapper.addGynecologicalDisease", map) == 1;
	}
	
	/**
	 * excel计划生育技术服务数量和质量情况年报表c
	 * @throws Exception 
	 */
	public boolean saveBirthServeQuality(Map map) throws Exception {
		return (int) dao.save("ReportImportOneMapper.addBirthServeQuality", map) == 1;
	}
	
	/**
	 * excel中期引产情况年报表c
	 * @throws Exception 
	 */
	public boolean saveMidtermInduced(Map map) throws Exception {
		return (int) dao.save("ReportImportOneMapper.addMidtermInduced", map) == 1;
	}
	
	/**
	 * excel计划生育咨询随访服务情况表c
	 * @throws Exception 
	 */
	public boolean saveBirthConsult(Map map) throws Exception {
		return (int) dao.save("ReportImportOneMapper.addBirthConsult", map) == 1;
	}
	
	/**
	 * excel基层妇幼保健基本情况年报表c
	 * @throws Exception 
	 */
	public boolean saveWomenChildrenHealth(Map map) throws Exception {
		return (int) dao.save("ReportImportOneMapper.addWomenChildrenHealth", map) == 1;
	}
	
	/**
	 * excel七岁以下儿童保健和健康情况年报表c
	 * @throws Exception 
	 */
	public boolean saveChildrenHealth(Map map) throws Exception {
		return (int) dao.save("ReportImportOneMapper.addChildrenHealth", map) == 1;
	}
	
	/**
	 * excel儿童与孕产妇健康状况月报表c
	 * @throws Exception 
	 */
	public boolean saveChildPregnantHealthMonth(Map map) throws Exception {
		return (int) dao.save("ReportImportOneMapper.addChildPregnantHealthMonth", map) == 1;
	}
	
	/**
	 * excel儿童与孕产妇健康状况年报表c
	 * @throws Exception 
	 */
	public boolean saveChildPregnantHealthYear(Map map) throws Exception {
		return (int) dao.save("ReportImportOneMapper.addChildPregnantHealthYear", map) == 1;
	}
	
	/**
	 * 新增婚前保健情况年报表数据
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean insertPremaritalHealth(Map map) throws Exception {
		return (int) dao.save("ReportMapper.insertPremaritalHealth", map) == 1;
	}
	
	/**
	 * 新增新生儿疾病筛查情况报表数据
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean insertNewbornExamination(Map map) throws Exception {
		return (int) dao.save("ReportMapper.insertNewbornExamination", map) == 1;
	}
	
	/**
	 * 新增产前诊断情况年报表数据
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean insertPrenatalDisgnosis(Map map) throws Exception {
		return (int) dao.save("ReportMapper.insertPrenatalDisgnosis", map) == 1;
	}
	
	/**
	 * 新增产前筛查情况报表数据
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean insertPrenatalExamination(Map map) throws Exception {
		return (int) dao.save("ReportMapper.insertPrenatalExamination", map) == 1;
	}
	

	/**
	 * -Excel 导入 出生缺陷发生情况年报表 数据  
	 */
	public boolean flawyearAdd(Map map) throws Exception{
		return (int) dao.save("ReportMapper.flawyearAdd", map) == 1;
	}
	
	/**
	 * -Excel 导入 出生缺陷发生情况月报表 数据  
	 */
	public boolean flawmonthAdd(Map map) throws Exception{
		return (int) dao.save("ReportMapper.flawmonthAdd", map) == 1;
	}
	
	/**
	 * -Excel 导入  接产机构分娩情况年表 数据  
	 */
	public boolean childbirthyearAdd(Map map)throws Exception{
		return (int) dao.save("ReportMapper.childbirthyearAdd", map) == 1;
	}
	
	/**
	 *-Excel 导入  接产机构分娩情况月表  数据
	 */
	public boolean childbirthmonthAdd(Map map)throws Exception{
		return (int) dao.save("ReportMapper.childbirthmonthAdd", map) == 1;
	}
	
	/**
	 * -Excel 导入 婚前保健情况月报表 数据
	 */
	public boolean premaritalmonthAdd(Map map)throws Exception{
		return (int) dao.save("ReportMapper.premaritalmonthAdd", map) == 1;
	}
	
	/**
	 * 新增病残儿和计划生育手术并发症分级鉴定情况年报表数据
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean insertComplicationEvaluation(Map map) throws Exception {
		return (int) dao.save("ReportMapper.insertComplicationEvaluation", map) == 1;
	}
	
	/**
	 * 新增幼托机构卫生保健管理情况年报表数据
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean insertPreschoolsManagement(Map map) throws Exception {
		return (int) dao.save("ReportMapper.insertPreschoolsManagement", map) == 1;
	}
	
	/**
	 * 新增新生儿疾病筛查、产前筛查、产前诊断开展机构情况年报表数据
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean insertInstitutionManagement(Map map) throws Exception {
		return (int) dao.save("ReportMapper.insertInstitutionManagement", map) == 1;
	}
	
	/**
	 * -Excel导入《出生医学证明》管理使用情况年度统计表  数据
	 */
	public boolean proveyearAdd(Map map)throws Exception{
		return (int) dao.save("ReportMapper.proveyearAdd", map) == 1;
	}
	
	/**
	 * Excel导入 5岁以下儿童保健情况月报表 数据
	 */
	public boolean healthmonthAdd(Map map)throws Exception{
		return (int) dao.save("ReportMapper.healthmonthAdd", map) == 1;
	}
	
	/**
	 * -Excel导入 5岁以下儿童生命指标月报表  数据
	 */
	public boolean lifemonthAdd(Map map)throws Exception{
		return (int) dao.save("ReportMapper.lifemonthAdd", map) == 1;
	}
	
	/**
	 * 地区家庭医生执行率 
	 * 
	 * @throws Exception
	 */

	public List<PageData> familyDoctorCount(Page page) throws Exception {
		return (List<PageData>) dao.findForList("ReportMapper.familyDoctorlistPage", page);
	}
}
