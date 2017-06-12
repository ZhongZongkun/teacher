package cn.zzk.action;

import java.util.Date;

import cn.zzk.util.DBConnect;

import com.opensymphony.xwork2.ActionSupport;

public class ChangeRPAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String tid;
	private Long uid;
	private double money;
	private int reward;
	private String content;
	private Date time;
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public int getReward() {
		return reward;
	}
	public void setReward(int reward) {
		this.reward = reward;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

	private String errorMsg;
	
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}

	public String add_RP() throws Exception{
		content = new String(content.getBytes("iso-8859-1"),"utf-8");
		if(DBConnect.add_RP(uid, content, time, money, reward)){//
			//System.out.println( );
			setErrorMsg("修改成功");
		}else{
			setErrorMsg("修改失败");
		}
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

}
