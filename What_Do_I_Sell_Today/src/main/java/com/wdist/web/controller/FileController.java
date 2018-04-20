package com.wdist.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.wdist.biz.board.service.BoardService;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.encryption.SHAFileUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {
	SHAFileUtil sha = new SHAFileUtil();
	
	@Resource(name="BoardService")
	BoardService service;

	@RequestMapping(value = "/community/imageUpload.do", method = RequestMethod.POST)
	public void communityImageUpload(HttpSession session,HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) {

		OutputStream out = null;
		OutputStream out2 = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String[] fileinfo = fileName.split("\\.");
			String uploadPath = "C:/tmp/2/wdist/What_Do_I_Sell_Today/src/main/webapp/WEB-INF/filetmp/" + fileName;// 저장경로
			
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String hash = sha.shafile(uploadPath)+"."+fileinfo[1];
			String filehash = "C:/tmp/2/wdist/What_Do_I_Sell_Today/src/main/webapp/boardimg/" + hash;
			out2 = new FileOutputStream(new File(filehash));
			out2.write(bytes);

			File file = new File(uploadPath);
			file.delete();

			printWriter = response.getWriter();
			String fileUrl = "boardimg/" + hash;
			Gson json = new Gson();
			JsonObject jobj = new JsonObject();
			JsonObject jobj1 = new JsonObject();
			jobj.add("jsonData", jobj1);
			jobj1.addProperty("uploaded", 1);
			jobj1.addProperty("fileName", hash);
			jobj1.addProperty("url", "./boardimg/"+hash);
			
			printWriter.println(jobj1.toString());
			printWriter.flush();
			String flag = (String) session.getAttribute("userid");
			FileVO vo = new FileVO(fileUrl,hash,bytes.length,flag);
			
			service.insertFile(vo);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (out2 != null) {
					out2.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
