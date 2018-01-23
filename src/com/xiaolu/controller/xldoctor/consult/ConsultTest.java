package com.xiaolu.controller.xldoctor.consult;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.entity.Page;
import com.xiaolu.entity.system.User;
import com.xiaolu.util.Const;
import com.xiaolu.util.PageData;


@Controller
@RequestMapping(value="/consulttest")
public class ConsultTest extends BaseController{
	
	@RequestMapping(value="/testone")
	public ModelAndView listDoctorInfo(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String userId = user.getUSER_ID();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try{
			
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		pd.put("userId", userId);
		mv.addObject("pd",pd);
		
		mv.setViewName("doctor/consult/index");
		
		return mv;
	}
	
	@RequestMapping(value="/baidutest")
	public ModelAndView listBaidutest(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String userId = user.getUSER_ID();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		try{
			
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
		pd.put("userId", userId);
		mv.addObject("pd",pd);
		
		mv.setViewName("doctor/consult/baidutest");
		
		return mv;
	}
}
