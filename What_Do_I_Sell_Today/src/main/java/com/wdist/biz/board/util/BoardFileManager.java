package com.wdist.biz.board.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BoardFileManager {
	Pattern pattern = Pattern.compile("([a-zA-Z0-9]{64})(\\.gif|\\.jpg|\\.jpeg|\\.png|\\.bmp|\\.tif|\\.raw)");
	File f = null;
	Matcher matcher = null;
	public ArrayList<String> contentsFileDelect(String content) { 
		ArrayList<String> list = new ArrayList<String>();
		matcher = pattern.matcher(content);
		while(matcher.find()) {
			list.add(matcher.group());
		}
		return list;
	}
	public boolean filedelete(String filename, String filePath){
		try{
			f = new File(filePath+filename);
			f.delete();
		}catch (Exception e) {
			return false;
		}
		return true;
	}
	public HashSet<String> contentsUpdateFile(String content, String filePath){
		HashSet<String> set = new HashSet<String>();
		matcher = pattern.matcher(content);
		try{
		while(matcher.find()) {
			String fileview = filePath+matcher.group();
			set.add(fileview);
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return set;
	}
}
