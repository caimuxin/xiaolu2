package com.xiaolu.service.xldoctor.sufferer;

import java.util.List;

import com.xiaolu.entity.Page;
import com.xiaolu.util.PageData;

public interface UserInfoService {
	/**
	 * 查询所有患者信息
	 */
	public List<PageData> listPdPageUserInfo(Page page)throws Exception;
	
	/**
	 * 根据Id查询患者信息
	 */
	public PageData findUserInfoId(PageData pd)throws Exception;
	
	/**
	 * 添加患者信息
	 */
	public void userInfoAdd(PageData pd)throws Exception;
	
	/**
	 * 删除患者信息 
	 */
	public void userInfoDel(PageData pd)throws Exception;
	
	/**
	 * 批量删除患者信息
	 */
	public void userInfoDelAll(String[] ids)throws Exception;
	
	/**
	 * 修改患者信息 
	 */
	public void userInfoUpdate(PageData pd)throws Exception;
	
	/**
	 * 修改状态
	 */
	public void updStatus(PageData pd)throws Exception;

	/**
	 * 修改用户信息
	 */
	public void updUser(PageData pd)throws Exception;

	/**
	 *  删除图片
	 */
	
	public void updTxiang(PageData pd)throws Exception;
	
	/**
	 * excel导入
	 */
	public void saveUserExel(PageData pd)throws Exception;
	
	/**
	 * 添加用户信息
	 */
	public void saveU(PageData pd)throws Exception;
}
