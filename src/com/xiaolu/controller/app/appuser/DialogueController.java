package com.xiaolu.controller.app.appuser;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaolu.controller.base.BaseController;
import com.xiaolu.service.xldoctor.dialogue.DialogueService;
import com.xiaolu.util.PageData;

@Controller
@RequestMapping(value = "/appDialogue")
public class DialogueController extends BaseController {
	@Resource(name = "dialogueService")
	private DialogueService dialogueService;

	/**
	 * 插入对话主表记录
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertDialogue", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object insertDialogue() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = this.getPageData();
		try {
			if (dialogueService.insertDialogue(pd)) {
				map.put("id", pd.get("id"));
				map.put("status", 1);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("status", 0);
		}
		return map;
	}

	/**
	 * 插入对话详情记录
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertDialogueDetail", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object insertDialogueDetail() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = this.getPageData();
		try {
			if (dialogueService.insertDialogueDetail(pd)) {
				map.put("id", pd.get("id"));
				map.put("status", 1);
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
			map.put("status", 0);
		}
		return map;
	}
}
