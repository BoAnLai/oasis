package com.ryan.subs.model;

import java.sql.Date;

public class SubsVO implements java.io.Serializable{
	
	private Integer subsId;
	private Integer subsUserId;
	private Integer subsGameId;
	private Integer subsArtId;
	private Date subsDate;
	private Boolean subsStatus;
	
	public SubsVO() {
		
	}
		
	public Integer getSubsId() {
		return subsId;
	}
	public void setSubsId(Integer subsId) {
		this.subsId = subsId;
	}
	public Integer getSubsUserId() {
		return subsUserId;
	}
	public void setSubsUserId(Integer subsUserId) {
		this.subsUserId = subsUserId;
	}
	public Integer getSubsGameId() {
		return subsGameId;
	}
	public void setSubsGameId(Integer subsGameId) {
		this.subsGameId = subsGameId;
	}
	public Integer getSubsArtId() {
		return subsArtId;
	}
	public void setSubsArtId(Integer subsArtId) {
		this.subsArtId = subsArtId;
	}
	public Date getSubsDate() {
		return subsDate;
	}
	public void setSubsDate(Date subsDate) {
		this.subsDate = subsDate;
	}
	
	public Boolean getSubsStatus() {
		return subsStatus;
	}

	public void setSubsStatus(Boolean subsStatus) {
		this.subsStatus = subsStatus;
	}
	@Override
	public String toString() {
		return "SubsVO [subsId=" + subsId + ", subsUserId=" + subsUserId + 
				", subsGameId=" + subsGameId + ", subsArtId=" + subsArtId + ", subsDate=" + subsDate + "]";
	}

	

}
