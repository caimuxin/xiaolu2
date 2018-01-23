/**
 * 
 */
package com.xiaolu.controller.app.appuser;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.service.xldoctor.app.UserAppService;
import com.xiaolu.serviceimpl.xldoctor.app.EduAppServiceImpl;
import com.xiaolu.util.Const;
import com.xiaolu.util.DateUtil;
import com.xiaolu.util.PageData;
import com.xiaolu.util.PathUtil;

/**
 * 宣教
 * @author Xie Leipin
 *
 */
@Controller
@RequestMapping(value="/appedu")
public class EduAppController extends BaseController {

	@Resource(name = "eduAppServiceImpl")
	private EduAppServiceImpl eduAppServiceImpl;
	
	@Resource(name = "userAppServiceImpl")
	private UserAppService userAppServiceImpl;
	
	@RequestMapping(value="/getArticles")
	@ResponseBody
	public Object getEduArticleByCateogry(String id, int pageNum, int pageSize, String lastTime){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> dataList = null;
		try{
			pd.put("eduId", id);
			if (lastTime != null && !"".equals(lastTime)) {
				pd.put("lastTime", lastTime);
			}
			if (pageSize > 0) {
				int queryBegin = pageNum * pageSize;
				pd.put("begin", queryBegin);
				pd.put("offset", pageSize);
			}
			dataList = eduAppServiceImpl.findEduArticleByCategory(pd);
			map.put("articleList", dataList);
			map.put("systemTime", System.currentTimeMillis());
			map.put("status", 1);
		}catch(Exception e){
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		return map;
	}
	
	@RequestMapping(value="/getArticleDetail")
	@ResponseBody
	public ModelAndView getEduArticleById(String id){
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd.put("contentId", id);
		try {
			eduAppServiceImpl.updateEduArticleBrowseByConId(pd);
		} catch(Exception e) {
			logger.error(e.toString(),e);
		}
		try{
			PageData pdResult = eduAppServiceImpl.findEduArticleByConId(pd);
			map.put("article", pdResult);
			map.put("status", 1);
			ModelAndView mv = this.getModelAndView();
			if (pdResult == null) {
				pdResult = new PageData();
				pdResult.put("conFullInfo", "文章已被删除!");
			} 
			mv.setViewName("doctor/app/app_article");
			mv.addObject("msg", "ArticleDetail");
			mv.addObject("pd", pdResult);
			return mv;
		} catch(Exception e) {
			logger.error(e.toString(),e);
			map.put("status", 0);
			map.put("msg", "Bnum_error02");
		}
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("doctor/app/app_article");
		return mv;
	}
	
	/*
	 * 
		mv.setViewName("doctor/hospital/hospital_detail");
		mv.addObject("msg", "hospitalDetail");
		mv.addObject("pd", pd);
	 */
	
	/**
	 *	课堂/宣教文章详情分享功能 weixin 
	 */
	@RequestMapping(value="getContentById")
	@ResponseBody
	public Object getContentById(String id){
		PageData pd=new PageData();
		Map<String,Object> map=new HashMap <String, Object>();
		List<PageData> cList=null;
		try {
			pd.put("id",id);
			pd.put("contentId",id);
			cList=eduAppServiceImpl.findContentById(pd);
			map.put("status",1);
			map.put("contentInfo",cList);
		} catch (Exception e) {
			map.put("status",0);
			logger.error(e.toString(),e);
		}
		
		try {
			eduAppServiceImpl.updateEduArticleBrowseByConId(pd);
			map.put("status",1);
		} catch(Exception e) {
			map.put("status",0);
			logger.error(e.toString(),e);
		}
		return map;
	}
	
	
	
	/**
    * 根据文件id下载文件
    * 
    * @param mediaId
    *            媒体id
    * @throws Exception
    */
   public  InputStream getInputStream(String media_id,String access_token,String uid) {
      /* GetExistAccessToken getExistAccessToken = GetExistAccessToken.getInstance();
       String accessToken = getExistAccessToken.getExistAccessToken();*/
	   
	   
       InputStream is = null;
       String url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=" + access_token + "&media_id=" + media_id;
       try {
           URL urlGet = new URL(url);
           HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
           http.setRequestMethod("GET"); // 必须是get方式请求
           http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
           http.setDoOutput(true);
           http.setDoInput(true);
           System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
           System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
           http.connect();
           // 获取文件转化为byte流
           is = http.getInputStream();
       } catch (Exception e) {
          e.printStackTrace();
       }
       return is;
   }
   
	   
	   
	   
   /**
    * 获取下载图片信息（jpg）
    * 
    * @param mediaId
    *            文件的id
    * @throws Exception
    */
   @RequestMapping(value="saveImageToDisk")
   @ResponseBody
   public  Object saveImageToDisk(String media_id,String access_token,String uid) throws Exception {
	   Map<String,Object> map=new HashMap <String, Object>();
	   PageData pd=new PageData();
       InputStream inputStream = getInputStream(media_id, access_token,uid);
       byte[] data = new byte[1024];
       int len = 0;
       FileOutputStream fileOutputStream = null;
       try {
    	   String  ffile = DateUtil.getDays();
    	   
    	   String picName=ffile+"/"+this.get32UUID()+".jpg";
    	   String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG+picName;		//文件上传路径
    	   System.out.println(filePath);
    	   //fileOutputStream = new FileOutputStream("test1.jpg");
    	   pd.put("uuid",uid);
    	   pd.put("u_photo",picName);
    	   fileOutputStream = new FileOutputStream(filePath);
           while ((len = inputStream.read(data)) != -1) {
               fileOutputStream.write(data, 0, len);
               
           }
          
           if(!uid.equals("")){
        	   eduAppServiceImpl.updWeiXinPhonto(pd);
           }
           map.put("status", 1);
           map.put("u_photo",picName);
       } catch (IOException e) {
    	   map.put("status", 0);
           e.printStackTrace();
       } finally {
           if (inputStream != null) {
               try {
                   inputStream.close();
               } catch (IOException e) {
                   e.printStackTrace();
               }
           }

           if (fileOutputStream != null) {
               try {
                   fileOutputStream.close(); 
               } catch (IOException e) {
                   e.printStackTrace();
               }
           }
       }
	return map;
   }
   
   
   
   /**
    * 根据文件id下载文件
    * 
    * @param mediaId
    *            媒体id
    * @throws Exception
    */
   public  InputStream getInputStreams(String uid,String photoUrl) {
      /* GetExistAccessToken getExistAccessToken = GetExistAccessToken.getInstance();
       String accessToken = getExistAccessToken.getExistAccessToken();*/
	   
	   
       InputStream is = null;
       String url =photoUrl;
       try {
           URL urlGet = new URL(url);
           HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
           http.setRequestMethod("GET"); // 必须是get方式请求
           http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
           http.setDoOutput(true);
           http.setDoInput(true);
           System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
           System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
           http.connect();
           // 获取文件转化为byte流
           is = http.getInputStream();
       } catch (Exception e) {
          e.printStackTrace();
       }
       return is;
   }
   
	   
	   
	   
   /**
    * 获取下载图片信息（jpg）
    * 
    * @param mediaId
    *            文件的id
    * @throws Exception
    */
   @RequestMapping(value="saveImageToDisks")
   @ResponseBody
   public  Object saveImageToDisks(String uid,String userNamezs, String photoUrl) throws Exception {
	   Map<String,Object> map=new HashMap <String, Object>();
	   PageData pd=new PageData();
       InputStream inputStream = getInputStreams(uid,photoUrl);
       byte[] data = new byte[1024];
       int len = 0;
       FileOutputStream fileOutputStream = null;
       try {
    	   String  ffile = DateUtil.getDays();
    	   
    	   String picName=ffile+"/"+this.get32UUID()+".jpg";
    	  
    	   String filePath1 = PathUtil.getClasspath() + Const.FILEPATHIMG+ffile;		//文件上传路径
    	   String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG+picName;		//文件上传路径
    	   System.out.println(filePath);
    	   //fileOutputStream = new FileOutputStream("test1.jpg");
    	   createDir(filePath1);							//调用判断文件夹是否存在方法
    	   fileOutputStream = new FileOutputStream(filePath);
           while ((len = inputStream.read(data)) != -1) {
               fileOutputStream.write(data, 0, len);
               
           }
          
           pd.put("uuid",uid);
    	   pd.put("u_photo",picName);
    	   pd.put("user_namezs",userNamezs);
           if(!uid.equals("")){
        	   userAppServiceImpl.updateUserPhoto(pd);
           }
           map.put("status", 1);
           map.put("u_photo",picName);
       } catch (IOException e) {
    	   map.put("status", 0);
           e.printStackTrace();
       } finally {
           if (inputStream != null) {
               try {
                   inputStream.close();
               } catch (IOException e) {
                   e.printStackTrace();
               }
           }

           if (fileOutputStream != null) {
               try {
                   fileOutputStream.close(); 
               } catch (IOException e) {
                   e.printStackTrace();
               }
           }
       }
	return map;
   }
   
   /**
    * 判断文件夹是否存在，不存在则创建爱文件夹
    * @param destDirName
    * @return
    */
   public static boolean createDir(String destDirName) {  
       File dir = new File(destDirName);  
       if (dir.exists()) {  
           System.out.println("创建目录" + destDirName + "失败，目标目录已经存在");  
           return false;  
       }  
       if (!destDirName.endsWith(File.separator)) {  
           destDirName = destDirName + File.separator;  
       }  
       //创建目录  
       if (dir.mkdirs()) {  
           System.out.println("创建目录" + destDirName + "成功！");  
           return true;  
       } else {  
           System.out.println("创建目录" + destDirName + "失败！");  
           return false;  
       }  
   }  
   
}
