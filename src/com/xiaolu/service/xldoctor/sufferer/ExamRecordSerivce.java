package com.xiaolu.service.xldoctor.sufferer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

@Service("examRecordRServiceImp")
@SuppressWarnings("unchecked")
public class ExamRecordSerivce {

	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	/**
	 *血压趋势图 
	 */
	public List<PageData> findBloodChart(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ExamRecordMapper.findBloodChart", pd);
	}
	
	/**
	 *体重趋势图 
	 */
	public List<PageData> findWeighChart(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("ExamRecordMapper.findWeighChart", pd);
	}
	
	/**
	 *血压分页查询
	 */
	public List<PageData> findBloodLisgPage(Page pd) throws Exception{
		return (List<PageData>) dao.findForList("ExamRecordMapper.bloodlistPage", pd);
	}
	
	/**
	 *体重分页查询
	 */
	public List<PageData> findWeighLisgPage(Page pd) throws Exception{
		return (List<PageData>) dao.findForList("ExamRecordMapper.weighlistPage", pd);
	}
	
	/**
	 *体重分页查询
	 */
	public List<PageData> findOutPatientLisgPage(Page pd) throws Exception{
		return (List<PageData>) dao.findForList("ExamRecordMapper.outPatientlistPage", pd);
	}
	
	/**
	 *异常血压分页查询
	 */
	public List<PageData> findunBloodLisgPage(Page pd) throws Exception{
		return (List<PageData>) dao.findForList("ExamRecordMapper.unbloodlistPage", pd);
	}
	
	/**
	 *异常体重分页查询
	 */
	public List<PageData> findunWeighLisgPage(Page pd) throws Exception{
		return (List<PageData>) dao.findForList("ExamRecordMapper.unweighlistPage", pd);
	}
	
	/**
	 *异常体重分页查询
	 */
	public List<PageData> findunOutPatientLisgPage(Page pd) throws Exception{
		return (List<PageData>) dao.findForList("ExamRecordMapper.unoutPatientlistPage", pd);
	}
	
	/**
	 *异常血压确认
	 */
	public void updateBlood(PageData pd) throws Exception {
		dao.update("ExamRecordMapper.bloodEdit", pd);
	}
	
	/**
	 *异常体重
	 */
	public void updateWeight(PageData pd) throws Exception {
		dao.update("ExamRecordMapper.weightEdit", pd);
	}
	
	/**
	 *异常胎心
	 */
	public void updateHeart(PageData pd) throws Exception {
		dao.update("ExamRecordMapper.heartEdit", pd);
	}
	
	/**
	 *异常血压饼图
	 */
	public List<PageData> findunBloodAmount(Page pd) throws Exception{
		return (List<PageData>) dao.findForList("ExamRecordMapper.unbloodAmount", pd);
	}
}
