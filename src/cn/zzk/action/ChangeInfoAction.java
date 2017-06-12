package cn.zzk.action;

import java.util.Date;
import java.util.Map;

import cn.zzk.bean.Teacher;
import cn.zzk.util.DBConnect;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ChangeInfoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private static Teacher teacher;
	private String name;
	private int sex;
	private Date birthday;
	private String status;
	private String education;
	private String phone;
	private String email;
	private String address;
	private String[] names;
	private String[] relation;
	private Date[] begin;
	private Date[] end;
	private String[] statuss;
	private String[] school;
	private String errorMsg;

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public static Teacher getTeacher() {
		return teacher;
	}

	public static void setTeacher(Teacher teacher) {
		ChangeInfoAction.teacher = teacher;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	

	public String[] getNames() {
		return names;
	}

	public void setNames(String[] names) {
		this.names = names;
	}

	public String[] getRelation() {
		return relation;
	}

	public void setRelation(String[] relation) {
		this.relation = relation;
	}

	public Date[] getBegin() {
		return begin;
	}

	public void setBegin(Date[] begin) {
		this.begin = begin;
	}

	public Date[] getEnd() {
		return end;
	}

	public void setEnd(Date[] end) {
		this.end = end;
	}

	public String[] getStatuss() {
		return statuss;
	}

	public void setStatuss(String[] statuss) {
		this.statuss = statuss;
	}

	public String[] getSchool() {
		return school;
	}

	public void setSchool(String[] school) {
		this.school = school;
	}

	static {
		Map<String, Object> session = ActionContext.getContext().getSession();
		teacher = (Teacher) session.get("teacher");
	}

	public String basic() throws Exception {
		long tid = teacher.getId();
		boolean flag = DBConnect.changeTInfo(tid, getName(), getSex(),
				getBirthday(), getStatus(), getEducation(), getPhone(),
				getEmail(), getAddress());
		System.out.println(getAddress());
		if(flag==true){
			setErrorMsg("修改成功");
		}else{
			setErrorMsg("修改失败");
		}
		return SUCCESS;
	}
	
	public String family() throws Exception{
		long tid = teacher.getId();
		//System.out.println(names.length);
		boolean flag = DBConnect.changeTF(tid, names, relation);
		System.out.println("tid:"+tid);
		System.out.println("names:"+names.length);
		if(flag==true){
			setErrorMsg("修改成功");
		}else{
			setErrorMsg("修改失败");
		}
		return SUCCESS;
	}
	
	public String education() throws Exception{
		long tid = teacher.getId();
		boolean flag = DBConnect.changeTE(tid, begin, end, statuss, school);
		if(flag==true){
			setErrorMsg("修改成功");
		}else{
			setErrorMsg("修改失败");
		}
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		return super.execute();
	}

}
