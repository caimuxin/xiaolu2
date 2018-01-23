package com.xiaolu.controller.xldoctor.education;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.entity.system.User;
import com.xiaolu.service.xldoctor.hospital.HospitalService;
import com.xiaolu.serviceimpl.xldoctor.education.AdInfoServiceImpl;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.DelAllFile;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;
import com.xiaolu.util.Watermark;
@Controller
@RequestMapping(value="/adInfoController")
public class AdInfoController extends BaseController{
	
	@Resource(name="adInfoServiceImpl")
	private AdInfoServiceImpl adInfoServiceImpl;

	@Resource(name= "hospitalServiceImpl")
	private HospitalService hospitalServiceImpl;
	
	@RequestMapping(value="/allAdInfo")
	public ModelAndView allAdInfo(Page page) throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		try {
			List<PageData> adList=adInfoServiceImpl.findAdInfolistPage(page);
			mv.addObject("adList", adList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("pd", pd);
		mv.setViewName("doctor/education/adInfo_list");
		return mv;
	}
	
	@RequestMapping(value="/delAdInfo")
	public void delAdInfo(PrintWriter out){
		
		PageData pd=new PageData();
		try {
			pd=this.getPageData();
			adInfoServiceImpl.delAdInfo(pd);
			out.write("success");
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
	}
	@RequestMapping(value="/addAdInfo")
	public ModelAndView addAdInfo(HttpServletRequest request,
			@RequestParam(value="tp",required=false)MultipartFile file,
			@RequestParam(value="tps",required=false)MultipartFile files,
			@RequestParam(value="adSection",required=false)String adSection,
			@RequestParam(value="adTitle",required=false)String adTitle,
			@RequestParam(value="adSequence",required=false)String adSequence,
			@RequestParam(value="adSubtitle",required=false)String adSubtitle,
			@RequestParam(value="adSubinfo",required=false)String adSubinfo,
			@RequestParam(value="hospital_id",required=false)String hospital_id
			)throws Exception{
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
		try {
			String  ffile = DateUtil.getDays(), fileName = "",path ="";
			if (null != file && !file.isEmpty()) {
				String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
				path = ffile + "/" + fileName;				//路径
			}else{
				System.out.println("上传失败");
			}
			
			String  ffiles = DateUtil.getDays(), fileNames = "",paths="";
			if (null != files && !files.isEmpty()) {
				String filePaths = PathUtil.getClasspath() + Const.FILEPATHIMG + ffiles;		//文件上传路径
				fileNames = FileUpload.fileUp(files, filePaths, this.get32UUID());				//执行上传
				paths = ffiles + "/" + fileNames;				//路径
				pd.put("adIsub","Y");
			}else{
				pd.put("adIsub","N");
				System.out.println("上传子图文失败");
			}
			
			Date adDt=new Date();
			SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String adDts=sm.format(adDt);

			pd.put("adId",this.get32UUID());
			pd.put("adSection",adSection);
			pd.put("adTitle",adTitle);
			pd.put("adSequence",adSequence);
			pd.put("adPurl",path);
			pd.put("adSubtitle",adSubtitle);
			pd.put("adSubinfo",adSubinfo);
			pd.put("hospital_id",hospital_id);
			pd.put("adSuburl",paths);
			pd.put("adUserid",user.getUSER_ID());
			pd.put("adDt",adDts);
			adInfoServiceImpl.addAdInfo(pd);
			mv.addObject("msg","adInfo");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		mv.setViewName("saveResult");
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/updAdInfo")
	public ModelAndView updAdInfo(HttpServletRequest request,
			@RequestParam(value="tp",required=false)MultipartFile file,
			@RequestParam(value="tps",required=false)MultipartFile files,
			@RequestParam(value="tpz",required=false)String tpz,
			@RequestParam(value="tpzs",required=false)String tpzs,
			@RequestParam(value="adSection",required=false)String adSection,
			@RequestParam(value="adId",required=false)String adId,
			@RequestParam(value="adTitle",required=false)String adTitle,
			@RequestParam(value="adSequence",required=false)String adSequence,
			@RequestParam(value="adSubtitle",required=false)String adSubtitle,
			@RequestParam(value="hospital_id",required=false)String hospital_id,
			@RequestParam(value="adSubinfo",required=false)String adSubinfo,
			@RequestParam(value="purl",required=false)String purl,
			@RequestParam(value="suburl",required=false)String suburl){
		
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
		try {
			String  ffile = DateUtil.getDays(), fileName = "";
			String path = "";
			if(null == tpz){tpz = "";}
			if (null != file && !file.isEmpty()) {
				String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
				path = ffile + "/" + fileName;				//路径
				
				if(StringUtils.isNotBlank(purl)){
/*					DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + purl); 	//删除图片
*/				}
			}else{
				path=tpz;
			}
			
			String  ffiles = DateUtil.getDays(), fileNames = "";
			String paths = "";
			if(null == tpzs){tpzs = "";}
			if (null != files && !files.isEmpty()) {
				String filePaths = PathUtil.getClasspath() + Const.FILEPATHIMG + ffiles;		//文件上传路径
				fileNames = FileUpload.fileUp(files, filePaths, this.get32UUID());				//执行上传
				paths = ffiles + "/" + fileNames;	
				pd.put("adIsub","Y");
				
				if(StringUtils.isNotBlank(suburl)){
/*					DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + suburl); 	//删除图片
*/				}
			}else{
				pd.put("adIsub","Y");
				paths=tpzs;
				if(paths==""){
					pd.put("adIsub","N");
				}
			}
			
			pd.put("adId",adId);
			pd.put("adSection",adSection);
			pd.put("adTitle",adTitle);
			pd.put("adSequence",adSequence);
			pd.put("adPurl",path);
			pd.put("adSubtitle",adSubtitle);
			pd.put("adSubinfo",adSubinfo);
			pd.put("adSuburl",paths);
			pd.put("hospital_id",hospital_id);
			pd.put("adUserid",user.getUSER_ID());
			adInfoServiceImpl.updAdInfo(pd);
			mv.addObject("msg","adInfo");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		mv.setViewName("saveResult");
		return mv;
	}
	
	@RequestMapping(value="getAdd")
	public ModelAndView getAdd() throws Exception{
		ModelAndView mv=this.getModelAndView();
		
		List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
		mv.addObject("psList",psList);
		mv.addObject("msg","addAdInfo");
		mv.setViewName("doctor/education/adInfo_edit");
		return mv;
	}
	/**
	 * 去修改页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="getupd")
	public ModelAndView getupd() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
		pd=adInfoServiceImpl.getAdId(pd);
		mv.addObject("psList",psList);
		mv.addObject("msg","addAdInfo");
		mv.addObject("pd",pd);
		mv.setViewName("doctor/education/adInfo_upd");
		return mv;
	}
	
	
	
	//删除图片
	@RequestMapping(value="/delTxiang")
	public void deltp(PrintWriter out) {
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			String PATH = pd.getString("PATH");													 		//图片路径
/*			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
*/			if(PATH != null){
				adInfoServiceImpl.delPurl(pd); 																//删除数据中图片数据
			}	
			out.write("success");
		}catch(Exception e){
			e.printStackTrace();
		}
		out.close();
	}
	
	//删除图片
		@RequestMapping(value="/delTxiangs")
		public void delts(PrintWriter out) {
			try{
				PageData pd = new PageData();
				pd = this.getPageData();
				String PATH = pd.getString("PATH");													 		//图片路径
/*				DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
*/				if(PATH != null){
					adInfoServiceImpl.delSuburl(pd); 																//删除数据中图片数据
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
	
	
}
