package com.xiaolu.controller.xldoctor.sufferer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.service.xldoctor.hospital.HospitalService;
import com.xiaolu.serviceimpl.xldoctor.sufferer.UoutpatientServiceImpl;
import com.xiaolu.util.AppUtil;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;
import com.xiaolu.util.Watermark;

@Controller
@RequestMapping("/uoutpatientController")
public class UoutpatientController extends BaseController{
	
	@Resource(name="UoutpatientServiceImpl")
	private UoutpatientServiceImpl uoutpatientServiceImpl;
	@Resource(name= "hospitalServiceImpl")
	private HospitalService hospitalServiceImpl;
	
	
	/**
	 * 查询所有门诊信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findUoutpatient")
	public ModelAndView findUoutpatient() throws Exception{
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		List<PageData> uoList=uoutpatientServiceImpl.findUoutpatient(pd);
		List<PageData> hoList=hospitalServiceImpl.listAllHospital(null);				//获取医院列表
		mv.addObject("uoList",uoList);
		mv.addObject("hoList",hoList);
		mv.addObject("pd",pd);
		mv.setViewName("doctor/sufferer/outpatient_list2");
		return mv;
	}
	
	/**
	 *根据科室id查询医生信息
	 */
	@RequestMapping(value="/officeOptions")
	@ResponseBody
	public Object findOfficeOption(){
		PageData pd=new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		
		try {
			pd=this.getPageData();
			List<PageData> pdList = hospitalServiceImpl.getHospitalId(pd);
			
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 添加门诊记录信息
	 */
	@RequestMapping(value="/addOutpatient")
	public ModelAndView addOutpatient(HttpServletRequest request,
			@RequestParam(value="tp",required=false)MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="uuid",required=false) String uuid,
			@RequestParam(value="o_date",required=false) String o_date,
			@RequestParam(value="hospital_id",required=false) String hospital_id,
			@RequestParam(value="office_id",required=false) String office_id,
			@RequestParam(value="doctor_id",required=false) String doctor_id,
			@RequestParam(value="o_pregnancy",required=false) String o_pregnancy,
			@RequestParam(value="o_check",required=false) String o_check,
			@RequestParam(value="o_weight",required=false) String o_weight,
			@RequestParam(value="o_waist",required=false) String o_waist,
			@RequestParam(value="o_heart",required=false) String o_heart,
			@RequestParam(value="o_blood",required=false) String o_blood,
			@RequestParam(value="o_womb",required=false) String o_womb){

		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		
		try {
			
			pd.put("user_id", uuid);
			pd.put("o_date",o_date);
			pd.put("hospital_id",hospital_id);
			pd.put("office_id",office_id);
			pd.put("doctor_id",doctor_id);
			pd.put("o_pregnancy",o_pregnancy);
			pd.put("o_check",o_check);
			pd.put("o_weight",o_weight);
			pd.put("o_waist",o_waist);
			pd.put("o_heart",o_heart);
			pd.put("o_blood",o_blood);
			pd.put("o_womb",o_womb);
			pd.put("o_attachment",uploadPicture("",file));
			
			uoutpatientServiceImpl.uOutpatientAdd(pd);
			mv.addObject("out","add1");
			mv.addObject("uuid",uuid);
		}catch (Exception e) {
			mv.addObject("out","add0");
			logger.error(e.toString(), e);
		}finally {
			logAfter(logger);
		}
		mv.setViewName("saveResult");
		return mv;
	}

	
	/**
	 * 修改门诊信息
	 */
	@RequestMapping(value="/updOutpatient")
	@ResponseBody 
	public Object updOutpatient(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		String errInfo = "success";
		try {
			uoutpatientServiceImpl.uoutpatientaUpd(pd);
			map.put("su", 1);
		} catch (Exception e) {
			errInfo = "error";
			e.printStackTrace();
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
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
	 * 删除门诊信息
	 * @return
	 */
	@RequestMapping(value="/delOutpatient")
	public ModelAndView delOutpatient(){
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		try {
			uoutpatientServiceImpl.uoutpatientdel(pd);
			mv.addObject("out","add1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("uuid",pd.get("uuid"));
		mv.setViewName("saveResult");
		return mv;
	}
}
