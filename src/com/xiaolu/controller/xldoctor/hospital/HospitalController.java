package com.xiaolu.controller.xldoctor.hospital;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
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
import com.xiaolu.service.xldoctor.hospital.HospitalService;
import com.xiaolu.util.AppUtil;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.DelAllFile;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.ObjectExcelView;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;
import com.xiaolu.util.Watermark;
@Controller
@RequestMapping(value="/hospital")
public class HospitalController extends BaseController{
	
	String menuUrl = "hospital/listHospitals.do"; //菜单地址(权限用)
	@Resource(name= "hospitalServiceImpl")
	private HospitalService hospitalServiceImpl;
	/**
	 * 显示用户列表(用户组)
	 */
	@RequestMapping(value="/listHospitals")
	public ModelAndView listHospitals(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String hospitalName = pd.getString("hospitalName");
		String hospitalCity = pd.getString("hospitalCity");
		if(hospitalName !=null && "".equals("hospitalName")){
			hospitalName = hospitalName.trim();
			pd.put("hospitalName", hospitalName);
		}
		if(hospitalCity !=null && "".equals("hospitalCity")){
			hospitalCity = hospitalCity.trim();
			pd.put("hospitalCity", hospitalCity);
		}
		pd.put("USER_ID", user.getUSER_ID());
		
		page.setPd(pd);
		List<PageData>	hospitalList = hospitalServiceImpl.listPdPageHospital(page);			//列出用户列表
		mv.setViewName("doctor/hospital/hospital_list");
		mv.addObject("hospitalList", hospitalList);
		mv.addObject("pd", pd);
		mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * 去修改用户页面
	 */
	@RequestMapping(value="/goHospitalEdit")
	public ModelAndView goEditH() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//顶部修改个人资料
		String fx = pd.getString("fx");
		
		//System.out.println(fx);
		
		if("head".equals(fx)){
			mv.addObject("fx", "head");
		}else{
			mv.addObject("fx", "user");
		}
		pd = hospitalServiceImpl.findByHospitalId(pd);
		mv.setViewName("doctor/hospital/hospital_edit");
		mv.addObject("msg", "hospitalEdit");
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * 去用户详情页面
	 */
	@RequestMapping(value="/goHospitalDetail")
	public ModelAndView goDetailH() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String strTabId = pd.getString("tabId");
		pd = hospitalServiceImpl.findByHospitalId(pd);
		if(strTabId == null || "".equals(strTabId)){
			pd.put("tabId", "1");
		}else{
			pd.put("tabId", strTabId);
		}
		mv.setViewName("doctor/hospital/hospital_detail");
		mv.addObject("msg", "hospitalDetail");
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * 修改医院信息
	 */
	@RequestMapping(value="/hospitalDetail")
	public ModelAndView detailSave(HttpServletRequest request,
			@RequestParam(value="tp",required=false) MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="tp2",required=false) MultipartFile file2,
			@RequestParam(value="tpz2",required=false) String tpz2,
			@RequestParam(value="tp3",required=false) MultipartFile file3,
			@RequestParam(value="tpz3",required=false) String tpz3,
			@RequestParam(value="tabId",required=false) String tabId,
			@RequestParam(value="hospitalid",required=false) String hospitalId,
			@RequestParam(value="hospitalname",required=false) String hospitalName,
			@RequestParam(value="anothername",required=false) String anothername,
			@RequestParam(value="hospitalurl",required=false) String hospitalUrl,
			@RequestParam(value="hospitalphone",required=false) String hospitalPhone,
			@RequestParam(value="introduction",required=false) String introduction,
			@RequestParam(value="ride",required=false) String ride,
			@RequestParam(value="inguide",required=false) String inguide,
			@RequestParam(value="outguide",required=false) String outguide) throws Exception{
		logBefore(logger, "修改医院信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
		pd.put("hospitalid", hospitalId);
		pd.put("tabId", tabId);
		pd.put("operateid", user.getUSER_ID());
		if(tabId.equals("1")){
			
			pd.put("hospitalname", hospitalName);
			pd.put("anothername", anothername);
			pd.put("hospitalurl", hospitalUrl);
			pd.put("hospitalphone", hospitalPhone);
			pd.put("introduction", introduction);
			pd.put("appearpicture", uploadPicture(tpz,file));
			
		}else if(tabId.equals("2")){
			
			pd.put("outnavigation", uploadPicture(tpz2,file2));
			pd.put("innavigation", uploadPicture(tpz3,file3));
			pd.put("ride", ride);
			
		}else{
			
			pd.put("inguide", inguide);
			pd.put("outguide", outguide);
			
		}
		
		hospitalServiceImpl.editHospital(pd);
		pd.clear();
		pd.put("hospitalId", hospitalId);
		//保存成功后查询加载
		pd = hospitalServiceImpl.findByHospitalId(pd);
		pd.put("tabId", tabId);
		mv.addObject("msg", "hospitalDetail");
		mv.addObject("pd", pd);
		mv.addObject("msginfo","save");
		//mv.setViewName("save_result");
		mv.setViewName("doctor/hospital/hospital_detail");
		return mv;
	}
	
	/**
	 * 保存医院信息
	 */
	@RequestMapping(value="/hospitalAdd")
	public ModelAndView addHospital(HttpServletRequest request,
			@RequestParam(value="tp",required=false) MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="hospitalname",required=false) String hospitalName,
			@RequestParam(value="hospitalcity",required=false) String hospitalCity,
			@RequestParam(value="hospitalrank",required=false) String hospitalRank,
			@RequestParam(value="hospitalurl",required=false) String hospitalUrl,
			@RequestParam(value="hospitalphone",required=false) String hospitalPhone,
			@RequestParam(value="hospitaladdress",required=false) String hospitalAddress) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		pd = this.getPageData();
		pd.put("hospitalname", hospitalName);
		if(null == hospitalServiceImpl.findByHospitalName(pd)){
			//if(Jurisdiction.buttonJurisdiction(menuUrl, "add")){userService.saveU(pd);} //判断新增权限
			String  ffile = DateUtil.getDays(), fileName = "";
			if (null != file && !file.isEmpty()) {
				String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			}else{
				System.out.println("上传失败");
			}
			
			
			pd.put("hospitalid", this.get32UUID());
			pd.put("hospitalcity", hospitalCity);
			pd.put("hospitalrank", hospitalRank);
			pd.put("hospitalurl", hospitalUrl);
			pd.put("hospitalphone", hospitalPhone);
			pd.put("hospitaladdress", hospitalAddress);
			pd.put("createtime", new Date());
			pd.put("operateid", user.getUSER_ID());
			pd.put("appearpicture", ffile + "/" + fileName);
			
			hospitalServiceImpl.addHospital(pd);
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 判断用户名是否存在
	 */
	@RequestMapping(value="/hasHospital")
	@ResponseBody
	public Object hasH(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(hospitalServiceImpl.findByHospitalName(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 修改医院信息
	 */
	@RequestMapping(value="/hospitalEdit")
	public ModelAndView editH(HttpServletRequest request,
			@RequestParam(value="tp",required=false) MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="hospitalid",required=false) String hospitalId,
			@RequestParam(value="hospitalpcid",required=false) String hospitalPcId,
			@RequestParam(value="hospitalname",required=false) String hospitalName,
			@RequestParam(value="hospitalcity",required=false) String hospitalCity,
			@RequestParam(value="hospitalrank",required=false) String hospitalRank,
			@RequestParam(value="hospitalurl",required=false) String hospitalUrl,
			@RequestParam(value="hospitalphone",required=false) String hospitalPhone,
			@RequestParam(value="hospitaladdress",required=false) String hospitalAddress) throws Exception{
		logBefore(logger, "修改医院信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
		pd.put("tabId", "edit");
		pd.put("hospitalid", hospitalId);
		pd.put("hospitalname", hospitalName);
		pd.put("hospitalcity", hospitalCity);
		pd.put("hospitalrank", hospitalRank);
		pd.put("hospitalurl", hospitalUrl);
		pd.put("hospitalphone", hospitalPhone);
		pd.put("hospitaladdress", hospitalAddress);
		pd.put("operateid", user.getUSER_ID());
		
		//修改
		if(null == tpz){tpz = "";}
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			pd.put("appearpicture", ffile + "/" + fileName);				//路径
		}else{
			pd.put("appearpicture", tpz);
		}
		Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
		
		
		hospitalServiceImpl.editHospital(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除医院信息
	 */
	@RequestMapping(value="/deleteHospital")
	public void deleteH(PrintWriter out){
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			//if(Jurisdiction.buttonJurisdiction(menuUrl, "del")){hospitalServiceImpl.deleteU(pd);}
			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("path")); //删除图片
			hospitalServiceImpl.deleteHospital(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAllH")
	@ResponseBody
	public Object deleteAllH() {
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String hospitalIds = pd.getString("hospitalIds");
			
			String arrayIds[] = hospitalIds.split(",");
			hospitalServiceImpl.deleteAllH(arrayIds);
			pd.put("msg", "ok");
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
			pd.put("msg", "no");
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 导出医院信息到EXCEL
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			//if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
				//检索条件===
				String hospitalName = pd.getString("hospitalName");
				if(null != hospitalName && !"".equals(hospitalName)){
					hospitalName = hospitalName.trim();
					pd.put("hospitalName", hospitalName);
				}
				
				String hospitalUrl = pd.getString("hospitalUrl");
				if(null != hospitalUrl && !"".equals(hospitalUrl)){
					hospitalUrl = hospitalUrl.trim();
					pd.put("hospitalUrl", hospitalUrl);
				}
				//检索条件===
				
				Map<String,Object> dataMap = new HashMap<String,Object>();
				List<String> titles = new ArrayList<String>();
				
				titles.add("医院名称"); 		//1
				titles.add("省市");  		//2
				titles.add("等级");			//3
				titles.add("网址");			//4
				titles.add("联系方式");			//5
				titles.add("地址");			//6
				
				dataMap.put("titles", titles);
				
				List<PageData> userList = hospitalServiceImpl.listAllHospital(pd);
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<userList.size();i++){
					PageData vpd = new PageData();
					vpd.put("var1", userList.get(i).getString("hospitalname"));		//1
					vpd.put("var2", userList.get(i).getString("hospitalcity"));		//2
					vpd.put("var3", userList.get(i).getString("hospitalrank"));			//3
					vpd.put("var4", userList.get(i).getString("hospitalurl"));	//4
					vpd.put("var5", userList.get(i).getString("hospitalphone"));		//5
					vpd.put("var6", userList.get(i).getString("hospitaladdress"));		//6
					varList.add(vpd);
				}
				dataMap.put("varList", varList);
				ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
				mv = new ModelAndView(erv,dataMap);
			//}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	//删除图片
	@RequestMapping(value="/delHospitalPi")
	public void deltp(PrintWriter out) {
		logBefore(logger, "删除图片");
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			String PATH = pd.getString("PATH");													 		//图片路径
			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
			if(PATH != null){
				hospitalServiceImpl.delHospitalPi(pd);																//删除数据中图片数据
			}	
			out.write("success");
			out.close();
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	
	/**
	 * 去新增医院信息页面
	 */
	@RequestMapping(value="/goHospitalAdd")
	public ModelAndView goAddH()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("doctor/hospital/hospital_edit");
		mv.addObject("msg", "hospitalAdd");
		mv.addObject("pd", pd);
		return mv;
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
			
			Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
		}else{
			path = tpz;
		}
		
		return path;
	}
	
	/* ===============================权限================================== */
	@SuppressWarnings("unchecked")
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
}
