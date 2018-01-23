package com.xiaolu.controller.xldoctor.sufferer;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.hospital.HospitalService;
import com.xiaolu.service.xldoctor.sufferer.MedFollowdService;
import com.xiaolu.service.xldoctor.sufferer.MedFollowpService;
import com.xiaolu.serviceimpl.xldoctor.sufferer.MedFollowServiceImpl;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.DelAllFile;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;
import com.xiaolu.util.Watermark;
@Controller
@RequestMapping("/MedFollowController")
public class MedFollowController extends BaseController{
	
	@Resource(name="MedFollowServiceImpl")
	private MedFollowServiceImpl medFollowServiceImpl;
	@Resource(name="MedFollowpService")
	private MedFollowpService medFollowpService;
	@Resource(name="MedFollowdService")
	private MedFollowdService medFollowdService;
	@Resource(name= "hospitalServiceImpl")
	private HospitalService hospitalServiceImpl;
	/**
	 * 查询所有随访记录
	 */
	@RequestMapping("/listPageMedFollow")
	public ModelAndView listPageMedFollow(Page page)throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		List<PageData> mflist=medFollowServiceImpl.listPageMedFollow(page);
		
		mv.addObject("pd",pd);
		mv.addObject("mflist",mflist);
		mv.setViewName("doctor/sufferer/medfollow_list");
		return mv;
	}
	
	
	/**
	 * 
	 *	删除随访记录 P
	 */
	@RequestMapping(value="/medFollowDelp")
	public void medFollowDelp(PrintWriter out) throws Exception{
		
		PageData pd=new PageData();
		pd=this.getPageData();
		
		try {
			medFollowpService.medFollowPDel(pd);
/*			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
*/			out.write("success");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 *	删除随访记录D
	 */
	@RequestMapping(value="/medFollowDeld")
	public void medFollowDeld(PrintWriter out) throws Exception{
		
		PageData pd=new PageData();
		pd=this.getPageData();
		
		try {
			medFollowdService.medFollowDDel(pd);
			out.write("success");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	///																////////										//////////												//////
	
	
	
	/**
	 *	去新增孕期随访页
	 */
	@RequestMapping(value="/getMedFollowPAdd")
	public ModelAndView getMedFollowPAdd() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		mv.addObject("pd",pd);
		List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
		mv.addObject("psList",psList);
		mv.addObject("msg","MedFollowPAdd");
		mv.setViewName("doctor/sufferer/medfollow_p");
		return mv;
	}
	
	/**
	 * 去随访修改页面--孕期随访
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/getMedFollowPUpd")
	public ModelAndView getMpUpd() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		 String uuid=pd.getString("uuid");
		 
		 try {
			 pd=medFollowServiceImpl.findMedFollowPId(pd);
			 pd.put("uuid",uuid);
			 List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			 pd.put("hospital_id",pd.getString("HOSPITAL_ID"));
			 List<PageData>dcList=hospitalServiceImpl.getHospitalId(pd);
			 mv.addObject("dcList",dcList);
			mv.addObject("psList",psList);
			 mv.addObject("pd",pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("msg","MedFollowPUpd");
		mv.setViewName("doctor/sufferer/medfollow_p");
		return mv;
	}
	
	
	/**
	 * 去随访详情页面--孕期随访
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/getMedFollowPUpds")
	public ModelAndView getMpUpds() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		 String uuid=pd.getString("uuid");
		 
		 try {
			 pd=medFollowServiceImpl.findMedFollowPId(pd);
			 pd.put("uuid",uuid);
			 List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			 pd.put("hospital_id",pd.getString("HOSPITAL_ID"));
			 List<PageData>dcList=hospitalServiceImpl.getHospitalId(pd);
			 mv.addObject("dcList",dcList);
			mv.addObject("psList",psList);
			 mv.addObject("pd",pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("msg","MedFollowPUpd");
		mv.setViewName("doctor/sufferer/medfollow_Pinfo");
		return mv;
	}
	
	/**
	 * 添加随访记录--孕期
	 */
	@RequestMapping(value="MedFollowPAdd")
	public ModelAndView medFollowPAdd(HttpServletRequest request,
		@RequestParam(value="tp",required=false)MultipartFile file,
		@RequestParam(value="tpz",required=false) String tpz,
		@RequestParam(value="uuid",required=false) String uuid,
		@RequestParam(value="f_type",required=false) String f_type,
		@RequestParam(value="f_date",required=false) String f_date,
		@RequestParam(value="doctor_id",required=false) String doctor_id,
		@RequestParam(value="hospital_id",required=false) String hospital_id,
		@RequestParam(value="f_style",required=false) String f_style,
		@RequestParam(value="p_weight",required=false) String p_weight,
		@RequestParam(value="p_waist",required=false) String p_waist,
		@RequestParam(value="p_heart",required=false) String p_heart,
		@RequestParam(value="p_blood",required=false) String p_blood,
		@RequestParam(value="p_unusual",required=false) String p_unusual,
		@RequestParam(value="p_education",required=false) String p_education,
		@RequestParam(value="p_attachment",required=false) String p_attachment
		){
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		pd.put("f_id", this.get32UUID());
		pd.put("user_id",uuid);
		if(f_type.equals("孕期随访")){
			f_type="p";
		}
		pd.put("f_type",f_type);
		pd.put("f_date",f_date);
		pd.put("doctor_id",doctor_id);
		pd.put("hospital_id",hospital_id);
		pd.put("f_style",f_style);
		pd.put("p_weight",p_weight);
		pd.put("p_waist",p_waist);
		pd.put("p_heart",p_heart);
		pd.put("p_blood",p_blood);
		pd.put("p_unusual",p_unusual);
		pd.put("p_education",p_education);
		pd.put("p_attachment",uploadPicture(tpz, file));
		pd.put("have_finished",0);
		try {
			medFollowpService.medFollowPAdd(pd);
			medFollowServiceImpl.medFollowAdd(pd);
			mv.addObject("med","medFollowPAdd");
			mv.addObject("uuid",uuid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("saveResult");
		return mv;
	}
	
	/**
	 * 修改随访记录--孕期
	 */
	@RequestMapping(value="MedFollowPUpd")
	public ModelAndView medFollowPUpd(HttpServletRequest request,
		@RequestParam(value="tp",required=false)MultipartFile file,
		@RequestParam(value="tpz",required=false) String tpz,
		@RequestParam(value="uuid",required=false) String uuid,
		@RequestParam(value="f_id",required=false) String f_id,
		@RequestParam(value="f_type",required=false) String f_type,
		@RequestParam(value="f_date",required=false) String f_date,
		@RequestParam(value="doctor_id",required=false) String doctor_id,
		@RequestParam(value="hospital_id",required=false) String hospital_id,
		@RequestParam(value="f_style",required=false) String f_style,
		@RequestParam(value="p_weight",required=false) String p_weight,
		@RequestParam(value="p_waist",required=false) String p_waist,
		@RequestParam(value="p_heart",required=false) String p_heart,
		@RequestParam(value="p_blood",required=false) String p_blood,
		@RequestParam(value="p_unusual",required=false) String p_unusual,
		@RequestParam(value="p_education",required=false) String p_education,
		@RequestParam(value="p_attachment",required=false) String p_attachment
		){
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		if(f_type.equals("孕期随访")){
			f_type="p";
		}
		pd.put("f_id",f_id);													/////
		pd.put("user_id",uuid);
		pd.put("f_type",f_type);
		pd.put("f_date",f_date);
		pd.put("doctor_id",doctor_id);
		pd.put("hospital_id",hospital_id);
		pd.put("f_style",f_style);
		pd.put("p_weight",p_weight);
		pd.put("p_waist",p_waist);
		pd.put("p_heart",p_heart);
		pd.put("p_blood",p_blood);
		pd.put("p_unusual",p_unusual);
		pd.put("p_education",p_education);
		pd.put("p_attachment",uploadPicture(tpz, file));
		try {
			medFollowpService.medFollowPUpd(pd);
			medFollowServiceImpl.medFollowUpd(pd);
			mv.addObject("med","medFollowPAdd");
			mv.addObject("uuid",uuid);
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
/*					DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
*/					if(PATH != null){
						medFollowpService.attachmentDel(pd);										//删除数据中图片数据
					}	
					out.write("success");
				}catch(Exception e){
					e.printStackTrace();
				}
				out.close();
			}
	
	
	///																	//////										//////													/////
	
	/**
	 *	去新增产后随访页
	 */
	@RequestMapping(value="/getMedFollowDAdd")
	public ModelAndView getMedFollowDAdd() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
		mv.addObject("psList",psList);
		mv.addObject("pd",pd);
		mv.addObject("msg","MedFollowDAdd");
		mv.setViewName("doctor/sufferer/medfollow_d");
		return mv;
	}
	
	
	/**
	 * 添加随访记录--产后
	 */
	@RequestMapping(value="MedFollowDAdd")
	public ModelAndView medFollowDAdd(){
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		try {
			String ftype=pd.getString("f_type");
			String uuid=pd.getString("uuid");
			if(ftype.equals("产后随访")){
				pd.put("f_type","d");
			}
			
			if(!pd.getString("d_uber1").equals("")){
				pd.put("d_uber",pd.getString("d_uber1"));
			}
			if(!pd.getString("d_lyma1").equals("")){
				pd.put("d_lyma",pd.getString("d_lyma1"));
			}
			if(!pd.getString("d_womb1").equals("")){
				pd.put("d_womb",pd.getString("d_womb1"));
			}
			if(!pd.getString("d_wound1").equals("")){
				pd.put("d_wound",pd.getString("d_wound1"));
			}
			
			pd.put("f_id",this.get32UUID());
			pd.put("user_id",pd.getString("uuid"));
			pd.put("have_finished",0);
			medFollowServiceImpl.medFollowAdd(pd);
			medFollowdService.medFollowDAdd(pd);
			mv.addObject("med","medFollowDAdd");
			mv.addObject("uuid",uuid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("saveResult");
		return mv;
	}
	
	
	/**
	 * 去随访修改页面--产后随访
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/getMedFollowDUpd")
	public ModelAndView getMdUpd() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		 String uuid=pd.getString("uuid");
		 
		 try {
			 pd=medFollowServiceImpl.findMedFollowDId(pd);
			 pd.put("uuid",uuid);
			 List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			 pd.put("hospital_id",pd.getString("HOSPITAL_ID"));
			 List<PageData>dcList=hospitalServiceImpl.getHospitalId(pd);
			 mv.addObject("dcList",dcList);
			 mv.addObject("psList",psList);
			 mv.addObject("pd",pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("msg","MedFollowDUpd");
		mv.setViewName("doctor/sufferer/medfollow_d");
		return mv;
	}
	
	/**
	 * 去随访详情页面--产后随访
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/getMedFollowDUpds")
	public ModelAndView getMdUpds() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		 String uuid=pd.getString("uuid");
		 
		 try {
			 pd=medFollowServiceImpl.findMedFollowDId(pd);
			 pd.put("uuid",uuid);
			 List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			 pd.put("hospital_id",pd.getString("HOSPITAL_ID"));
			 List<PageData>dcList=hospitalServiceImpl.getHospitalId(pd);
			 mv.addObject("dcList",dcList);
			 mv.addObject("psList",psList);
			 mv.addObject("pd",pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("msg","MedFollowDUpd");
		mv.setViewName("doctor/sufferer/medfollow_Dinfo");
		return mv;
	}
	
	/**
	 * 修改随访记录--产后
	 */
	@RequestMapping(value="MedFollowDUpd")
	public ModelAndView medFollowDUpd(){
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		try {
			String uuid=pd.getString("uuid");
			pd.put("user_id",pd.getString("uuid"));
			if(pd.getString("f_type").equals("产后随访")){
				pd.put("f_type","d");
			}
			
			if(!pd.getString("d_uber1").equals("")){
				pd.put("d_uber",pd.getString("d_uber1"));
			}
			if(!pd.getString("d_lyma1").equals("")){
				pd.put("d_lyma",pd.getString("d_lyma1"));
			}
			if(!pd.getString("d_womb1").equals("")){
				pd.put("d_womb",pd.getString("d_womb1"));
			}
			if(!pd.getString("d_wound1").equals("")){
				pd.put("d_wound",pd.getString("d_wound1"));
			}
			
			medFollowServiceImpl.medFollowUpd(pd);
			medFollowdService.medFollowDUpd(pd);
			mv.addObject("med","medFollowDUpd");
			mv.addObject("uuid",uuid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("saveResult");
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
}
