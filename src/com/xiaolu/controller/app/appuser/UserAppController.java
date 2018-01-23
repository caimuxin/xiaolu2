package com.xiaolu.controller.app.appuser;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.xldoctor.Weight;
import com.xiaolu.service.xldoctor.app.UserAppService;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;

@Controller
@RequestMapping(value="/appXLdoctor")
public class UserAppController extends BaseController{

	@Resource(name = "userAppServiceImpl")
	private UserAppService userAppServiceImpl;
	
	/**
	 * 重复性验证
	 */
	@RequestMapping(value="/validateUser")
	@ResponseBody
	public Object validateUser(String userName){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		String isExist = "N"; //0:不存在，1：存在
		
		
		try{
			pd.put("userName", userName);
			if(userAppServiceImpl.findByUserName(pd) != null){
				isExist = "Y";
			}
			map.put("status", 1);
			map.put("isExist", isExist);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}finally{
			logAfter(logger);
		}
		return map;
	}
	

	/**
	 * 保存用户
	 */
	@RequestMapping(value="/registerUser")
	@ResponseBody
	public Object saveUser(String userName,String password) throws Exception{
		PageData pd = new PageData();
		PageData returnData = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		String uuid = this.get32UUID();
		String ntime = DateUtil.getTime().toString();
		pd.put("userId", uuid);	//ID
		pd.put("userName", userName);//权限
		pd.put("name", userName);//用户名
		pd.put("lastLogin", ntime);//最后登录时间
		pd.put("status", "0");//状态
		pd.put("phone", userName);//电话
		pd.put("u_type", "T");//来源
		pd.put("group_id", "4");//来源
		pd.put("createTime", ntime);//注册时间
		pd.put("password", new SimpleHash("SHA-1", userName, password).toString());
		try{
			if(userAppServiceImpl.findByUserName(pd) != null){
				map.put("status", 1);
				map.put("alertInfo","用户名已存在" );
				return map;
			}
			userAppServiceImpl.saveUser(pd);
			returnData = userAppServiceImpl.loginByNameAndPwd(pd);
			map.put("userInfo", returnData);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("alertInfo","用户名已存在" );
		}
		return map;
	}
	
