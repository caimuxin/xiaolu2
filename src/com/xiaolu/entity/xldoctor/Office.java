package com.xiaolu.entity.xldoctor;

import java.util.List;

public class Office {
	private Integer officeId;
	private String officeName;
	private String officeUrl;
	private Integer officeParentId;
	private Integer officeGrade;
	private Integer officeOrder;
	private String officeDescrib;
	private String officeUser;
	
	private Office parentOffice;
	private List<Office> subOffice;
	
	public Integer getOfficeId() {
		return officeId;
	}
	public void setOfficeId(Integer officeId) {
		this.officeId = officeId;
	}
	public String getOfficeName() {
		return officeName;
	}
	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}
	public String getOfficeUrl() {
		return officeUrl;
	}
	public void setOfficeUrl(String officeUrl) {
		this.officeUrl = officeUrl;
	}
	public Integer getOfficeParentId() {
		return officeParentId;
	}
	public void setOfficeParentId(Integer officeParentId) {
		this.officeParentId = officeParentId;
	}
	public Integer getOfficeGrade() {
		return officeGrade;
	}
	public void setOfficeGrade(Integer officeGrade) {
		this.officeGrade = officeGrade;
	}
	public Integer getOfficeOrder() {
		return officeOrder;
	}
	public void setOfficeOrder(Integer officeOrder) {
		this.officeOrder = officeOrder;
	}
	public String getOfficeDescrib() {
		return officeDescrib;
	}
	public void setOfficeDescrib(String officeDescrib) {
		this.officeDescrib = officeDescrib;
	}
	public String getOfficeUser() {
		return officeUser;
	}
	public void setOfficeUser(String officeUser) {
		this.officeUser = officeUser;
	}
	public Office getParentOffice() {
		return parentOffice;
	}
	public void setParentOffice(Office parentOffice) {
		this.parentOffice = parentOffice;
	}
	public List<Office> getSubOffice() {
		return subOffice;
	}
	public void setSubOffice(List<Office> subOffice) {
		this.subOffice = subOffice;
	}
	
}
