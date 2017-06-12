package cn.zzk.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import cn.zzk.bean.Depart;
import cn.zzk.bean.Education;
import cn.zzk.bean.Family;
import cn.zzk.bean.Income;
import cn.zzk.bean.Job;
import cn.zzk.bean.Profession;
import cn.zzk.bean.RP;
import cn.zzk.bean.Teacher;
import cn.zzk.bean.User;
import cn.zzk.util.DBConnect;
import cn.zzk.util.MyUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShowTeacherInfoAction extends ActionSupport implements RequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> requestMap ;
	private List<Object> myfamily;
	private List<Object> myeducation;
	private Teacher teacher;
	private int age;
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		requestMap = arg0;
	}
	
	public String showMoney() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		Teacher teacher = (Teacher) session.get("teacher");
		long tid = teacher.getId();
		long proid = teacher.getProfessionid();
		List<Object> income = DBConnect.getTeacherInfo(7, proid, Income.class);
		Income tincome = (Income) income.get(0); 
		Double basicMoney = tincome.getSloary();
		List<Object> rlist = DBConnect.getTwoId(1, 1, tid, RP.class);
		List<Object> plist = DBConnect.getTwoId(1, 0, tid, RP.class);
		double rmoney = MyUtils.getTotal(rlist);
		double pmoney = MyUtils.getTotal(plist);
		double totalMoney = basicMoney - pmoney + rmoney;
		
		requestMap.put("rlist", rlist);
		requestMap.put("plist", plist);
		requestMap.put("name", teacher.getName());
		requestMap.put("pro", teacher.getProfession());
		requestMap.put("basic", basicMoney);
		requestMap.put("rmoney", rmoney);
		requestMap.put("pmoney", pmoney);
		requestMap.put("total", totalMoney);
		return SUCCESS;
	}
	
	public String showLoginInfo() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		User user = (User) session.get("user");
		//System.out.println("logininfo:"+tid);
		ArrayList<Object> list = (ArrayList<Object>) DBConnect.getLoginInfo(user.getId()) ;
		requestMap.put("logininfo", list);
		//System.out.println(list.size());
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		User user = (User) session.get("user");
		long id = user.getId();
		if(DBConnect.getTeacherInfo(1, id, Teacher.class) != null){
			teacher = (Teacher) DBConnect.getTeacherInfo(1, id, Teacher.class).get(0);
			long tid = teacher.getId();
			myeducation =DBConnect.getTeacherInfo(2, tid, Education.class);
			myfamily = DBConnect.getTeacherInfo(3, tid, Family.class);
			Depart depart = (Depart) DBConnect.getTeacherInfo(6,teacher.getDapartid(), Depart.class).get(0);
			teacher.setDepart(depart.getName());
			Job job = (Job) DBConnect.getTeacherInfo(4, teacher.getJobid(), Job.class).get(0);
			teacher.setJob(job.getName());
			Profession profession = (Profession) DBConnect.getTeacherInfo(5, teacher.getProfessionid(), Profession.class).get(0);
			teacher.setProfession(profession.getName());
			requestMap.put("myeducation", myeducation);
			requestMap.put("myfamily", myfamily);
			requestMap.put("teacher", teacher);
			setAge(MyUtils.getAge(teacher.getBirthday()));
			return SUCCESS;
		}else {
			return LOGIN;
		}
		
	}


	
}
