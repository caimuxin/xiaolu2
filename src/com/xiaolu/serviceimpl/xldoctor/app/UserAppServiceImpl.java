package com.xiaolu.serviceimpl.xldoctor.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.xldoctor.hospital.HospitalDao;
import com.xiaolu.service.xldoctor.app.UserAppService;
import com.xiaolu.util.PageData;

@Service("userAppServiceImpl")
@SuppressWarnings("unchecked")
public class UserAppServiceImpl implements UserAppService{
	
	@Resource(name = "hospitalDaoImpl")
	private HospitalDao dao;
	
	@Override
	public PageData findByUserName(PageData pd) throws Exception {
		return (PageData)dao.findForObject("UserAppMapper.findUserByName", pd);
	}
	
	/*
	* 保存用户
	*/
	public void saveUser(PageData pd)throws Exception{
		dao.save("UserAppMapper.saveUserFromApp", pd);
		dao.save("UserAppMapper.saveUserInfo", pd);
	}
	
	/*
	* 登录判断
	*/
	public PageData loginByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserAppMapper.getUserInfo", pd);
	}
	
	/*
	* 更新登录时间
	*/
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("UserAppMapper.updateLastLogin", pd);
	}
	
	/*
	* 修改密码
	*/
	public void updatePassword(PageData pd)throws Exception{
		dao.update("UserAppMapper.updatePassword", pd);
	}

	/**
	 * 保存体重
	 */
	public void saveWeight(PageData pd) throws Exception {
		dao.save("UserAppMapper.saveWeight", pd);
	}

	/**
	 * 保存血压
	 */
	@Override
	public void saveBloodmeter(PageData pd) throws Exception {
		dao.save("UserAppMapper.saveBloodmeter", pd);
	}
	
	/**
	 * 保存胎心
	 */
	@Override
	public void saveHeartesting(PageData pd) throws Exception {
		dao.save("UserAppMapper.saveHeartesting", pd);
	}
	
	/**
	 * 获得周胎心平均值
	 */
	@Override
	public List<PageData> findHeartWeekData(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserAppMapper.getHeartWeekData", pd);
	}

	/**
	 * 获得月胎心平均值
	 */
	@Override
	public List<PageData> findHeartMonthData(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserAppMapper.getHeartMonthData", pd);
	}
	
	/**
	 * 获得周体重平均值
	 */
	@Override
	public List<PageData> findWeightWeekData(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserAppMapper.getWeightWeekData", pd);
	}

	/**
	 * 获得月体重平均值
	 */
	@Override
	public List<PageData> findWeightMonthData(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserAppMapper.getWeightMonthData", pd);
	}

	/**
	 * 获得周血压平均值
	 */
	@Override
	public List<PageData> findBloodMeterWeekData(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserAppMapper.getBloodMeterWeekData", pd);
	}

	/**
	 * 获得月血压平均值
	 */
	@Override
	public List<PageData> findBloodMeterMonthData(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserAppMapper.getBloodMeterMonthData", pd);
	}
	
	/*
	 * 查找我的信息
	 */
	public PageData findMyInfo(PageData pd)throws Exception{
		return (PageData) dao.findForObject("UserAppMapper.findMyInfo", pd);
	}
	
	/*
	* 更新我的信息
	*/
	public void updateMyInfo(PageData pd)throws Exception{
		PageData hasUserInfo = (PageData) dao.findForObject("UserAppMapper.haveUserInfo", pd);
		if(hasUserInfo ==null){
			dao.save("UserAppMapper.saveEmptyUserInfo", pd);
		}
		dao.update("UserAppMapper.updateMyInfo", pd);
	}
	
	/*
	 * 查找预约记录
	 */
	public List<PageData> findOrderInfo(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserAppMapper.findOrderInfo", pd);
	}

	/** 文章收藏, 医生关注接口再HospitalAppService中 */
	@Override
	public void saveCollection(PageData pd) throws Exception {
		dao.save("UserAppMapper.saveContentCollection", pd);
	}

	/** 根据类型获取收藏列表 */
	@Override
	public List<PageData> findCollectionByType(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("UserAppMapper.getCollectionByType", pd);
	}

	/** 取消收藏 */
	@Override
	public void deleteCollection(PageData pd) throws Exception {
		
		
		dao.delete("UserAppMapper.deleteCollection", pd);
	}

	@Override
	public List<PageData> findCollectionById(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserAppMapper.getCollectionById", pd);
	}

	@Override
	public List<PageData> findCollectionByRefId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserAppMapper.getCollectionByRefId", pd);
	}

	/** 根据用户id和文章收藏列表 */
	@Override
	public List<PageData> findArticleCollection(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("UserAppMapper.getArticleCollection", pd);
	}
	
	/*
	* 上传图片
	*/
	public void updateMyPhoto(PageData pd)throws Exception{
		dao.update("UserAppMapper.updateMyPhoto", pd);
	}

	@Override
	public PageData findCollect(PageData pd) throws Exception {
		return (PageData) dao.findForObject("UserAppMapper.findCollect", pd);
	}

	@Override
	public void updateUserPhoto(PageData pd) throws Exception {

		dao.update("UserAppMapper.updUserPhonto",pd);
	}
	
}
