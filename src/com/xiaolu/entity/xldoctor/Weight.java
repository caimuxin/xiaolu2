/**
 * 
 */
package com.xiaolu.entity.xldoctor;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 体重
 * @author Xie Leipin
 */
public class Weight implements Serializable {

	private static final long serialVersionUID = 7250391428242144178L;

	/** 用户id */
	private String userId;
	/** 设备id, 一般为mac地址 */
	private String deviceId;
	/** 测量日期 */
	private String dateTime;
	/** 设备类型 0为普通体重秤, 1为体脂称 */
	private String type;
	/** 重量 */
	private BigDecimal weight;
	/** 脂肪率 */
	private String fat;
	/** 骨骼 */
	private String bone;
	/** 肌肉 */
	private String muscle;
	/** 内脏脂肪 */
	private String viscer;
	/** 人体水分 */
	private String water;
	/** 热量 */
	private String kcal;
	/** 身体年龄 */
	private String physic;
	
	/** 身体年龄 */
	private String bmi;
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getDeviceId() {
		return deviceId;
	}
	
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	
	public String getDateTime() {
		return dateTime;
	}
	
	public void setDateTime(String datetime) {
		this.dateTime = datetime;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public BigDecimal getWeight() {
		return weight;
	}
	
	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}
	
	public String getFat() {
		return fat;
	}
	
	public void setFat(String fat) {
		this.fat = fat;
	}
	
	public String getBone() {
		return bone;
	}
	
	public void setBone(String bone) {
		this.bone = bone;
	}
	
	public String getMuscle() {
		return muscle;
	}
	
	public void setMuscle(String muscle) {
		this.muscle = muscle;
	}
	
	public String getViscer() {
		return viscer;
	}
	
	public void setViscer(String viscer) {
		this.viscer = viscer;
	}
	
	public String getWater() {
		return water;
	}
	
	public void setWater(String water) {
		this.water = water;
	}
	
	public String getKcal() {
		return kcal;
	}
	
	public void setKcal(String kcal) {
		this.kcal = kcal;
	}
	
	public String getPhysic() {
		return physic;
	}
	
	public void setPhysic(String physic) {
		this.physic = physic;
	}
	
	public String getBmi() {
		return bmi;
	}

	public void setBmi(String bmi) {
		this.bmi = bmi;
	}

	@Override
	public String toString() {
		return "Weight [userId=" + userId + ", deviceId=" + deviceId + ", datetime=" + dateTime + ", type=" + type
				+ ", weight=" + weight + ", fat=" + fat + ", bone=" + bone + ", muscle=" + muscle + ", viscer=" + viscer
				+ ", water=" + water + ", kcal=" + kcal + ", physic=" + physic + ", bmi="+bmi+"]";
	}
	
}
