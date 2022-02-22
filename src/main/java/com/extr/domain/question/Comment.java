package com.extr.domain.question;

import java.io.Serializable;
import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

public class Comment implements Serializable  {
	
	private static final long serialVersionUID = 304471288989898758L;
	private int commentId;
	private int questionId;
	private int indexId;
	private int userId;
	private String username;
	private String contentMsg;
	private int quotoId;
	private int reId;
	private Date createTime;
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getIndexId() {
		return indexId;
	}
	public void setIndexId(int indexId) {
		this.indexId = indexId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContentMsg() {
		return contentMsg;
	}
	public void setContentMsg(String contentMsg) {
		this.contentMsg = contentMsg;
	}
	public int getQuotoId() {
		return quotoId;
	}
	public void setQuotoId(int quotoId) {
		this.quotoId = quotoId;
	}
	public int getReId() {
		return reId;
	}
	public void setReId(int reId) {
		this.reId = reId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
