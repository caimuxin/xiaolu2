package com.xiaolu.controller.xldoctor.sufferer;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.service.xldoctor.hospital.HospitalService;
import com.xiaolu.service.xldoctor.sufferer.HospitalizedDeliverService;
import com.xiaolu.service.xldoctor.sufferer.MedFollowdService;
import com.xiaolu.serviceimpl.xldoctor.sufferer.HospitalizedServiceImpl;
import com.xiaolu.serviceimpl.xldoctor.sufferer.HospitalizedTreatServiceImpl;
import com.xiaolu.serviceimpl.xldoctor.sufferer.MedFollowServiceImpl;
import com.xiaolu.serviceimpl.xldoctor.sufferer.UserInfoServiceImpl;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.DelAllFile;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;
import com.xiaolu.util.Watermark;
@Controller
@RequestMapping(value="/hospitalizedController")
public class HospitalizedController extends BaseController{
	
	@Resource(name="hospitalizedServiceImpl")
	private HospitalizedServiceImpl hospitalizedServiceImpl;
	@Resource(name="hospitalizedTreatServiceImpl")
	private HospitalizedTreatServiceImpl hospitalizedTreatServiceImpl;
	@Resource(name="hospitalizedDeliverService")
	private HospitalizedDeliverService hospitalizedDeliverService;
	@Resource(name= "hospitalServiceImpl")
	private HospitalService hospitalServiceImpl;
	@Resource(name="userInfoServiceImpl")
	private UserInfoServiceImpl userInfoServiceImpl;
	@Resource(name="MedFollowServiceImpl")
	private MedFollowServiceImpl medFollowServiceImpl;
	@Resource(name="MedFollowdService")
	private MedFollowdService medFollowdService;
	
	
	/**
	 * 
	 *	查询所有住院信息 
	 */
	
	@RequestMapping(value="/listPdPageHospitalized")
	public ModelAndView listPdPageHospitalized(Page page)throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		List<PageData> hzList=hospitalizedServiceImpl.listPdPageHospitalized(page);
		
		mv.addObject("pd",pd);
		mv.addObject("hzList",hzList);
		mv.setViewName("doctor/sufferer/hospitalized_list");
		
