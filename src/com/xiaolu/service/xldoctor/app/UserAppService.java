package com.xiaolu.service.xldoctor.app;

import java.util.List;

import com.xiaolu.util.PageData;

/**
 * app接口
 * @author muxin
 *
 */
public interface UserAppService {
	
	/*
	* 通过loginname获取数据
	*/
	public PageData findByUserName(PageData pd)throws Exception;
	
	/*
	* 新增用户
	*/
	public void saveUser(PageData pd)throws Exception;
	
	/*
	 * 用户登录
	 */
	public PageData loginByNameAndPwd(PageData pd)throws Exception;
	
	//更新登录时间
	public void updateLastLogin(PageData pd)throws Exception;
	
	//修改密码
	public void updatePassword(PageData pd)throws Exception;
	
	/** 保存体重 */
	public void saveWeight(PageData pd) throws Exception;
	
	/** 保存血压 */
	public void saveBloodmeter(PageData pd) throws Exception;
	
	/** 保存胎心 */
	public void saveHeartesting(PageData pd) throws Exception;
	
	/** 获得周胎心 */
	public List<PageData> findHeartWeekData(PageData pd) throws Exception;
	
	/** 获得月胎心 */
	public List<PageData> findHeartMonthData(PageData pd) throws Exception;
	
	/** 获得周体重 */
	public List<PageData> findWeightWeekData(PageData pd) throws Exception;
	
	/** 获得月体重 */
	public List<PageData> findWeightMonthData(PageData pd) throws Exception;
	
	/** 获得周血压 */
	public List<PageData> findBloodMeterWeekData(PageData pd) throws Exception;
	
	/** 获得月血压 */
	public List<PageData> findBloodMeterMonthData(PageData pd) throws Exception;
	
	/*
	 * 查找我的信息
	 */
	public PageData findMyInfo(PageData pd)throws Exception;
	
	/*
	* 更新我的信息
	*/
	public void updateMyInfo(PageData pd)throws Exception;
	
	/*
	 * 查找预约记录
	 */
	public List<PageData> findOrderInfo(PageData pd)throws Exception;

	/** 文章收藏, 医生关注接口再HospitalAppService中 */
	public void saveCollection(PageData pd) throws Exception;
	
	/** 根据类型获取收藏列表 */
	public List<PageData> findCollectionByType(PageData pd) throws Exception;
	
	/** 取消收藏 */
	public void deleteCollection(PageData pd) throws Exception;
	
	/** 根据id获取收藏列表 */
	public List<PageData> findCollectionById(PageData pd) throws Exception;
	
	/** 根据用户id和相关id获取收藏列表 */
	public List<PageData> findCollectionByRefId(PageData pd) throws Exception;
	
	/** 根据用户id和文章收藏列表 */
	public List<PageData> findArticleCollection(PageData pd) throws Exception;
	
	/*
	* 上传图片
	*/
	public void updateMyPhoto(PageData pd)throws Exception;
	
	/*
	 * 判断用户是否关注过医生
	 */
	public PageData findCollect(PageData pd)throws Exception;
	
	/**
	 * 上传微信头像
	 * 
	 */
	
	public void updateUserPhoto(PageData pd)throws Exception;
}
