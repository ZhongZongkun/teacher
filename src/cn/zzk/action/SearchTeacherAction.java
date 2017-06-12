package cn.zzk.action;

import java.util.List;

import cn.zzk.util.DBConnect;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class SearchTeacherAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String result;
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private int departid;
	private int jobid;
	private int professionid;

	public int getDepartid() {
		return departid;
	}

	public void setDepartid(int departid) {
		this.departid = departid;
	}

	public int getJobid() {
		return jobid;
	}

	public void setJobid(int jobid) {
		this.jobid = jobid;
	}

	public int getProfessionid() {
		return professionid;
	}

	public void setProfessionid(int professionid) {
		this.professionid = professionid;
	}

	@Override
	public String execute() throws Exception {
		String d;
		String j;
		String p;
		if(departid == 0){
			d="%";
		}else{
			d=String.valueOf(departid);
		}
		if(jobid == 0){
			j="%";
		}else{
			j=String.valueOf(jobid);
		}
		if(professionid == 0){
			p="%";
		}else{
			p=String.valueOf(professionid);
		}
		List<Object> list = DBConnect.getSInfoById(d, j,
				p);
		System.out.println(departid + ":" + jobid + ":" + professionid);
		this.result = new Gson().toJson(list);
		return SUCCESS;
	}

}
