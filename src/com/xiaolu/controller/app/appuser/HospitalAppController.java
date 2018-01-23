package com.xiaolu.controller.app.appuser;

import java.io.UnsupportedEncodingException;
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

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.service.xldoctor.app.HospitalAppService;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.FileUpload;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;

@Controller
@RequestMapping(value="/appHospital")
public class HospitalAppController extends BaseController{

	@Resource(name = "hospitalAppServiceImpl")
	private HospitalAppService hospitalAppServiceImpl;
	
	/**
	 * 更加医院Id查找医院信息
	 */
	@RequestMapping(value="/getHospitalInfo")
	@ResponseBody
	public Object getHospitalInfo(String hospitalId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("hospitalId", hospitalId);
			PageData result = hospitalAppServiceImpl.findHospitalInfoById(pd);
			map.put("status", 1);
			map.put("hospitalInfo", result);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}finally{
			logAfter(logger);
		}
		return map;
	}
	
	/**
	 * 更加医院Id查找医院信息
	 */
	@RequestMapping(value="/getHospitalList")
	@ResponseBody
	public Object getHospitalNameList(String name,String code, String appId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("hospitalCity", name);
			pd.put("hospitalCode", code);
			List<PageData> result = hospitalAppServiceImpl.findHospitalList(pd);
			if(result==null || result.size()==0){
				pd.clear();
				result = hospitalAppServiceImpl.findHospitalList(pd);
			}
			pd.put("appId", appId);
			List<PageData> defaultHospital = hospitalAppServiceImpl.findHospitalDefaulth(pd);
			if(defaultHospital !=null && defaultHospital.size() != 0){
				pd.clear();
				map.put("defaultId", defaultHospital.get(0).get("hospitalId"));
				map.put("hospitalName", defaultHospital.get(0).get("hospitalName"));
				map.put("antenatalUrl", defaultHospital.get(0).get("antenatalUrl"));
			}
			map.put("status", 1);
			map.put("hospitalInfo", result);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}finally{
			logAfter(logger);
		}
		return map;
	}
	
	/**
	 *	医生列表接口
	 */
	@RequestMapping(value="/getDoctorList")
	@ResponseBody
	public Object getDoctorNameList(String hospitalId,String officeId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("hospitalId", hospitalId);
			pd.put("officeId", officeId);
			List<PageData> result = hospitalAppServiceImpl.findDoctorList(pd);
			map.put("status", 1);
			map.put("doctorInfo", result);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}finally{
			logAfter(logger);
		}
		return map;
	}
	
	/**
	 * 医生详情接口
	 */
	@RequestMapping(value="/getDoctorDetail")
	@ResponseBody
	public Object getDoctorDetail(String doctorId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("doctorId", doctorId);
			PageData result = hospitalAppServiceImpl.findDoctorDetail(pd);
			map.put("status", 1);
			map.put("doctorInfo", result);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}finally{
			logAfter(logger);
		}
		return map;
	}
	
	/**
	 * 我的医生接口
	 */
	@RequestMapping(value="/getMyDoctorInfo")
	@ResponseBody
	public Object getMyDoctorInfo(String userId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("userId", userId);
			List<PageData> result = hospitalAppServiceImpl.findMyDoctorInfo(pd);
			map.put("status", 1);
			map.put("doctorInfo", result);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}finally{
			logAfter(logger);
		}
		return map;
	}
	

	/**
	 * 我的医生关注
	 */
	@RequestMapping(value="/saveCollection")
	@ResponseBody
	public Object saveCollection(String userId,String doctorId,String cType){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try{
			pd.put("userId", userId);
			pd.put("doctorId", doctorId);
			pd.put("cType", cType);
			hospitalAppServiceImpl.saveCollection(pd);
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
		}finally{
			logAfter(logger);
		}
		return map;
	}
	
	/**
	 * 图片接口测试
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/saveImgs")
	@ResponseBody
	public Object saveImgs(HttpServletRequest request,@RequestParam(value = "file") MultipartFile[] files,String userId){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		for(MultipartFile mf:files){
			String path = uploadPicture("",mf);
		}

		return map;
	}
	
	public String uploadPicture(String tpz,MultipartFile file){
		String path = "";
		if(null == tpz){tpz = "";}
		String  ffile = DateUtil.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
			path = ffile + "/" + fileName;				//路径
			
			//Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMGPHOTO + ffile + "/" + fileName);//加水印
		}else{
			path = tpz;
		}
		
		return path;
	}
}
