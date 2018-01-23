package com.xiaolu.service.xldoctor.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import com.xiaolu.entity.xldoctor.Area;
import com.xiaolu.value.base.MapObject;

public class ReportCountService {
	@Resource(name = "reportService")
	private ReportService reportService;
	
	/**
	 * 根据市、区、县的ID获取获取其市区组成结构
	 * 
	 * @param cityID
	 * @return
	 */
	public MapObject<String, Area> getAreaStructure(String cityID) {
		List<Area> areas = null;
		try {
			areas = reportService.flawyearlists();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HashMap<String, ArrayList<Area>> areaFatherMap = new HashMap<>();
		HashMap<String, Area> areaMap = new HashMap<>();
		
		for (Area area : areas) {
			areaMap.put(area.getAreaid(), area);
			ArrayList<Area> list = areaFatherMap.get(area.getFatherid());
			if (list == null) {
				list = new ArrayList<>();
				areaFatherMap.put(area.getFatherid(), list);
			}
			list.add(area);
		}
		return createAreaStructure(areaFatherMap, areaMap, cityID);
	}

	private MapObject<String, Area> createAreaStructure(HashMap<String, ArrayList<Area>> areaFatherMap,
			HashMap<String, Area> areaMap, String fatherID) {
		MapObject<String, Area> mapObject = new MapObject<>(areaMap.get(fatherID));
		ArrayList<Area> areas = areaFatherMap.get(fatherID);
		Set<String> fatherIDs = areaFatherMap.keySet();
		for (Area area : areas) {
			if (fatherIDs.contains(area.getAreaid())) {
				mapObject.getMap().put(area.getAreaid(), createAreaStructure(areaFatherMap, areaMap, area.getAreaid()));
			}
		}
		return mapObject;
	}

	public <T> ArrayList<T> count(List<T> list, String cityID, String... args ) {  //获取统计 
		//区域的树状图
		MapObject<String, Area> mapObject = getAreaStructure(cityID);
		
		//根据树状图去获取基层单位的数据
		
		//根据树状图去统计各个上级单位的统计报表
		
		mapObject.getMap().get(cityID);
		mapObject.getKeys(cityID);
		return null;
	}
}