		return mv;
	}
	
	/**
	 * 
	 *	删除住院信息 
	 */
	@RequestMapping(value="/hospitalizedDel")
	public void hospitalizedDel(PrintWriter out) throws Exception{
		
		PageData pd=new PageData();
		pd=this.getPageData();
		
		try {
			hospitalizedServiceImpl.hospitalizedDel(pd);
			String mType=pd.getString("htype");
			if(mType !=null && mType.trim().equals("b")){
				/*DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("photod")); 	//删除图片
*/			}else if(mType !=null && mType.trim().equals("t")){
/*				DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("photot")); 	//删除图片
*/			}
			out.write("success");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	///							///						///						///				///					///				///				///						///
	
	/**
	 *	去新增住院记录页--住院治疗
	 */
	@RequestMapping(value="/getHospitalizedTreat")
	public ModelAndView getHospitalizedTreat() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
		mv.addObject("pd",pd);
		mv.addObject("psList",psList);
		mv.addObject("msg","hospitalizedTreatAdd");
		mv.setViewName("doctor/sufferer/hospitalized_treat");
		return mv;
	}
	
	/**
	 * 去修改医院记录页--住院治疗
	 */
	@RequestMapping(value="/getHtUpd")
	public ModelAndView getHtAdd() throws Exception{
		 ModelAndView mv=this.getModelAndView();
		 PageData pd=new PageData();
		 pd=this.getPageData();
		 String uuid=pd.getString("uuid");
		 try {
			 pd=hospitalizedServiceImpl.findUserInfoId(pd);
			 List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			 pd.put("hospital_id",pd.getString("HOSPITAL_ID"));
			 List<PageData>dcList=hospitalizedServiceImpl.getHospitalId(pd);
			 mv.addObject("dcList",dcList);
			 mv.addObject("psList",psList);
			 pd.put("uuid",uuid);
			 mv.addObject("pd",pd);
		 }catch (Exception e) {
			e.printStackTrace();
		 }
			mv.addObject("msg","hospitalizedTreatUpd");
			mv.setViewName("doctor/sufferer/hospitalized_treat");
			return mv;	
	}
	/**
	 * 去修改医院详情页--住院治疗
	 */
	@RequestMapping(value="/getHtUpds")
	public ModelAndView getHtAdds() throws Exception{
		 ModelAndView mv=this.getModelAndView();
		 PageData pd=new PageData();
		 pd=this.getPageData();
		 String uuid=pd.getString("uuid");
		 try {
			 pd=hospitalizedServiceImpl.findUserInfoId(pd);
			 List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			 pd.put("hospital_id",pd.getString("HOSPITAL_ID"));
			 List<PageData>dcList=hospitalizedServiceImpl.getHospitalId(pd);
			 mv.addObject("dcList",dcList);
			 mv.addObject("psList",psList);
			 pd.put("uuid",uuid);
			 mv.addObject("pd",pd);
		 }catch (Exception e) {
			e.printStackTrace();
		 }
			mv.addObject("msg","hospitalizedTreatUpd");
			mv.setViewName("doctor/sufferer/hospitalized_Tinfo");
			return mv;	
	}
	/**
	 * 添加住院记录--住院治疗
	 */
	@RequestMapping(value="hospitalizedTreatAdd")
	public ModelAndView hospitalizedTreatAdd(HttpServletRequest request,
		@RequestParam(value="tp",required=false)MultipartFile file,
		@RequestParam(value="h_type",required=false) String h_type,
		@RequestParam(value="uuid",required=false) String uuid,
		@RequestParam(value="h_in_date",required=false) String h_in_date,
		@RequestParam(value="h_out_date",required=false) String h_out_date,
		@RequestParam(value="hospital_id",required=false) String hospital_id,
		@RequestParam(value="doctor_id",required=false) String doctor_id,
		@RequestParam(value="out_state",required=false) String out_state,
		@RequestParam(value="in_state",required=false) String in_state,
		@RequestParam(value="effect",required=false) String effect,
		@RequestParam(value="d_advice",required=false) String d_advice
		){
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
		}else{
			System.out.println("上传失败");
		}
		
		pd.put("h_id", this.get32UUID());
		pd.put("h_type",h_type);
		pd.put("out_diagnose",out_state);
		pd.put("h_in_date",h_in_date);
		pd.put("h_out_date",h_out_date);
		pd.put("hospital_id",hospital_id);
		pd.put("doctor_id",doctor_id);
		pd.put("out_state",out_state);
		pd.put("in_state",in_state);
		pd.put("effect",effect);
		pd.put("d_advice",d_advice);
		pd.put("attachment",ffile + "/" + fileName);
		pd.put("user_id",uuid);

		try {
			hospitalizedServiceImpl.hospitalizedAdd(pd);
			hospitalizedTreatServiceImpl.hospitalizedTreatAdd(pd);
			mv.addObject("mss","hospitalizedTreatAdd");
			mv.addObject("uuid",uuid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("saveResult");
		return mv;
	}
	/**
	 *	修改住院记录--住院治疗
	 */
	@RequestMapping(value="hospitalizedTreatUpd")
	public ModelAndView hospitalizedTreatUpd(HttpServletRequest request,
			@RequestParam(value="tp",required=false)MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="h_type",required=false) String h_type,
			@RequestParam(value="uuid",required=false) String uuid,
			@RequestParam(value="h_in_date",required=false) String h_in_date,
			@RequestParam(value="h_out_date",required=false) String h_out_date,
			@RequestParam(value="hospital_id",required=false) String hospital_id,
			@RequestParam(value="doctor_id",required=false) String doctor_id,
			@RequestParam(value="out_state",required=false) String out_state,
			@RequestParam(value="in_state",required=false) String in_state,
			@RequestParam(value="effect",required=false) String effect,
			@RequestParam(value="d_advice",required=false) String d_advice,
			@RequestParam(value="h_id",required=false) String h_id
			){
			
			ModelAndView mv=this.getModelAndView();
			PageData pd=new PageData();
			pd=this.getPageData();
			
			pd.put("h_id",h_id);
			pd.put("h_type",h_type);
			pd.put("out_diagnose",out_state);
			pd.put("h_in_date",h_in_date);
			pd.put("h_out_date",h_out_date);
			pd.put("hospital_id",hospital_id);
			pd.put("doctor_id",doctor_id);
			pd.put("out_state",out_state);
			pd.put("in_state",in_state);	
			pd.put("effect",effect);
			pd.put("d_advice",d_advice);
			pd.put("user_id",uuid);
			pd.put("attachment",uploadPicture(tpz,file));
			try {
				hospitalizedServiceImpl.hospitalizedUpd(pd);
				hospitalizedTreatServiceImpl.hospitalizedTreatUpd(pd);
				mv.addObject("mss","hospitalizedTreatUpd");
				mv.addObject("uuid",uuid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.setViewName("saveResult");
			return mv;
		}
	
	/**
	 * 删除住院治疗图片
	 * @throws Exception 
	 */
	@RequestMapping(value="/attachmentDel")
	public void attachmentDel(PrintWriter out) throws Exception{
		try {
			PageData pd=new PageData();
			pd=this.getPageData();
			String PATH = pd.getString("PATH");													 		//图片路径
/*			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
*/			if(PATH!=null){
				hospitalizedTreatServiceImpl.attachmentDel(pd);			//删除数据中图片数据
			}
			out.write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.close();
	}
	
	
	
	
	
	
	
	///						///				/// 			///		/// 					//// 				///			//// 				///					///
	
	
	
	
	/**
	 * 去住院添加页面--住院分娩
	 * @throws Exception 
	 * 
	 */
	@RequestMapping(value="/getHdAdd")
	public ModelAndView getHdAdd() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
		mv.addObject("msg","hospitalizedDeliverAdd");
		mv.addObject("psList",psList);
		mv.addObject("pd",pd);
		mv.setViewName("doctor/sufferer/hospitalized_deliver");
		return mv;
	}
	
	/**
	 * 去住院修改页面--住院分娩
	 * @throws Exception 
	 * 
	 */
	@RequestMapping(value="/getHdUpd")
	public ModelAndView getHdUpd() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		 String uuid=pd.getString("uuid");
		 
		 try {
			 List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			 pd=hospitalizedServiceImpl.findHdId(pd);
			 pd.put("hospital_id",pd.getString("HOSPITAL_ID"));
			 List<PageData>dcList=hospitalizedServiceImpl.getHospitalId(pd);
			 mv.addObject("dcList",dcList);
			 mv.addObject("psList",psList);
			 mv.addObject("pd",pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		pd.put("uuid",uuid);
		mv.addObject("msg","hospitalizedDeliverUpd");
		mv.setViewName("doctor/sufferer/hospitalized_deliver");
		return mv;
	}
	
	
	/**
	 * 去住院修改页面--住院分娩
	 * @throws Exception 
	 * 
	 */
	@RequestMapping(value="/getHdUpds")
	public ModelAndView getHdUpds() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		 String uuid=pd.getString("uuid");
		 
		 try {
			 List<PageData>psList=hospitalServiceImpl.listAllHospital(null);
			 pd=hospitalizedServiceImpl.findHdId(pd);
			 pd.put("hospital_id",pd.getString("HOSPITAL_ID"));
			 List<PageData>dcList=hospitalizedServiceImpl.getHospitalId(pd);
			 mv.addObject("dcList",dcList);
			 mv.addObject("psList",psList);
			 mv.addObject("pd",pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		pd.put("uuid",uuid);
		mv.addObject("msg","hospitalizedDeliverUpd");
		mv.setViewName("doctor/sufferer/hospitalized_Dinfo");
		return mv;
	}
	
	/**
	 * 添加住院信息--住院分娩
	 * @throws ParseException 
	 */
	@RequestMapping(value="/hospitalizedDeliverAdd")
	public ModelAndView hospitalizedDeliverAdd(HttpServletRequest request,
			@RequestParam(value="tp",required=false)MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="uuid",required=false) String uuid,
			@RequestParam(value="h_type",required=false) String h_type,
			@RequestParam(value="h_in_date",required=false) String h_in_date,
			@RequestParam(value="h_out_date",required=false) String h_out_date,
			@RequestParam(value="d_datetime",required=false) String d_datetime,
			@RequestParam(value="d_week",required=false) String d_week,
			@RequestParam(value="d_alltime",required=false) String d_alltime,
			@RequestParam(value="h_id",required=false) String h_id,
			@RequestParam(value="d_styles",required=false) String d_styles,
			@RequestParam(value="m_complication",required=false) String m_complication,
			@RequestParam(value="b_weight",required=false) String b_weight,
			@RequestParam(value="b_height",required=false) String b_height,
			@RequestParam(value="b_complication",required=false) String b_complication,
			@RequestParam(value="hospital_id",required=false) String hospital_id,
			@RequestParam(value="b_sex",required=false) String b_sex,
			@RequestParam(value="b_number",required=false) String b_number,
			@RequestParam(value="doctor_id",required=false) String doctor_id
			) throws ParseException{
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		pd.put("h_id", this.get32UUID());
		pd.put("user_id",uuid);
		pd.put("h_type",h_type);
		pd.put("h_in_date",h_in_date);
		pd.put("h_out_date",h_out_date);
		pd.put("d_datetime",d_datetime);
		pd.put("d_week",d_week);
		pd.put("d_alltime",d_alltime);
		pd.put("d_styles",d_styles);
		pd.put("m_complication",m_complication);
		pd.put("b_complication",b_complication);
		pd.put("b_weight",b_weight);
		pd.put("b_height",b_height);
		pd.put("b_sex",b_sex);
		pd.put("hospital_id",hospital_id);
		pd.put("doctor_id",doctor_id);
		pd.put("b_number",b_number);
		pd.put("attachment",uploadPicture(tpz, file));
		
		
		PageData upd=new PageData();
		PageData mpd=new PageData();
		
		GregorianCalendar gc=new GregorianCalendar();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=sdf.parse(d_datetime);
		gc.setTime(date);
		gc.add(Calendar.DAY_OF_YEAR,42);
		upd.put("uuid",uuid);
		
		try {
			hospitalizedServiceImpl.hospitalizedAdd(pd);
			hospitalizedDeliverService.hospitalizedDeliverAdd(pd);
			mv.addObject("mss","hdAdd");
			mv.addObject("uuid",uuid);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		
		try {
			upd=userInfoServiceImpl.findUserInfoId(upd);
			mpd.put("f_id",this.get32UUID());
			mpd.put("user_id",uuid);
			mpd.put("f_type","d_42");
			mpd.put("f_date",sdf.format(gc.getTime()));
			
			mpd.put("doctor_id",upd.get("doctor_id"));
			mpd.put("hospital_id",upd.get("hospital_id"));
			mpd.put("doctor_name",upd.get("doctor_name"));
			mpd.put("hospital_name",upd.get("hospitalname"));
			
			mpd.put("f_style","上门");
			mpd.put("have_finished",0);
			medFollowServiceImpl.medFollowAdd(mpd);
			
			medFollowdService.medFollowDAdd(mpd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		
		mv.addObject("pd",pd);
		mv.setViewName("saveResult");
		return mv;
	}
	
	/**
	 * 修改住院信息--住院分娩
	 */
	@RequestMapping(value="/hospitalizedDeliverUpd")
	public ModelAndView hospitalizedDeliverUpd(HttpServletRequest request,
			@RequestParam(value="tp",required=false)MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="uuid",required=false) String uuid,
			@RequestParam(value="h_type",required=false) String h_type,
			@RequestParam(value="h_in_date",required=false) String h_in_date,
			@RequestParam(value="h_out_date",required=false) String h_out_date,
			@RequestParam(value="d_datetime",required=false) String d_datetime,
			@RequestParam(value="d_week",required=false) String d_week,
			@RequestParam(value="d_alltime",required=false) String d_alltime,
			@RequestParam(value="h_id",required=false) String h_id,
			@RequestParam(value="d_styles",required=false) String d_styles,
			@RequestParam(value="m_complication",required=false) String m_complication,
			@RequestParam(value="b_weight",required=false) String b_weight,
			@RequestParam(value="b_height",required=false) String b_height,
			@RequestParam(value="b_complication",required=false) String b_complication,
			@RequestParam(value="hospital_id",required=false) String hospital_id,
			@RequestParam(value="doctor_id",required=false) String doctor_id,
			@RequestParam(value="b_sex",required=false) String b_sex,
			@RequestParam(value="b_number",required=false) String b_number
			){
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		pd.put("h_id",h_id);
		pd.put("user_id",uuid);
		pd.put("h_type",h_type);
		pd.put("h_in_date",h_in_date);
		pd.put("h_out_date",h_out_date);
		pd.put("d_datetime",d_datetime);
		pd.put("d_week",d_week);
		pd.put("d_alltime",d_alltime);
		pd.put("d_styles",d_styles);
		pd.put("m_complication",m_complication);
		pd.put("b_complication",b_complication);
		pd.put("b_weight",b_weight);
		pd.put("b_height",b_height);
		pd.put("b_sex",b_sex);
		pd.put("hospital_id",hospital_id);
		pd.put("doctor_id",doctor_id);
		pd.put("b_number",b_number);
		pd.put("attachment",uploadPicture(tpz, file));
		
		try {
			hospitalizedServiceImpl.hospitalizedUpd(pd);
			hospitalizedDeliverService.hospitalizedDeliverUpd(pd);
			mv.addObject("mss","hdUpd");
			mv.addObject("uuid",uuid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("pd",pd);
		mv.setViewName("saveResult");
		return mv;
	}
	
	/**
	 * 删除住院分娩图片
	 * @throws Exception 
	 */
	@RequestMapping(value="/attachmentDels")
	public void attachmentDels(PrintWriter out) throws Exception{
		try {
			PageData pd=new PageData();
			pd=this.getPageData();
			String PATH = pd.getString("PATH");													 		//图片路径
/*			DelAllFile.delFolder(PathUtil.getClasspath()+ Const.FILEPATHIMG + pd.getString("PATH")); 	//删除图片
*/			if(PATH!=null){
				hospitalizedDeliverService.attachmentDel(pd);			//删除数据中图片数据
			}
			out.write("success");
		} catch (Exception e) {
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
