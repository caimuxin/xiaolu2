package com.xiaolu.serviceimpl.xldoctor.sufferer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.sufferer.UserInfoService;
import com.xiaolu.util.PageData;

@Service("userInfoServiceImpl")
public class UserInfoServiceImpl implements UserInfoService{

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	
	/**
	 * 查询所有患者信息
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageUserInfo(Page page) throws Exception {
		
		return (List<PageData>) dao.findForList("UserInfoMapper.userInfolistPage",page);
	}

	/**
	 * 根据Id查询患者信息
	 */
	public PageData findUserInfoId(PageData pd) throws Exception {
		
		return (PageData) dao.findForObject("UserInfoMapper.findUserInfoId",pd);
	}

	/**
	 * 添加患者信息
	 */
	public void userInfoAdd(PageData pd) throws Exception {

		dao.save("UserInfoMapper.userInfoAdd",pd);
	}

	/**
	 * 删除患者信息 
	 */
	public void userInfoDel(PageData pd) throws Exception {

		dao.delete("UserInfoMapper.userInfoDel",pd);
	}

	/**
	 * 批量删除患者信息
	 */
	public void userInfoDelAll(String[] ids) throws Exception {
		
		dao.delete("UserInfoMapper.userInfoDelAll",ids);
	}

	/**
	 * 修改患者信息 
	 */
	public void userInfoUpdate(PageData pd) throws Exception {
		
		dao.update("UserInfoMapper.userInfoUpdate",pd);
	}

	/**
	 * 修改状态
	 */
	public void updStatus(PageData pd) throws Exception {

		dao.update("UserInfoMapper.updStatus",pd);
	}

	/**
	 * 删除图片
	 */
	public void updTxiang(PageData pd) throws Exception {
		dao.update("UserInfoMapper.updTxiang",pd);
	}

	/**
	 * 修改用户信息
	 */
	public void updUser(PageData pd) throws Exception {
		dao.update("UserInfoMapper.updUser",pd);
	}

	/**
	 * excel导入
	 */
	public void saveUserExel(PageData pd) throws Exception {
		dao.save("UserInfoMapper.saveUserExel",pd);
	}
	/**
	 * 添加用户信息
	 */
	public void saveU(PageData pd) throws Exception {
		
		dao.save("UserInfoMapper.saveUser",pd);
	}
}
