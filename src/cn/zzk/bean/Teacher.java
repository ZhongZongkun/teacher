package cn.zzk.bean;

import java.util.ArrayList;
import java.util.Date;

public class Teacher {
	private long id;
	private long uid;
	private String name;
	private boolean sex;
	private Date birthday;
	private String status;
	private String education;
	private long dapartid;
	private String depart;
	private long professionid;
	private String profession;
	private long jobid;
	private String job;
	private String address;
	private String phone;
	private String email;
	private String IDcard;
	private ArrayList<Family> myfamily;
	private ArrayList<Education> myeducation;
	public String getDepart() {
		return depart;
	}
	public void setDepart(String depart) {
		this.depart = depart;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isSex() {
		return sex;
	}
	public void setSex(boolean sex) {
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
	public long getDapartid() {
		return dapartid;
	}
	public void setDapartid(long dapartid) {
		this.dapartid = dapartid;
	}
	public long getProfessionid() {
		return professionid;
	}
	public void setProfessionid(long professionid) {
		this.professionid = professionid;
	}
	public long getJobid() {
		return jobid;
	}
	public void setJobid(long jobid) {
		this.jobid = jobid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getIDcard() {
		return IDcard;
	}
	public void setIDcard(String iDcard) {
		IDcard = iDcard;
	}
	public ArrayList<Family> getMyfamily() {
		return myfamily;
	}
	public void setMyfamily(ArrayList<Family> myfamily) {
		this.myfamily = myfamily;
	}
	public ArrayList<Education> getMyeducation() {
		return myeducation;
	}
	public void setMyeducation(ArrayList<Education> myeducation) {
		this.myeducation = myeducation;
	}
	
}
