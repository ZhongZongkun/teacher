package cn.zzk.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.junit.Test;

import cn.zzk.bean.Depart;
import cn.zzk.bean.Job;
import cn.zzk.bean.Profession;
import cn.zzk.util.DBConnect;

import com.opensymphony.xwork2.ActionSupport;

public class NewsAction extends ActionSupport implements RequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = -685644331402871496L;
	private String errorMsg;
	private String title;
	private String content;
	private String author;
	
	private Map<String, Object> requestMap ;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
	@Test
	public String showRP() throws Exception{
		//List<Object> list = DBConnect.getTeacherInfo(1, 1, Teacher.class);
		List<Object> list = DBConnect.getSInfo();
		List<Object> prolist= DBConnect.getJPD(Profession.class);
		List<Object> joblist = DBConnect.getJPD(Job.class);
		List<Object> deplist = DBConnect.getJPD(Depart.class);
		//System.out.println(list.size());
		requestMap.put("tlist", list);
		requestMap.put("pro", prolist);
		requestMap.put("job", joblist);
		requestMap.put("dep", deplist);
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		String outtime = format.format(date);
		if(DBConnect.insertNews(title, content, outtime, author)){
			setErrorMsg("添加成功");
		}else{
			setErrorMsg("添加失败");
		}
		
		return super.execute();
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
			requestMap = arg0;
	}
}
