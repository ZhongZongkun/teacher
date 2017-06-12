package cn.zzk.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import cn.zzk.bean.Profession;
import cn.zzk.bean.Teacher;
import cn.zzk.bean.User;
import cn.zzk.util.DBConnect;
import cn.zzk.util.GetIp;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public void validate() {
		super.validate();
		if(getUsername() == null || getUsername().trim().length() == 0){
			addFieldError("username", "用户名不能为空");
		}
		if(getPassword()== null || getPassword().trim().length() == 0){
			addFieldError("password", "密码不能为空");
		}
	}
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String userIp = GetIp.getIpAddr(ServletActionContext.getRequest());
		
		if(DBConnect.isExist(getUsername())){
			List<Object> users = DBConnect.login(username, password);
			if(users != null){
				User user = (User) users.get(0);
				if(user.isLock()){
					addFieldError("username", "该用户已经被锁定,请联系管理员");
					return INPUT;
				}else{
					long id = user.getId();
					System.out.println(id);
					Teacher teacher = (Teacher) DBConnect.getTeacherInfo(1, id, Teacher.class).get(0);
					System.out.println(teacher.getId());
					Profession profession = (Profession) DBConnect.getTeacherInfo(5, teacher.getProfessionid(), Profession.class).get(0);
					teacher.setProfession(profession.getName());
					session.put("tid", teacher.getId());
					session.put("teacher", teacher);
					String time = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
					DBConnect.insertLogininfo(user.getId(), userIp, time);
					session.put("user", user);
					session.put("nickname", user.getNickname());
					session.put("flag", user.getFlag());
					session.put("ip", userIp);
					session.put("time", time);
					return SUCCESS;
				}
			}else{
				addFieldError("password", "帐号的密码错误");
				return INPUT;
			}
		}else{
			addFieldError("username", "用户名不存在");
			return INPUT;
		}
	}
	


}
