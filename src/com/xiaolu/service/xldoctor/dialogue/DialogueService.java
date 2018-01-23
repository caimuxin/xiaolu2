package com.xiaolu.service.xldoctor.dialogue;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaolu.dao.DaoSupport;
import com.xiaolu.util.PageData;

@Service("dialogueService")
public class DialogueService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	public boolean insertDialogue(PageData pd) throws Exception {
		return (int) dao.save("DialogueMapper.insertDialogue", pd) == 1;
	}
	
	public boolean insertDialogueDetail(PageData pd) throws Exception {
		return (int) dao.save("DialogueMapper.insertDialogueDetail", pd) == 1;
	}
}
