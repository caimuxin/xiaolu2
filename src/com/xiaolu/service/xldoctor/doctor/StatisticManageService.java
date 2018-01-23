package com.xiaolu.service.xldoctor.doctor;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.util.PageData;

@Service("statisticManageService")
@SuppressWarnings("unchecked")
public class StatisticManageService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public List<PageData> findPregnantMonth(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("StatisticManageMapper.findPregnantMonth", pd);
	}
	
	public List<PageData> findDoctorStatistic(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("StatisticManageMapper.findDoctorStatistic", pd);
	}
	
	public List<PageData> findPastStatistic(PageData pd) throws Exception{
		List<PageData> pastList = new ArrayList<PageData>();
		List<String> pastNameList = new ArrayList<String>();
		pastNameList.add("高血压");
		pastNameList.add("肾脏疾病");
		pastNameList.add("肝脏疾病");
		pastNameList.add("贫血");
		pastNameList.add("糖尿病");
		pastNameList.add("心脏病");
		
		for(int i=0;i<pastNameList.size();i++){
			PageData tempd = new PageData();
			 pd.put("pastName", pastNameList.get(i));
			tempd =  (PageData) dao.findForObject("StatisticManageMapper.findPastStatistic", pd);
			if(tempd.get("amount")==null){
				tempd.put("amount", 0);
			}
			tempd.put("pastName",  pastNameList.get(i));
			pastList.add(tempd);
		}
		return pastList;
	}
	
	public List<PageData> findFamilyStatistic(PageData pd) throws Exception{
		List<PageData> familyList = new ArrayList<PageData>();
		List<String> familyNameList = new ArrayList<String>();
		familyNameList.add("遗传性疾病史");
		familyNameList.add("精神疾病史");
		familyNameList.add("吸烟");
		familyNameList.add("饮酒");
		familyNameList.add("接触有毒有害物质");
		familyNameList.add("接触放射线");
		for(int i=0;i<familyNameList.size();i++){
			PageData tempd = new PageData();
			 pd.put("familyName", familyNameList.get(i));
			tempd =  (PageData) dao.findForObject("StatisticManageMapper.findFamilyStatistic", pd);
			if(tempd.get("amount")==null){
				tempd.put("amount", 0);
			}
			tempd.put("familyName",  familyNameList.get(i));
			familyList.add(tempd);
		}
		return familyList;
	}
	
	public List<PageData> findDoctorTopStatistic(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("StatisticManageMapper.findDoctorTopStatistic", pd);
	}
}
