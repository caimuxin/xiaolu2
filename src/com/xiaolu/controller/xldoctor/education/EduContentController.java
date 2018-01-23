package com.xiaolu.controller.xldoctor.education;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import com.xiaolu.serviceimpl.xldoctor.education.EduContentServiceImpl;
import com.xiaolu.serviceimpl.xldoctor.education.EduTypeServiceImpl;
import com.xiaolu.util.AppUtil;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.DelAllFile;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;
import com.xiaolu.util.Watermark;

@Controller
@RequestMapping(value="/eduContentController")
public class EduContentController extends BaseController{
	
	@Resource(name="eduContentServiceImpl")
	private EduContentServiceImpl ec;
	
	@Resource(name="eduTypeServiceImpl")
	private EduTypeServiceImpl et;
	
	/**
	 *条件查询
	 */
	@RequestMapping(value="/listPdPageContent")
	public ModelAndView listPdPageContent(Page page) throws Exception {
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		String conTitle=pd.getString("conTitle");		//关键字
		String userName=pd.getString("userName");		//作者
		String conComment=pd.getString("conComment");	//评价次数（起始）
		String conComments=pd.getString("conComments"); //评价次数（结束）
		
		if(conTitle !=null && "".equals("conTitle")){
			conTitle=conTitle.trim();
			pd.put("conTitle",conTitle);
		}
		
		if(userName !=null && "".equals("userName")){
			userName=userName.trim();
			pd.put("userName",userName);
		}
		if(conComment !=null && "".equals("conComment")){
			conComment=conComment.trim();
			pd.put("conComment",conComment);
		}
		if(conComments !=null && "".equals("conComments")){
			conComments=conComments.trim();
			pd.put("conComments",conComments);
		}
		
		page.setPd(pd);
		try {
			List<PageData> typeList=et.getEduTypeGrade(null);
			
			List<PageData> contentList=ec.listPdPageContent(page);
			mv.addObject("typeList",typeList);
			mv.addObject("contentList", contentList);
			mv.addObject("pd",pd);
			mv.setViewName("doctor/education/eduContent_list");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/**
	 * 查询宣教标题是否存在
	 */
	@RequestMapping(value="/getContentName")
	@ResponseBody
	public Object getContentName(){
		Map<String,String> map=new HashMap<String, String>();
		String errInfo = "success";
		PageData pd=new PageData();
		try {
			pd=this.getPageData();
			pd=ec.getContentName(pd);
			if(pd!=null){
				errInfo="error";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
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
			String CONTENT_IDS = pd.getString("CONTENT_IDS");
			
			if(null != CONTENT_IDS && !"".equals(CONTENT_IDS)){
				String ArrayCONTENT_IDS[] = CONTENT_IDS.split(",");
				ec.delContent(ArrayCONTENT_IDS);
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
	 * 去宣教内容发布页面
	 */
	@RequestMapping(value="/goAddContent")
	public ModelAndView goAddH()throws Exception{
		ModelAndView mv = this.getModelAndView();
		/*PageData pd = new PageData();
		pd = this.getPageData();*/
		
		List<PageData> typeList=et.getEduTypeGrade(null);
		mv.addObject("msg", "addContent");
		mv.addObject("typeList",typeList);
		mv.setViewName("doctor/education/eduContent_edit");
		return mv;
	}
	
	/**
	 * 去宣教内容修改页面
	 */
	@RequestMapping(value="/goUpdContent")
	public ModelAndView goUpdH()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> typeList=et.getEduTypeGrade(null);
		pd=ec.getContentId(pd);
		mv.addObject("msg", "updContent");
		mv.addObject("typeList",typeList);
		mv.addObject("pd",pd);
		mv.setViewName("doctor/education/eduContent_edit");
		return mv;
	}
	
	/**
	 * 去宣教内容详情页面
	 */
	@RequestMapping(value="/goUpdContents")
	public ModelAndView goUpdHs()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> typeList=et.getEduTypeGrade(null);
		pd=ec.getContentId(pd);
		mv.addObject("msg", "updContent");
		mv.addObject("typeList",typeList);
		mv.addObject("pd",pd);
		mv.setViewName("doctor/education/eduContent_Info");
		return mv;
	}
	
	/**
	 * 宣教内容发布
	 * @throws Exception 
	 */
	
	@RequestMapping(value="/addContent")
	public ModelAndView addContent(HttpServletRequest request,
			@RequestParam(value="tp",required=false)MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="eduId",required=false)String eduId,
			@RequestParam(value="conTitle",required=false)String conTitle,
			@RequestParam(value="conFullinfo",required=false)String conFullinfo
			) throws Exception{
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String conDt=sdf.format(date);
		try {
			/*String  ffile = DateUtil.getDays(), fileName = "";
			if (null != file && !file.isEmpty()) {
				String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			}else{
				System.out.println("上传失败");
			}*/
			
			pd.put("contentId",this.get32UUID());
			pd.put("conUserid",user.getUSER_ID());
			pd.put("conAttach",uploadPicture(tpz,file));
			pd.put("eduId",eduId);
			pd.put("conTitle",conTitle);
			pd.put("conFullinfo",conFullinfo);
			pd.put("conDt",conDt);
			pd.put("conComment","0");
			pd.put("conBrowse","0");
			
			ec.addEduContent(pd);
			mv.addObject("msg","success");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		
		mv.setViewName("saveResult");
		return mv;
	}
	
	
	/**
	 * 宣教内容修改
	 * @throws Exception 
	 */
	
	@RequestMapping(value="/updContent")
	public ModelAndView updContent(HttpServletRequest request,
			@RequestParam(value="tp",required=false)MultipartFile file,
			@RequestParam(value="eduId",required=false)String eduId,
			@RequestParam(value="content_id",required=false)String content_id,
			@RequestParam(value="conTitle",required=false)String conTitle,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="conFullinfo",required=false)String conFullinfo
			) throws Exception{
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		try {

			pd.put("content_id",content_id);
			pd.put("edu_id",eduId);
			pd.put("con_title",conTitle);
			pd.put("con_fullinfo",conFullinfo);
			pd.put("con_attach",uploadPicture(tpz,file));
			ec.updEduContent(pd);
			mv.addObject("msg","success");
		} catch (Exception e) {
			mv.addObject("msg","failed");
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
/*			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
*/			if(PATH != null){
				ec.delEduPhoto(pd); 																//删除数据中图片数据
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
			
//			Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);//加水印
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
