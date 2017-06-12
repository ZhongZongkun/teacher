package cn.zzk.util;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import cn.zzk.bean.News;

public class ResultToList {
	public static ArrayList<Object> populate(ResultSet rs, Class<?> clazz)
			throws Exception {
		ResultSetMetaData rsmd = rs.getMetaData();// 结果集的元素对象
		int colCount = rsmd.getColumnCount();// 获取结果集对象的元素个数
		ArrayList<Object> list = new ArrayList<>();// 返回的对象列表
		Field[] fields = clazz.getDeclaredFields();// 获取指定对象的属性集合
		/*
		 * 循环遍历rs,将每个结果集的元素对象的值填充到clazz对象中
		 */
		while (rs.next()) {
			Object obj = clazz.newInstance();
			for (int i = 1; i <= colCount; i++) {
				Object value = rs.getObject(i);// 遍历当前rs中的每一个元素值
				for (int j = 0; j < fields.length; j++) {
					Field f = fields[j];
					if (f.getName().equalsIgnoreCase(rsmd.getColumnName(i))) {
						boolean flag = f.isAccessible();
						f.setAccessible(true);
						f.set(obj, value);
						f.setAccessible(flag);
					}
				}
			}
			list.add(obj);
		}

		return list;
	}
	
	public static List<News> populateMap(ResultSet rs, Class<?> clazz)
			throws Exception {
		ResultSetMetaData rsmd = rs.getMetaData();// 结果集的元素对象
		int colCount = rsmd.getColumnCount();// 获取结果集对象的元素个数
		List<News> list = new ArrayList<>();// 返回的对象列表
		Field[] fields = clazz.getDeclaredFields();// 获取指定对象的属性集合
		/*
		 * 循环遍历rs,将每个结果集的元素对象的值填充到clazz对象中
		 */
		while (rs.next()) {
			Object obj = clazz.newInstance();
			for (int i = 1; i <= colCount; i++) {
				Object value = rs.getObject(i);// 遍历当前rs中的每一个元素值
				for (int j = 0; j < fields.length; j++) {
					Field f = fields[j];
					if (f.getName().equalsIgnoreCase(rsmd.getColumnName(i))) {
						boolean flag = f.isAccessible();
						f.setAccessible(true);
						f.set(obj, value);
						f.setAccessible(flag);
					}
				}
			}
			list.add((News) obj);
		}

		return list;
	}
	
	
	
}
