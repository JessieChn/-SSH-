package cn.edu.zjut.po;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;

public class Log {
	private int logId;
	private Timestamp submitTime;
	private String description;
	public Log(){
		
	}
	public Log(String description){
		this.description = description;
		this.submitTime = new Timestamp(new Date().getTime());  
	}
	public int getLogId() {
		return logId;
	}
	public void setLogId(int logId) {
		this.logId = logId;
	}
	

	public Timestamp getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(Timestamp submitTime) {
		this.submitTime = submitTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	

}
