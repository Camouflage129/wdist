package com.wdist.biz.board.util;

import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BoardFileManager {
	public boolean contentsFileDelect(String content, String filePath) { 
		Pattern pattern = Pattern.compile("([a-zA-Z0-9]{64})(\\.gif|\\.jpg|\\.jpeg|\\.png|\\.bmp|\\.tif|\\.raw)");
		Matcher matcher = pattern.matcher(content);
		File f = null;
		try{
		while(matcher.find()) {
			String fileview = filePath+matcher.group(); 
			System.out.println("삭제대상 : "+fileview);
			f = new File(fileview);
			f.delete();
		}
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