	/**
	 * 请求登录，验证用户
	 */
	@RequestMapping(value="/login" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login(String userName,String password)throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
	
		String passwd = new SimpleHash("SHA-1", userName, password).toString();	//密码加密
		pd.put("password", passwd);
		pd.put("userName", userName);
		try{
			pd = userAppServiceImpl.loginByNameAndPwd(pd);
			if(pd != null){
				pd.put("LAST_LOGIN",DateUtil.getTime().toString());
				userAppServiceImpl.updateLastLogin(pd);
				pd.remove("LAST_LOGIN");
				map.put("status", 1);
			}else{
				map.put("status", 0);
			}
			
			map.put("userInfo", pd);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 修改密码
	 */
	@RequestMapping(value="/upPs" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object updatePassword(String userName,String password)throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		PageData result = new PageData();
		pd = this.getPageData();
	
		String passwd = new SimpleHash("SHA-1", userName, password).toString();	//密码加密
		pd.put("password", passwd);
		pd.put("userName", userName);
		try{
			result = userAppServiceImpl.findByUserName(pd);
			if(result != null){
				userAppServiceImpl.updatePassword(pd);
				map.put("status", 1);
				map.put("userId", result.get("userId"));
			}else{
				map.put("status", 0);
			}
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 根据用户名密码加密
	 */
	@RequestMapping(value="/changePs")
	@ResponseBody
	public Object encryptPs(String userName,String password){
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			if(userName == null || "".equals(userName)|| password== null || "".equals(password)){
				map.put("status", 0);
				return map;
			}
			String passwd = new SimpleHash("SHA-1", userName, password).toString();	//密码加密
			map.put("status", 1);
			map.put("ps", passwd);
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		return map;
	}
	
	/**
	 * 保存用户体重信息
	 */
	@RequestMapping(value="/saveWeight")
	@ResponseBody
	public Object saveWeight(String userId, String weight) {
		Map<String, Object> map = new HashMap<String,Object>();
		if (userId == null || "".equals(userId) || weight == null || "".equals(weight)) {
			map.put("status", 0);
			map.put("msg", "userId or weight is null");
			return map;
		}
		Gson gson = new Gson();
		Weight weightEntity = gson.fromJson(weight, Weight.class);
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("deviceid", weightEntity.getDeviceId());
		pd.put("datetime", weightEntity.getDateTime());
		pd.put("type", weightEntity.getType());
		pd.put("weight", weightEntity.getWeight());
		pd.put("fat", weightEntity.getFat());
		pd.put("bone", weightEntity.getBone());
		pd.put("muscle", weightEntity.getMuscle());
		pd.put("viscer", weightEntity.getViscer());
		pd.put("water", weightEntity.getWater());
		pd.put("kcal", weightEntity.getKcal());
		pd.put("physic", weightEntity.getPhysic());
		pd.put("bmi", weightEntity.getBmi());
		try {
			userAppServiceImpl.saveWeight(pd);
			map.put("weight", weightEntity);
			map.put("status", 1);
		} catch(Exception e) {
			logger.error(e.toString(), e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 保存用户血压信息
	 */
	@RequestMapping(value="/saveBloodmeter")
	@ResponseBody
	public Object saveBloodmeter(String userId, String deviceId, String dateTime, String diastolic, String systolic, String heartrate) {
		Map<String, Object> map = new HashMap<String,Object>();
		if (userId == null || "".equals(userId)) {
			map.put("status", 0);
			map.put("msg", "userId is null");
			return map;
		}
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("deviceid", deviceId);
		pd.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		pd.put("diastolic", diastolic);
		pd.put("systolic", systolic);
		pd.put("heartrate", heartrate);
		try {
			userAppServiceImpl.saveBloodmeter(pd);
			map.put("bloodmeter", pd);
			map.put("status", 1);
		} catch(Exception e) {
			logger.error(e.toString(), e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 保存用户血压信息
	 */
	@RequestMapping(value="/saveHeartesting")
	@ResponseBody
	public Object saveHeartesting(String userId, String deviceId,String hDate ,String hDateTime, String hTlenght, String hFetalHeart, String hHeartRate) {
		Map<String, Object> map = new HashMap<String,Object>();
		if (userId == null || "".equals(userId)) {
			map.put("status", 0);
			map.put("msg", "userId is null");
			return map;
		}
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("createTime", new Date());
			userAppServiceImpl.saveHeartesting(pd);
			map.put("Heartesting", pd);
			map.put("status", 1);
		} catch(Exception e) {
			logger.error(e.toString(), e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 获得用户自然周的平均体重数据
	 */
	@RequestMapping(value="/getWeightWeekData")
	@ResponseBody
	public Object getWeightWeekData(String userId, String dateTime) {
		Map<String, Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		if (userId == null || "".equals(userId)) {
			map.put("msg", "userId is null");
			map.put("status", 0);
			return map;
		}
		try {
			List<PageData> list = userAppServiceImpl.findWeightWeekData(pd);
			map.put("weights", list);
			map.put("status", 1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 获得用户自然月的平均体重数据
	 */
	@RequestMapping(value="/getWeightMonthData")
	@ResponseBody
	public Object getWeightMonthData(String userId, String dateTime) {
		Map<String, Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		if (userId == null || "".equals(userId)) {
			map.put("msg", "userId is null");
			map.put("status", 0);
			return map;
		}
		try {
			List<PageData> list = userAppServiceImpl.findWeightMonthData(pd);
			map.put("weights", list);
			map.put("status", 1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 获得用户自然周的平均胎心数据
	 */
	@RequestMapping(value="/getHeartWeekData")
	@ResponseBody
	public Object getHeartWeekData(String userId) {
		Map<String, Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		if (userId == null || "".equals(userId)) {
			map.put("msg", "userId is null");
			map.put("status", 0);
			return map;
		}
		try {
			List<PageData> list = userAppServiceImpl.findHeartWeekData(pd);
			map.put("hearts", list);
			map.put("status", 1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 获得用户自然周的平均胎心数据
	 */
	@RequestMapping(value="/getHeartMonthData")
	@ResponseBody
	public Object getHeartMonthData(String userId) {
		Map<String, Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		if (userId == null || "".equals(userId)) {
			map.put("msg", "userId is null");
			map.put("status", 0);
			return map;
		}
		try {
			List<PageData> list = userAppServiceImpl.findHeartMonthData(pd);
			map.put("hearts", list);
			map.put("status", 1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 获得用户自然周的平均体重数据
	 */
	@RequestMapping(value="/getBloodMeterWeekData")
	@ResponseBody
	public Object getBloodMeterWeekData(String userId) {
		Map<String, Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		if (userId == null || "".equals(userId)) {
			map.put("msg", "userId is null");
			map.put("status", 0);
			return map;
		}
		try {
			List<PageData> list = userAppServiceImpl.findBloodMeterWeekData(pd);
			map.put("bloodMeters", list);
			map.put("status", 1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", 0);
		}
		return map;
	}

	/**
	 * 获得用户自然月的平均体重数据
	 */
	@RequestMapping(value="/getBloodMeterMonthData")
	@ResponseBody
	public Object getBloodMeterMonthData(String userId) {
		Map<String, Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		if (userId == null || "".equals(userId)) {
			map.put("msg", "userId is null");
			map.put("status", 0);
			return map;
		}
		try {
			List<PageData> list = userAppServiceImpl.findBloodMeterMonthData(pd);
			map.put("bloodMeters", list);
			map.put("status", 1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 个人信息读取/修改接口
	 */
	@RequestMapping(value="/myUserInfo")
	@ResponseBody
	public Object rAndWUserInfo(String type,String userId,String userInfo){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		PageData result;
		pd = this.getPageData();
		pd.put("userId", userId);
		try{	
			if("e".equalsIgnoreCase(type)){
				pd =  JSON.parseObject(userInfo,PageData.class);
				pd.put("userId", userId);
				userAppServiceImpl.updateMyInfo(pd);
				map.put("status", 1);
			}
			if("v".equalsIgnoreCase(type)){
				result = userAppServiceImpl.findMyInfo(pd);
				map.put("userInfo", result);
				map.put("status", 1);
			}
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 用户B超预约记录显示接口
	 */
	@RequestMapping(value="/orderInfoForB")
	@ResponseBody
	public Object orderListInfo(String userId,int pageNum, int pageSize){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		SimpleDateFormat sdfDay = new SimpleDateFormat("HH:mm:ss");
		Calendar cal = Calendar .getInstance();
		Date startDate = null;
		List<PageData> result;
		int timeArea = 60;
		pd.put("userId", userId);
		try{
			pd.put("orderType", "b");
			if (pageSize > 0) {
				int queryBegin = pageNum * pageSize;
				pd.put("begin", queryBegin);
				pd.put("offset", pageSize);
			}
			result = userAppServiceImpl.findOrderInfo(pd);
			
			String endTime = null;
			for(PageData list:result){
				startDate = sdfDay.parse(list.get("orderTime").toString());
				cal.setTime(startDate);
				cal.add(Calendar.MINUTE,timeArea);
				endTime = sdfDay.format(cal.getTime());
				list.put("endOrderTime",endTime);
			}
			
			map.put("orderInfo", result);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 预约记录显示接口
	 */
	@RequestMapping(value="/orderInfoForC")
	@ResponseBody
	public Object orderListInfoForC(String userId,int pageNum, int pageSize){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		SimpleDateFormat sdfDay = new SimpleDateFormat("HH:mm:ss");
		Calendar cal = Calendar .getInstance();
		Date startDate = null;
		int timeArea = 60;
		List<PageData> result;
		pd.put("userId", userId);
		try{
			pd.put("orderType", "c");
			if (pageSize > 0) {
				int queryBegin = pageNum * pageSize;
				pd.put("begin", queryBegin);
				pd.put("offset", pageSize);
			}
			result = userAppServiceImpl.findOrderInfo(pd);
			
			String endTime = null;
			for(PageData list:result){
				startDate = sdfDay.parse(list.get("orderTime").toString());
				cal.setTime(startDate);
				cal.add(Calendar.MINUTE,timeArea);
				endTime = sdfDay.format(cal.getTime());
				list.put("endOrderTime",endTime);
			}
			
			map.put("orderInfo", result);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 文章收藏, 医生关注在HospitalAPPController里
	 */
	@RequestMapping(value="/saveCollection")
	@ResponseBody
	public Object saveCollection(String userId, String refId, String cType){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("userId", userId);
			pd.put("contentId", refId);
			pd.put("refId", refId);
			pd.put("cType", cType.toLowerCase() );
			ArrayList<PageData> temp = (ArrayList<PageData>) userAppServiceImpl.findCollectionByRefId(pd);
			// 防止重复收藏
			if (temp == null || temp.isEmpty()) {
				userAppServiceImpl.saveCollection(pd);
			}
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}finally{
			logAfter(logger);
		}
		return map;
	}
	
	/**
	 * 文章取消收藏, 医生关注在HospitalAPPController里
	 */
	@RequestMapping(value="/cancelCollection")
	@ResponseBody
	public Object cancelCollection(String id, String userId, String refId, String cType){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("id", id);
			pd.put("userId", userId);
			pd.put("refId", refId);
			if (cType != null) {
				pd.put("cType", cType.toLowerCase() );
			}
			int reusltType = 1;
			if (id != null && !id.equals("")) {
				userAppServiceImpl.deleteCollection(pd);
			} else {
				ArrayList<PageData> temp = (ArrayList<PageData>) userAppServiceImpl.findCollectionByRefId(pd);
				if (temp == null || temp.isEmpty()) {
					reusltType = 0;
					map.put("msg", "找不到对应收藏");
				} else {
					PageData tempData = temp.get(0);
					userAppServiceImpl.deleteCollection(tempData);
				}
			}
			map.put("status", reusltType);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}finally{
			logAfter(logger);
		}
		return map;
	}

	/**
	 * 获得收藏列表
	 */
	@RequestMapping(value="/getArticleCollection")
	@ResponseBody
	public Object getArticleCollection(String userId, String cType, int pageNum, int pageSize, String lastTime) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd.put("userId", userId);
		pd.put("cType", cType);
		if (lastTime != null && !"".equals(lastTime)) {
			pd.put("lastTime", lastTime);
		}
		if (pageSize > 0) {
			int queryBegin = pageNum * pageSize;
			pd.put("begin", queryBegin);
			pd.put("offset", pageSize);
		}
		if (userId == null || "".equals(userId)) {
			map.put("msg", "userId is null");
			map.put("status", 0);
			return map;
		}
		try {
			List<PageData> list = userAppServiceImpl.findArticleCollection(pd);
			map.put("collections", list);
			map.put("status", 1);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", 0);
		}
		return map;
	}
	
	/**
	 * 文章收藏, 医生关注在HospitalAPPController里
	 */
	@RequestMapping(value="/getHasCollection")
	@ResponseBody
	public Object getHasCollection(String userId, String refId, String cType){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("userId", userId);
			pd.put("refId", refId);
			pd.put("cType", cType.toLowerCase() );
			ArrayList<PageData> temp = (ArrayList<PageData>) userAppServiceImpl.findCollectionByRefId(pd);
			// 防止重复收藏
			if (temp == null || temp.isEmpty()) {
				map.put("hasCollection", false);
			} else {
				map.put("hasCollection", true);
			}
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}finally{
			logAfter(logger);
		}
		return map;
	}
	
	/**
	 * 上传图片
	 */
	@RequestMapping(value="/saveImgs")
	@ResponseBody
	public Object saveImgs(HttpServletRequest request,@RequestParam(value = "file") MultipartFile[] files,String userId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			for(MultipartFile mf:files){
				String path = uploadPicture("",mf);
				pd.put("uPhoto", path);
				pd.put("userId", userId);
				userAppServiceImpl.updateMyPhoto(pd);
			}
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}

		return map;
	}
	
	public String uploadPicture(String tpz,MultipartFile file){
		String path = "";
		if(null == tpz){tpz = "";}
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG+"photo";		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			path = "photo" + "/" + fileName;				//路径
			
			//Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMGPHOTO + ffile + "/" + fileName);//加水印
		}else{
			path = tpz;
		}
		
		return path;
	}
	
	/**
	 * 医生关注
	 */
	@RequestMapping(value="/isCollect")
	@ResponseBody
	public Object isCollect(String userId,String doctorId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("userId", userId);
			pd.put("doctorId", doctorId);
			PageData rs = userAppServiceImpl.findCollect(pd);
			if(rs!= null && rs.size()>0){
				map.put("isCollect", 1);
			}else{
				map.put("isCollect", 0);
			}
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}

		return map;
	}
	
}
