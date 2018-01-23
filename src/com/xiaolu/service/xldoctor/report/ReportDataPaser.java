package com.xiaolu.service.xldoctor.report;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.xiaolu.util.ExcelUtils;

public class ReportDataPaser {
	public static ArrayList<HashMap<String, Object>> parse(InputStream is, String fileName, int beginIndex) {
		boolean isExcel2003 = ExcelUtils.isExcel2003(fileName);
		ExcelUtils utils = new ExcelUtils();
		List<List<String>> data = utils.read(is, isExcel2003);
		return parse(data, beginIndex);
	}

	public static ArrayList<HashMap<String, Object>> parse(List<List<String>> data, int beginIndex) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		String time = null;
		for (int i = 0; i < data.size(); i++) {
			List<String> row = data.get(i);
			if (i == 0) {
				String title = row.get(0);
				int s = title.indexOf("(");
				s = s != -1 ? s : title.indexOf("（");
				int e = title.indexOf(")");
				e = e != -1 ? e : title.indexOf("）");
				time = title.substring(s + 1, e).trim();
			}
			if (i >= beginIndex) {
				HashMap<String, Object> et = new HashMap<>();
				for (int j = 0; j < row.size(); j++) {
					String p = StringUtils.isNotEmpty(row.get(j)) ? row.get(j) : null;
					et.put("p" + (j + 1), p);
				}
				if (new HashSet<Object>(et.values()).size() > 1) {
					et.put("time", time);
					list.add(et);
				}
			}
		}
		return list;
	}
}
