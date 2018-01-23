package com.xiaolu.entity.xldoctor;

import java.util.List;

import com.xiaolu.util.PageData;

public class Source {
	private String sourceId;
	private String officeId;
	private String bDate;
	private String dSource;
	private String dSourceUsing;
	private List<PageData> subSource;
	public String getSourceId() {
		return sourceId;
	}
	public void setSourceId(String sourceId) {
		this.sourceId = sourceId;
	}
	public String getOfficeId() {
		return officeId;
	}
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getdSource() {
		return dSource;
	}
	public void setdSource(String dSource) {
		this.dSource = dSource;
	}
	public String getdSourceUsing() {
		return dSourceUsing;
	}
	public void setdSourceUsing(String dSourceUsing) {
		this.dSourceUsing = dSourceUsing;
	}
	public List<PageData> getSubSource() {
		return subSource;
	}
	public void setSubSource(List<PageData> subSource) {
		this.subSource = subSource;
	}
	
}
