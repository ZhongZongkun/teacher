package cn.zzk.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import cn.zzk.bean.Job;
import cn.zzk.bean.LoginInfo;
import cn.zzk.bean.News;
import cn.zzk.bean.Profession;
import cn.zzk.bean.SInfo;
import cn.zzk.bean.User;

public class DBConnect {
	private static final String DBDRIVER = "com.mysql.jdbc.Driver";
	private static final String DBURL = 
			"jdbc:mysql://localhost:3306/teacher?useUnicode=true&characterEncoding=UTF-8";
	private static final String DBUSER = "root";
	private static final String DBPASS = "";

	/*
	 * public static void main(String[] args) { try {
	 * //System.out.println(search("hh","123"));
	 * //System.out.println(register("hh1212","123"));
	 * //System.out.println(update(1,"123456"));
	 * //System.out.println(delete(10)); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } }
	 */

	public static List<Object> login(String userName, String passWord)
			throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		String sql = "SELECT" + " * from t_users where username=" + "?"
				+ " AND password=" + "?";
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		state = conn.prepareStatement(sql);
		state.setString(1, userName);
		state.setString(2,MyUtils.getMd5(passWord) );//passWord);
		rs = state.executeQuery();
		List<Object> list = ResultToList.populate(rs, User.class);
		// System.out.println(list.size());
		// System.out.println(rs.getMetaData().getColumnCount());
		if (list.size() == 1) {
			rs.close();
			state.close();
			conn.close();
			return list;
		} else {
			rs.close();
			state.close();
			conn.close();
			return null;
		}
	}

	public static boolean insertLogininfo(long uid, String loginip, String time)
			throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		int id = 0;
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		String insertSql = "INSERT"
				+ " INTO t_logininfo(uid,loginip,logintime) VALUES(?,?,?)";
		state = conn.prepareStatement(insertSql);
		state.setLong(1, uid);
		state.setString(2, loginip);
		state.setString(3, time);
		id = state.executeUpdate();
		state.close();
		conn.close();
		if (id == 1) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean insertNews(String title, String content,
			String outtime, String author) throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		int id = 0;
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		String insertSql = "INSERT"
				+ " INTO t_news(title,content,outtime,author) VALUES(?,?,?,?)";
		state = conn.prepareStatement(insertSql);
		state.setString(1, title);
		state.setString(2, content);
		state.setString(3, outtime);
		state.setString(4, author);
		id = state.executeUpdate();
		state.close();
		conn.close();
		if (id == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Test
	public void procedure() throws Exception {
		Connection conn = null;
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		// 创建存储过程的对象
		CallableStatement c = conn.prepareCall("{call insert_edu(?,?,?,?,?)}");
		// 给存储过程的第一个参数设置值
		c.setLong(1, 1L);
		c.setDate(2, new java.sql.Date(new java.util.Date().getTime()));
		c.setDate(3, new java.sql.Date(
				new java.util.Date().getTime() - 500000000));
		c.setString(4, "你好");
		c.setString(5, "我好");
		// c.registerOutParameter(2,java.sql.Types.INTEGER);
		// 执行存储过程
		c.execute();
		// 得到存储过程的输出参数值
		// System.out.println (c.getInt(2));
		conn.close();
	}

	public static boolean register(String userName, String passWord)
			throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		if (!isExist(userName)) {
			return false;
		} else {
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
			String insertSql = "INSERT"
					+ " INTO users(username,password,time) VALUES(?,?,?)";
			state = conn.prepareStatement(insertSql);
			state.setString(1, userName);
			state.setString(2, passWord);
			// System.out.println(System.currentTimeMillis());
			state.setString(3, System.currentTimeMillis() + "");
			// int id = state.executeUpdate();
			// System.out.println("id:" + id);
			state.close();
			conn.close();
			return true;
		}
	}

	public static boolean update(int id, String passWord) throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		String updateSql = "UPDATE users SET password=? where id=?";
		state = conn.prepareStatement(updateSql);
		state.setString(1, passWord);
		state.setString(2, id + "");
		int flag = state.executeUpdate();
		System.out.println("flag:" + flag);
		state.close();
		state.close();
		conn.close();
		if (flag == 1) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean delete(int tid, long id) throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		String updateSql;
		switch (tid) {
		case 1:
			updateSql = "DELETE FROM t_teacherfamily where tid=?";
			break;
		case 2:
			updateSql = "DELETE FROM t_teachereducation where tid=?";
			break;
		default:
			updateSql = "DELETE FROM users where tid=?";
			break;
		}

		state = conn.prepareStatement(updateSql);
		state.setLong(1, id);
		int flag = state.executeUpdate();
		// System.out.println("flag:" + flag);
		state.close();
		state.close();
		conn.close();
		if (flag == 1) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isExist(String userName) throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		String sql = "SELECT" + " * from t_users where username=" + "?";
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		state = conn.prepareStatement(sql);
		state.setString(1, userName);
		// state.executeUpdate();
		rs = state.executeQuery();
		if (rs.next()) {
			rs.close();
			state.close();
			conn.close();
			return true;
		} else {
			rs.close();
			state.close();
			conn.close();
			return false;
		}
	}

	/**
	 * 查询所有新闻
	 * 
	 * @return News的Map集合
	 * @throws Exception
	 */
	public static List<News> getNews() throws Exception {

		Connection conn = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		String sql = "SELECT" + " * from t_news ORDER BY outtime DESC";
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		state = conn.prepareStatement(sql);
		rs = state.executeQuery();
		List<News> list = ResultToList.populateMap(rs, News.class);
		rs.close();
		state.close();
		conn.close();
		return list;
	}

	/**
	 * 查询教师相关信息
	 * 
	 * @param tid
	 *            Table ID 1)t_info
	 * @param uid
	 * @param clazz
	 * @return
	 * @throws Exception
	 */
	public static List<Object> getTeacherInfo(int tid, long uid, Class<?> clazz)
			throws Exception {

		Connection conn = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		String sql = "SELECT" + " * FROM t_info WHERE uid=? ORDER BY id DESC";
		switch (tid) {
		case 1:
			sql = "SELECT" + " * FROM t_info WHERE uid=? ORDER BY id DESC";
			break;
		case 2:
			sql = "SELECT" + " * FROM t_teachereducation WHERE tid=? ";
			break;
		case 3:
			sql = "SELECT" + " * FROM t_teacherfamily WHERE tid=? ";
			break;
		case 4:
			sql = "SELECT" + " * FROM t_job WHERE id=? ";
			break;
		case 5:
			sql = "SELECT" + " * FROM t_profession WHERE id=? ";
			break;
		case 6:
			sql = "SELECT" + " * FROM t_depart WHERE id=? ";
			break;
		case 7:
			sql = "SELECT" + " * FROM t_income WHERE proid=? ";
			break;
		}

		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		state = conn.prepareStatement(sql);
		state.setLong(1, uid);
		rs = state.executeQuery();
		List<Object> list = ResultToList.populate(rs, clazz);
		rs.close();
		state.close();
		conn.close();
		return list;
	}

	/**
	 * 查询登录信息
	 * 
	 * @return News的Map集合
	 * @throws Exception
	 */
	public static List<Object> getLoginInfo(long id) throws Exception {

		Connection conn = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		String sql = "SELECT"
				+ " * from t_logininfo WHERE uid=? ORDER BY id DESC";
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		state = conn.prepareStatement(sql);
		state.setLong(1, id);
		rs = state.executeQuery();
		List<Object> list = ResultToList.populate(rs, LoginInfo.class);
		//System.out.println("logininfo.size:"+list.size());
		//System.out.println(id);
		rs.close();
		state.close();
		conn.close();
		return list;
	}

	/**
	 * 查询登录信息
	 * 
	 * @return News的Map集合
	 * @throws Exception
	 */
	public static List<Object> getTwoId(int table, long id, long uid,
			Class<?> clazz) throws Exception {

		Connection conn = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		String sql = "SELECT"
				+ " * from t_logininfo WHERE uid=? ORDER BY id DESC";
		switch (table) {
		case 1:
			sql = "SELECT" + " * from t_rp WHERE reward=? AND uid=? ";
			break;
		case 2:
			sql = "SELECT" + " * from t_logininfo WHERE uid=? ORDER BY id DESC";
			break;
		}
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		state = conn.prepareStatement(sql);
		state.setLong(1, id);
		state.setLong(2, uid);
		rs = state.executeQuery();
		List<Object> list = ResultToList.populate(rs, clazz);
		rs.close();
		state.close();
		conn.close();
		return list;
	}

	public static boolean changeTInfo(long id, String name, int sex,
			Date birthday, String status, String education, String phone,
			String email, String address) throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		String insertSql = "UPDATE"
				+ " t_info SET name=?,sex=?,birthday=?,status=?,education=?,phone=?,email=?,address=?"
				+ " WHERE id=?";
		state = conn.prepareStatement(insertSql);
		state.setString(1, name);
		state.setInt(2, sex);
		state.setDate(3, new java.sql.Date(birthday.getTime()));
		state.setString(4, status);
		state.setString(5, education);
		state.setString(6, phone);
		state.setString(7, email);
		state.setString(8, address);
		state.setLong(9, id);
		id = state.executeUpdate();
		state.close();
		conn.close();
		if (id == 1) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean changeTF(long id, String[] names, String[] relations)
			throws Exception {
		if (names.length != relations.length) {
			return false;
		}
		delete(1, id);
		
		Connection conn = null;
		PreparedStatement state = null;
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		String insertSql = "INSERT INTO"
				+ " t_teacherfamily(tid,name,relation) VALUES(?,?,?);";
		state = conn.prepareStatement(insertSql);
		for (int i = 0; i < names.length; i++) {
			System.out.println("changeTF:"+id);
			state.setLong(1, id);
			state.setString(2, names[i]);
			state.setString(3, relations[i]);
			state.executeUpdate();
		}
		state.close();
		conn.close();
		return true;
	}

	public static boolean changeTE(long id, Date[] begins, Date[] ends,
			String[] status, String[] schools) throws Exception {
		if (begins.length != ends.length) {
			return false;
		}
		delete(2, id);
		Connection conn = null;
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		// 创建存储过程的对象
		CallableStatement c = conn.prepareCall("{call insert_edu(?,?,?,?,?)}");
		for (int i = 0; i < begins.length; i++) {
			if (begins[i] != null) {
				// 给存储过程的第一个参数设置值
				c.setLong(1, id);
				c.setDate(2, new java.sql.Date(begins[i].getTime()));
				c.setDate(3, new java.sql.Date(ends[i].getTime()));
				c.setString(4, status[i]);
				c.setString(5, schools[i]);
				// c.registerOutParameter(2,java.sql.Types.INTEGER);
				// 执行存储过程
				c.execute();
			}
		}
		// 得到存储过程的输出参数值
		// System.out.println (c.getInt(2));
		conn.close();
		return true;
	}

	public static List<Object> getSInfo() throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		String sql = "SELECT" + " * from t_smallinfo";
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		state = conn.prepareStatement(sql);
		rs = state.executeQuery();
		List<Object> list = ResultToList.populate(rs, SInfo.class);
		rs.close();
		state.close();
		conn.close();
		return list;
	}

	public static List<Object> getJPD(Class<?> clazz) throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		String sql;
		if (clazz == Job.class) {
			sql = "SELECT"
					+ " jobid AS id,jobname AS name from t_smallinfo GROUP BY jobid";
		} else if (clazz == Profession.class) {
			sql = "SELECT"
					+ " professionid AS id,professionname AS name from t_smallinfo GROUP BY professionid";
		} else {
			sql = "SELECT"
					+ " departid AS id,departname AS name from t_smallinfo GROUP BY departid";
		}
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		state = conn.prepareStatement(sql);
		rs = state.executeQuery();
		List<Object> list = ResultToList.populate(rs, clazz);
		rs.close();
		state.close();
		conn.close();
		return list;
	}

	public static boolean add_RP(long uid, String content, Date time,
			double money, int reward) throws Exception {
		Connection conn = null;
		PreparedStatement state = null;
		int id = 0;
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		String insertSql = "INSERT"
				+ " INTO t_rp(uid,content,time,money,reward) VALUES(?,?,?,?,?)";
		state = conn.prepareStatement(insertSql);
		state.setLong(1, uid);
		state.setString(2, content);
		state.setDate(3, new java.sql.Date(time.getTime()));
		state.setDouble(4, money);
		state.setInt(5, reward);
		id = state.executeUpdate();
		state.close();
		conn.close();
		if (id == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public static List<Object> getSInfoById(String departid, String jobid, String professionid) throws Exception{
		Connection conn = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		String sql = "SELECT"
				+ " * from t_smallinfo WHERE  departid LIKE ? AND professionid LIKE ? AND jobid LIKE ?";
		Class.forName(DBDRIVER);
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		state = conn.prepareStatement(sql);
		state.setString(1, departid);
		state.setString(2,professionid);
		state.setString(3, jobid);
		rs = state.executeQuery();
		List<Object> list = ResultToList.populate(rs, SInfo.class);
		rs.close();
		state.close();
		conn.close();
		return list;
	}

}
