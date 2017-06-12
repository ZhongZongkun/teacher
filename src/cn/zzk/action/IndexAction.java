package cn.zzk.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import cn.zzk.bean.News;
import cn.zzk.util.DBConnect;

import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport implements RequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String newId;
	private Map<String, Object> requestMap ;
	private static Map<String, Object> newsMap = new HashMap<String, Object>() ;
	private List<News> newsList ;
	private News news;
	
	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public void setRequest(Map<String, Object> request){
		this.requestMap = request;
	}
	
	public String getNewId() {
		return newId;
	}

	public void setNewId(String newId) {
		this.newId = newId;
	}

	public String show_news(){
		setNews((News) newsMap.get(newId));
		return "success";
	}
	
	@Override
	public String execute() throws Exception {
		newsList = DBConnect.getNews();
		for(int i = 0; i < newsList.size(); i++){
			News temp = newsList.get(i);
			newsMap.put(String.valueOf(temp.getId()), temp);
		}
		requestMap.put("news", newsList);
		return SUCCESS;
	}
	
}
