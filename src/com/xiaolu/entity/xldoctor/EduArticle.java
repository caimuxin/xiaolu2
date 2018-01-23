/**
 * 
 */
package com.xiaolu.entity.xldoctor;

/**
 * 宣教文章
 * @author Xie Leipin
 *
 */
public class EduArticle {
	private String contentId;
	private String eduId;
	private String contitle;
	private String conUserId;
	private String conDt;
	private String conFullInfo;
	private String conAtach;
	private String conComment;
	private String conBrowse;
	
	public String getContentId() {
		return contentId;
	}
	
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	
	public String getEduId() {
		return eduId;
	}
	
	public void setEduId(String eduId) {
		this.eduId = eduId;
	}
	
	public String getContitle() {
		return contitle;
	}
	
	public void setContitle(String contitle) {
		this.contitle = contitle;
	}
	
	public String getConUserId() {
		return conUserId;
	}
	
	public void setConUserId(String conUserId) {
		this.conUserId = conUserId;
	}
	
	public String getConDt() {
		return conDt;
	}
	
	public void setConDt(String conDt) {
		this.conDt = conDt;
	}
	
	public String getConFullInfo() {
		return conFullInfo;
	}
	
	public void setConFullInfo(String conFullInfo) {
		this.conFullInfo = conFullInfo;
	}
	
	public String getConAtach() {
		return conAtach;
	}
	
	public void setConAtach(String conAtach) {
		this.conAtach = conAtach;
	}
	
	public String getConComment() {
		return conComment;
	}
	
	public void setConComment(String conComment) {
		this.conComment = conComment;
	}
	
	public String getConBrowse() {
		return conBrowse;
	}
	
	public void setConBrowse(String conBrowse) {
		this.conBrowse = conBrowse;
	}

	@Override
	public String toString() {
		return "EduArticle [contentId=" + contentId + ", eduId=" + eduId + ", contitle=" + contitle + ", conUserId="
				+ conUserId + ", conDt=" + conDt + ", conFullInfo=" + conFullInfo + ", conAtach=" + conAtach
				+ ", conComment=" + conComment + ", conBrowse=" + conBrowse + "]";
	}
	
}
