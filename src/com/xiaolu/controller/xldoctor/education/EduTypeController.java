package com.xiaolu.controller.xldoctor.education;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.serviceimpl.xldoctor.education.EduTypeServiceImpl;
import com.xiaolu.util.AppUtil;
import com.xiaolu.util.Const;
import com.xiaolu.util.PageData;

@Controller
@RequestMapping(value="/eduTypeController")
public class EduTypeController extends BaseController{

	@Resource(name="eduTypeServiceImpl")
	private EduTypeServiceImpl et;
	
	/**
	 * 查询所有宣教类别
	 */
	@RequestMapping(value="/findEduType")
	public ModelAndView findEduType(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		try {
			pd = this.getPageData();
			page.setPd(pd);

			List<PageData> eduTypeList = et.listPdPageEduType(page);
			mv.addObject("eduTypeList",eduTypeList);
			mv.addObject("pd", pd);
			mv.setViewName("doctor/education/eduType_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 根据id查询类别信息
	 *
	 */
	public ModelAndView getEduTypeId() throws Exception{
		
		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		try {
			
			pd=et.getEduTypeId(pd);
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		
		mv.addObject("pd",pd);
		mv.setViewName("doctor/education/eduType_list");
		return mv;
	}
	

	/**
	 * 修改宣教类别
	 */
	@RequestMapping(value="/updEdutype")
	public ModelAndView updEdutype()throws Exception{

		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		try {
			et.updEduType(pd);
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	
	/**
	 * 添加宣教类别
	 */
	@RequestMapping(value="/addEdutype")
	public ModelAndView addEdutype()throws Exception{

		ModelAndView mv=this.getModelAndView();
		PageData pd=new PageData();
		PageData pds=new PageData();
		try {
			
			pd=this.getPageData();
			
			pds.put("eduId",pd.getString("edu_pid"));
			pds=et.getEduTypeId(pds);
			String grade=pds.getString("EDU_GRADE");
			if(grade!=null && grade.equals("一类")){
				pd.put("edu_grade","二类");
			}else if(grade!=null && grade.equals("二类")){
				pd.put("edu_grade","三类");
			}
			
			
			pd.put("eid",this.get32UUID());
			
			pd.put("edu_state",1);
			et.addEduType(pd);
			mv.addObject("msginfo","save");
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
	/**
	 * 去新增宣教类别页面
	 */
	@RequestMapping(value="/goEduTypeAdd")
	public ModelAndView goAddEdu(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		
		List<PageData> eduTypeList = et.getEduTypeGrade(pd);
		
		mv.addObject("msg","addEdutype");
		mv.addObject("pd",pd);
		mv.addObject("eduTypeList",eduTypeList);
		mv.setViewName("doctor/education/eduType_add");
		return mv;
	}
	
	
	/**
	 * 去修改宣教类别页面
	 */
	@RequestMapping(value="/goEduTypeUpd")
	public ModelAndView goUpd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		PageData pd = new PageData();
		PageData pds = new PageData();
		pd = this.getPageData();
		pds=this.getPageData();
		
		pd=et.getEduTypeId(pd);
		
		List<PageData> typeList=et.getEduTypeGrade(pds);
		
		mv.addObject("msg", "updEdutype");
		mv.addObject("pd", pd);
		mv.addObject("typeList",typeList);
		mv.setViewName("doctor/education/eduType_add");
		return mv;
	}
	
	
	/**
	 * 删除宣教类别
	 */
	@RequestMapping(value="/delEduType")
	public void delType(PrintWriter out){
		PageData pd=new PageData();
		
		try {
			pd=this.getPageData();
			et.updEduState(pd);
			out.write("success");
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断用户名是否存在 
	 */
	@RequestMapping(value="getEduTypeName")
	@ResponseBody
	public Object getEduTypeName(){
		Map<String,String> map=new HashMap<String, String>();
		String errInfo = "success";
		PageData pd=new PageData();
		try {
			pd=this.getPageData();
			if(et.getEduTypeName(pd)!=null){
				errInfo="error";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
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