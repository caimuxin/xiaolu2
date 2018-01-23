package com.xiaolu.controller.xldoctor.sufferer;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.entity.system.User;
import com.xiaolu.service.system.user.UserService;
import com.xiaolu.service.xldoctor.doctor.DoctorManageService;
import com.xiaolu.service.xldoctor.hospital.HospitalService;
import com.xiaolu.serviceimpl.xldoctor.sufferer.UserInfoServiceImpl;
import com.xiaolu.util.AppUtil;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.DelAllFile;
import com.xiaolu.util.FileDownload;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.MD5;
import com.xiaolu.util.ObjectExcelRead;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;
import com.xiaolu.util.Watermark;

@Controller
@RequestMapping(value="/userInfoController")
public class UserInfoController extends BaseController{
	
	@Resource(name="userInfoServiceImpl")
	private UserInfoServiceImpl userInfoServiceImpl;
	@Resource(name="userService")
	private UserService userService;
	@Resource(name= "hospitalServiceImpl")
	private HospitalService hospitalServiceImpl;
	@Resource(name = "doctorManageServiceImpl")
	private DoctorManageService doctorManageServiceImpl;
	
	/**
	 * 	查询用户信息
	 */
	@RequestMapping(value="/listPdPageUserInfo")
	public ModelAndView listPdPageUserInfo(Page page)throws Exception{
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
		String xuan=pd.getString("status1");
		if(xuan !=null && xuan.equals("0")){
			pd.put("xuan",3);
		}
		
		pd.put("userid",user.getUSER_ID());
		pd.put("roleId",user.getROLE_ID());
		
		
		page.setPd(pd);
		try {
			List<PageData> userInfoList=userInfoServiceImpl.listPdPageUserInfo(page);
			mv.addObject("userInfoList",userInfoList);
			mv.addObject("pd",pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("doctor/sufferer/userInfo_list");
		return mv;
	}
	 
	/**
	 * 删除用户信息
	 */
	
	@RequestMapping(value="delUserInfo")
	public void delUserInfo(PrintWriter out){
		
		PageData pd=new PageData();
		
		try {
			pd=this.getPageData();
			userInfoServiceImpl.userInfoDel(pd);
			out.write("success");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改状态
	 */
	
	@RequestMapping(value="updStatus")
	public void updStatus(PrintWriter out){
		
		PageData pd=new PageData();
		
		try {
			pd=this.getPageData();
			userInfoServiceImpl.updStatus(pd);
			out.write("success");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *批量删除 
	 */
	@RequestMapping(value="/deleteAllE")
	@ResponseBody
	public Object deleteAllE(){
		
		PageData pd=new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		
		try {
			pd=this.getPageData();
			List<PageData> pdList=new ArrayList<PageData>();
			String uuid = pd.getString("uuid");
			
			if(null != uuid && !"".equals(uuid)){
				String ArrayCONTENT_IDS[] = uuid.split(",");
				userInfoServiceImpl.userInfoDelAll(ArrayCONTENT_IDS);
				userService.deleteAllU(ArrayCONTENT_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			
			pdList.add(pd);
			map.put("list", pdList);
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 去用户详情页面
	 */
	@RequestMapping(value="/getDetails")
	public ModelAndView getDetails() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		try {
			pd=userInfoServiceImpl.findUserInfoId(pd);
			List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			List<PageData>dcList=doctorManageServiceImpl.getHospitalId(pd);
			mv.addObject("dcList",dcList);
			mv.addObject("pd",pd);
			mv.addObject("psList",psList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		
		mv.addObject("pd",pd);
		mv.addObject("msg","updDetails");
		mv.setViewName("doctor/sufferer/userInfo_Info");
		return mv;
	}
	
	/**
	 * 去用户修改页面
	 */
	@RequestMapping(value="/getDetailss")
	public ModelAndView getDetailss() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		try {
			List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			pd=userInfoServiceImpl.findUserInfoId(pd);
			List<PageData>dcList=doctorManageServiceImpl.getHospitalId(pd);
			mv.addObject("dcList",dcList);
			mv.addObject("pd",pd);
			mv.addObject("psList",psList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("msg","updDetails");
		mv.setViewName("doctor/sufferer/userInfo_details");
		return mv;
	}
	
	/**
	 * 去用户添加页面
	 */
	@RequestMapping(value="getAddInfo")
	public ModelAndView getAddInfo(){
		ModelAndView mv=this.getModelAndView();
		
		try {
			List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			mv.addObject("psList",psList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("msg","addDetails");
		mv.setViewName("doctor/sufferer/userInfo_details");
		return mv;
	}
	
	/**
	 * 用户详情的修改
	 * @throws Exception 
	 */
	@RequestMapping(value="/updDetails")
	public ModelAndView updDetails(HttpServletRequest request,
				@RequestParam(value="tp",required=false) MultipartFile file,
				@RequestParam(value="tpz",required=false) String tpz,
				@RequestParam(value="uuid",required=false) String uuid,
				@RequestParam(value="user_name",required=false) String user_name,
				@RequestParam(value="u_birthday",required=false) String u_birthday,
				@RequestParam(value="u_sex",required=false) String u_sex,
				@RequestParam(value="u_height",required=false) String u_height,
				@RequestParam(value="u_telphone",required=false) String u_telphone,
				@RequestParam(value="u_papertype",required=false) String u_papertype,
				@RequestParam(value="u_papernum",required=false) String u_papernum,
				@RequestParam(value="u_address",required=false) String u_address,
				@RequestParam(value="u_duedate",required=false) String u_duedate,
				@RequestParam(value="u_preg_all",required=false) String u_preg_all,
				@RequestParam(value="u_preg_zr",required=false) String u_preg_zr,
				@RequestParam(value="u_preg_pf",required=false) String u_preg_pf,
				@RequestParam(value="u_past",required=false) String u_past,
				@RequestParam(value="u_family",required=false) String u_family,
				@RequestParam(value="hospital_id",required=false) String hospital_id,
				@RequestParam(value="doctor_id",required=false) String doctor_id
				) throws Exception{
			ModelAndView mv=this.getModelAndView();
			PageData pd=new PageData();
			pd=this.getPageData();
			pd.put("uuid",uuid);
			pd.put("user_namezs", user_name);
			pd.put("u_birthday",u_birthday);
			pd.put("u_sex", u_sex);
			
			//出生日期和当前日期之差
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
			Date date=new Date();
			String dates=sdf.format(date);
	        Calendar cal = Calendar.getInstance();    
	        cal.setTime(sdf.parse(dates));
	        long time1 = cal.getTimeInMillis();                 
	        cal.setTime(sdf.parse(u_birthday));
	        long time2 = cal.getTimeInMillis();         
	        long between_days=(time1-time2)/(1000*3600*24);
	        long ages=between_days/365;
	        long age=Math.round(ages);
			
			pd.put("u_age", age);
			pd.put("u_height", u_height);
			pd.put("u_papertype",u_papertype );
			pd.put("u_papernum",u_papernum );
			pd.put("u_address", u_address);
			pd.put("u_photo", uploadPicture(tpz, file));
			pd.put("u_duedate", u_duedate);
			pd.put("u_preg_all",u_preg_all);
			pd.put("u_preg_zr", u_preg_zr);
			pd.put("u_preg_pf", u_preg_pf);
			pd.put("u_past",u_past);
			pd.put("u_family",u_family);
			pd.put("u_person","个人生活");
			pd.put("hospital_id",hospital_id);
			pd.put("doctor_id",doctor_id);
	
			pd.put("PHONE",u_telphone);
			pd.put("NAME", user_name);
			mv.addObject("msg","updDetails");
			try {
				userInfoServiceImpl.updUser(pd);
				userInfoServiceImpl.userInfoUpdate(pd);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("saveResult");
			return mv;
		}
	/**
	 *用户信息的添加 
	 */
	@RequestMapping(value="addDetails")
	public ModelAndView addDetails(HttpServletRequest request,
			@RequestParam(value="tp",required=false) MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="user_name",required=false) String user_name,
			@RequestParam(value="u_birthday",required=false) String u_birthday,
			@RequestParam(value="u_sex",required=false) String u_sex,
			@RequestParam(value="u_height",required=false) String u_height,
			@RequestParam(value="u_telphone",required=false) String u_telphone,
			@RequestParam(value="u_papertype",required=false) String u_papertype,
			@RequestParam(value="u_papernum",required=false) String u_papernum,
			@RequestParam(value="u_address",required=false) String u_address,
			@RequestParam(value="u_duedate",required=false) String u_duedate,
			@RequestParam(value="u_preg_all",required=false) String u_preg_all,
			@RequestParam(value="u_preg_zr",required=false) String u_preg_zr,
			@RequestParam(value="u_preg_pf",required=false) String u_preg_pf,
			@RequestParam(value="u_past",required=false) String u_past,
			@RequestParam(value="u_family",required=false) String u_family,
			@RequestParam(value="hospital_id",required=false) String hospital_id,
			@RequestParam(value="doctor_id",required=false) String doctor_id
			) throws Exception{
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		String uuid=this.get32UUID();
		pd.put("uuid",uuid);
		pd.put("user_namezs", user_name);
		pd.put("u_birthday",u_birthday);
		pd.put("u_sex", u_sex);
		
		//出生日期和当前日期之差
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
		Date date=new Date();
		String dates=sdf.format(date);
        Calendar cal = Calendar.getInstance();    
        cal.setTime(sdf.parse(dates));    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(sdf.parse(u_birthday));    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time1-time2)/(1000*3600*24);
        long ages=between_days/365;
        long age=Math.round(ages);
		
		pd.put("u_age",age);
		pd.put("u_height", u_height);
		pd.put("u_papertype",u_papertype );
		pd.put("u_papernum",u_papernum );
		pd.put("u_address", u_address);
		pd.put("u_photo", uploadPicture(tpz, file));
		pd.put("u_duedate",u_duedate);
		pd.put("u_preg_all",u_preg_all);
		pd.put("u_preg_zr", u_preg_zr);
		pd.put("u_preg_pf", u_preg_pf);
		pd.put("u_past",u_past);
		pd.put("u_family",u_family);
		pd.put("u_person","个人生活");
		pd.put("hospital_id",hospital_id);
		pd.put("doctor_id",doctor_id);
		
		pd.put("USER_ID",uuid);
		
		String pass=u_telphone;
		if(StringUtils.isNotBlank(u_telphone)){

			pass=u_telphone.substring(5);
			
		}
		
		pd.put("USERNAME",u_telphone);
		pd.put("PASSWORD", new SimpleHash("SHA-1", pd.get("USERNAME"),pass).toString());	//默认密码手机号后6位
		pd.put("PHONE",u_telphone);
		pd.put("NAME", user_name);
		pd.put("ROLE_ID","990cfa797e1143109cf1af394e802e75");
		pd.put("STATUS", "0");
		mv.addObject("msg","addDetails");
		try {
			userInfoServiceImpl.saveU(pd);
			userInfoServiceImpl.userInfoAdd(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("saveResult");
		return mv;
	}
	
	//删除图片
		@RequestMapping(value="/delTxiang")
		public void deltp(PrintWriter out) {
			try{
				PageData pd = new PageData();
				pd = this.getPageData();
				String PATH = pd.getString("PATH");													 		//图片路径
/*				DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
*/				if(PATH != null){
					userInfoServiceImpl.updTxiang(pd);											//删除数据中图片数据
				}	
				out.write("success");
			}catch(Exception e){
				e.printStackTrace();
			}
			out.close();
		}
	

	/**
	 * 图片上传
	 * @return 上传路径
	 */
	public String uploadPicture(String tpz,MultipartFile file){
		String path = "";
		if(null == tpz){tpz = "";}
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			path = ffile + "/" + fileName;				//路径
			System.out.println(filePath+"   "+path);
			Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
		}else{
			path = tpz;
		}
		return path;
	}
	
	/**
	 * 打开上传EXCEL页面
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("doctor/sufferer/uploadexcel");
		return mv;
	}
	
	/**
	 * 下载模版
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "Sufferer.xls", "Sufferer.xls");
		
	}
	
	/**
	 * 从EXCEL导入到数据库
	 */
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径 
			String fileName =  FileUpload.fileUp(file, filePath, "SuffererExcel");							//执行上传
			
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);	//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			
			/*存入数据库操作======================================*/
			
			
			/**
			 * var0 :姓名
			 * var1 :性别
			 * var2 :出身日期
			 * var3 :所在地区
			 * var4 :联系方式
			 * var5 :注册时间
			 */
			for(int i=0;i<listPd.size();i++){		
				pd.put("uuid", this.get32UUID());									
				pd.put("user_namezs", listPd.get(i).getString("var0"));
				pd.put("u_sex", listPd.get(i).getString("var1"));
				pd.put("u_birthday", listPd.get(i).getString("var2"));
				pd.put("u_address", listPd.get(i).getString("var3"));
				userInfoServiceImpl.saveUserExel(pd);
			}
			/*存入数据库操作======================================*/
			
			mv.addObject("msg","success");
		}
		
		mv.setViewName("save_result");
		return mv;
	}

}
