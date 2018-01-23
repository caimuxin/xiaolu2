package com.xiaolu.controller.xldoctor.doctor;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.service.system.user.UserService;
import com.xiaolu.service.xldoctor.doctor.DoctorManageService;
import com.xiaolu.util.AppUtil;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.DelAllFile;
import com.xiaolu.util.FileDownload;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.ObjectExcelRead;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;
import com.xiaolu.util.Watermark;

@Controller
@RequestMapping(value="/doctorManage")
public class DoctorManageController extends BaseController{
	
	String menuUrl = "doctorManage/doctorInfoList.do"; //菜单地址(权限用)
	@Resource(name = "doctorManageServiceImpl")
	private DoctorManageService doctorManageServiceImpl;
	@Resource(name="userService")
	private UserService userService;
	/**
	 * 医生列表
	 */
	@RequestMapping(value="/doctorInfoList")
	public ModelAndView listDoctorInfo(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try{
			if(pd.get("doctorStatus")!=null && "".equals(pd.get("doctorStatus").toString())){
				pd.remove("doctorStatus");
			}
			List<PageData> result = doctorManageServiceImpl.docotrInfoList(page);
			mv.addObject("doctorList",result);
			
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		mv.addObject("pd",pd);
		mv.setViewName("doctor/doctormanage/doctorinfo_list");
		
		return mv;
	}
	
	/**
	 * 跳转到医生添加
	 * @throws Exception 
	 */
	@RequestMapping(value="toAddDoctor")
	public ModelAndView getAddInfo() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd = this.getPageData();
		List<PageData> hOption = doctorManageServiceImpl.hospitalOption(pd);
		mv.addObject("hOption",hOption);
		mv.addObject("msg","addDoctor");
		mv.setViewName("doctor/doctormanage/doctorinfo_detail");
		return mv;
	}
	
	
	/**
	 * 去医生修改页面
	 */
	@RequestMapping(value="/toUpdDoctor")
	public ModelAndView toUpdDoctor() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData> hOption = doctorManageServiceImpl.hospitalOption(pd);
		PageData pdOffice=new PageData();
		pd=doctorManageServiceImpl.findDoctorId(pd);
		pdOffice.put("hospitalId", pd.get("hospital_id"));
		List<PageData> OOption = doctorManageServiceImpl.officeOption(pdOffice);
		mv.addObject("pd",pd);
		mv.addObject("hOption",hOption);
		mv.addObject("OOption",OOption);
		mv.addObject("msg","updDoctor");
		mv.setViewName("doctor/doctormanage/doctorinfo_detail");
		return mv;
	}
	
	
	/**
	 * 去医生详情页面
	 */
	@RequestMapping(value="/toUpdDoctors")
	public ModelAndView toUpdDoctors() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData> hOption = doctorManageServiceImpl.hospitalOption(pd);
		PageData pdOffice=new PageData();
		pd=doctorManageServiceImpl.findDoctorId(pd);
		pdOffice.put("hospitalId", pd.get("hospital_id"));
		List<PageData> OOption = doctorManageServiceImpl.officeOption(pdOffice);
		mv.addObject("pd",pd);
		mv.addObject("hOption",hOption);
		mv.addObject("OOption",OOption);
		mv.addObject("msg","updDoctor");
		mv.setViewName("doctor/doctormanage/doctorinfo_Info");
		return mv;
	}
	
	/**
	 * 去病患列表页面
	 */
	@RequestMapping(value="/toDisease")
	public ModelAndView toDisease(Page page) throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> result = doctorManageServiceImpl.diseaseListPage(page);
		mv.addObject("diseaseList",result);
		mv.addObject("pd",pd);
		mv.setViewName("doctor/doctormanage/disease_list");
		return mv;
	}
	/**
	 * 添加医生
	 */
	@RequestMapping(value="addDoctor")
	public ModelAndView addDoctor(HttpServletRequest request,
		@RequestParam(value="tp",required=false)MultipartFile file,
		@RequestParam(value="tpz",required=false) String tpz,
		@RequestParam(value="doctor_position",required=false) String doctor_position,
		@RequestParam(value="doctor_work",required=false) String doctor_work,
		@RequestParam(value="doctor_name",required=false) String doctor_name,
		@RequestParam(value="doctor_birth",required=false) String doctor_birth,
		@RequestParam(value="doctor_sex",required=false) String doctor_sex,
		@RequestParam(value="doctor_phone",required=false) String doctor_phone,
		@RequestParam(value="d_papertype",required=false) String d_papertype,
		@RequestParam(value="d_papernum",required=false) String d_papernum,
		@RequestParam(value="doctor_education",required=false) String doctor_education,
		@RequestParam(value="d_award",required=false) String d_award,
		@RequestParam(value="hospital_id",required=false) String hospital_id,
		@RequestParam(value="office_id",required=false) String office_id,
		@RequestParam(value="doctor_brief",required=false) String doctor_brief,
		@RequestParam(value="doctor_expert",required=false) String doctor_expert
		){
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		String uuid=this.get32UUID();
		pd.put("doctor_id",uuid);
		pd.put("doctor_position",doctor_position);
		pd.put("doctor_work",doctor_work);
		pd.put("doctor_name",doctor_name);
		pd.put("doctor_birth",doctor_birth);
		pd.put("doctor_sex",doctor_sex);
		pd.put("doctor_phone",doctor_phone);
		pd.put("d_papertype",d_papertype);
		pd.put("d_papernum",d_papernum);
		pd.put("doctor_education",doctor_education);
		pd.put("d_award",d_award);
		pd.put("hospital_id",hospital_id);
		pd.put("office_id",office_id);
		pd.put("doctor_brief",doctor_brief);
		pd.put("doctor_expert",doctor_expert);
		pd.put("doctor_treats",0);
		pd.put("doctor_photo",uploadPicture(tpz, file));
		
		
		
		
		pd.put("user_id",uuid);
		pd.put("username",doctor_phone);
		String pwss=pd.getString("doctor_phone");
		if(StringUtils.isNotBlank(pwss)){
			pwss=pwss.substring(5);
		}
		pd.put("password", new SimpleHash("SHA-1", pd.get("username"),pwss).toString());	//默认密码手机号后6位
		pd.put("name",doctor_name);
		pd.put("role_id","0f4b78de80714543ab0abed0a2f31b01");
		pd.put("status",0);
		pd.put("phone", doctor_phone);
		
		try {
			doctorManageServiceImpl.saveDoctor(pd);
			mv.addObject("dmc","addDoctor");
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("saveResult");
		return mv;
	}
	
	/**
	 * 修改医生
	 */
	@RequestMapping(value="updDoctor")
	public ModelAndView updDoctor(HttpServletRequest request,
		@RequestParam(value="tp",required=false)MultipartFile file,
		@RequestParam(value="tpz",required=false) String tpz,
		@RequestParam(value="doctor_id",required=false) String doctor_id,
		@RequestParam(value="doctor_position",required=false) String doctor_position,
		@RequestParam(value="doctor_work",required=false) String doctor_work,
		@RequestParam(value="doctor_name",required=false) String doctor_name,
		@RequestParam(value="doctor_birth",required=false) String doctor_birth,
		@RequestParam(value="doctor_sex",required=false) String doctor_sex,
		@RequestParam(value="doctor_phone",required=false) String doctor_phone,
		@RequestParam(value="d_papertype",required=false) String d_papertype,
		@RequestParam(value="d_papernum",required=false) String d_papernum,
		@RequestParam(value="doctor_education",required=false) String doctor_education,
		@RequestParam(value="d_award",required=false) String d_award,
		@RequestParam(value="hospital_id",required=false) String hospital_id,
		@RequestParam(value="office_id",required=false) String office_id,
		@RequestParam(value="doctor_brief",required=false) String doctor_brief,
		@RequestParam(value="doctor_expert",required=false) String doctor_expert
		){
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("doctor_id",doctor_id);
		pd.put("doctor_position",doctor_position);
		pd.put("doctor_work",doctor_work);
		pd.put("doctor_name",doctor_name);
		pd.put("doctor_birth",doctor_birth);
		pd.put("doctor_sex",doctor_sex);
		pd.put("doctor_phone",doctor_phone);
		pd.put("d_papertype",d_papertype);
		pd.put("d_papernum",d_papernum);
		pd.put("doctor_education",doctor_education);
		pd.put("d_award",d_award);
		pd.put("hospital_id",hospital_id);
		pd.put("office_id",office_id);
		pd.put("doctor_brief",doctor_brief);
		pd.put("doctor_expert",doctor_expert);
		pd.put("doctor_treats",0);
		pd.put("doctor_photo",uploadPicture(tpz, file));
		try {
			doctorManageServiceImpl.updDoctor(pd);
			mv.addObject("dmc","updDoctor");
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("saveResult");
		return mv;
	}
	
	
	/**
	 *根据医院id查询科室信息
	 */
	@RequestMapping(value="/officeOption")
	@ResponseBody
	public Object findOfficeOption(){
		PageData pd=new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		
		try {
			pd=this.getPageData();
			List<PageData> pdList = doctorManageServiceImpl.officeOption(pd);
			
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 根据医院id查询医生信息
	 */
	@RequestMapping(value="/doctorOption")
	@ResponseBody
	public Object findHospitalId(){
		PageData pd=new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		
		try {
			pd=this.getPageData();
			List<PageData> pdList = doctorManageServiceImpl.getHospitalId(pd);
			
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	
	/**
	 *选中删除 
	 */
	@RequestMapping(value="/deleteAllDoctor")
	@ResponseBody
	public Object deleteAllE(){
		PageData pd=new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		
		try {
			pd=this.getPageData();
			List<PageData> pdList=new ArrayList<PageData>();
			String ids = pd.getString("doctorIds");
			
			if(null != ids && !"".equals(ids)){
				String doctorIds[] = ids.split(",");
				doctorManageServiceImpl.doctorInfoDelAll(doctorIds);
				userService.deleteAllU(doctorIds);
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
	 * 打开上传EXCEL页面
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("doctor/doctormanage/uploadexcel");
		return mv;
	}
	
	/**
	 * 下载模版
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "Doctors.xls", "Doctors.xls");
		
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
			String fileName =  FileUpload.fileUp(file, filePath, "Doctorsexcel");							//执行上传
			
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);	//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			
			/*存入数据库操作======================================*/
			
			
			/**
			 * var0 :姓名
			 * var1 :性别
			 * var2 :年龄
			 * var3 :职称
			 * var4 :科室
			 * var5 :所在医院
			 * var6 :执证时间
			 */
			for(int i=0;i<listPd.size();i++){		
				pd.put("doctorName", listPd.get(i).getString("var0"));									
				pd.put("doctorSex", listPd.get(i).getString("var1"));
				
				
				pd.put("doctorBirth", listPd.get(i).getString("var2"));
				
				pd.put("doctorPosition", listPd.get(i).getString("var3"));
				pd.put("officeId", listPd.get(i).getString("var4"));
				
				pd.put("hospitalId", listPd.get(i).getString("var5"));
				pd.put("dAward", listPd.get(i).getString("var6"));
				doctorManageServiceImpl.saveDE(pd);
			}
			/*存入数据库操作======================================*/
			
			mv.addObject("msg","success");
		}
		
		mv.setViewName("save_result");
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
			System.out.println(filePath+"   "+path);
			Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
		}else{
			path = tpz;
		}
		return path;
	}

	/**
	 * 删除医生头像
	 * @return 上传路径
	 */
			@RequestMapping(value="/delTxiang")
			public void deltp(PrintWriter out) {
				try{
					PageData pd = new PageData();
					pd = this.getPageData();
					String PATH = pd.getString("PATH");													 		//图片路径
					DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
					if(PATH != null){
						doctorManageServiceImpl.delDoctorPhoto(pd);//删除数据中图片数据
					}	
					out.write("success");
				}catch(Exception e){
					e.printStackTrace();
				}
				out.close();
			}
		
}
