package com.wdist.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.wdist.biz.board.service.BoardService;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.encryption.SHAFileUtil;

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
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload/"+fileName);
			
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String hash = sha.shafile(uploadPath)+"."+fileinfo[1];
			String filehash = request.getSession().getServletContext().getRealPath("/upload/"+hash);
			out2 = new FileOutputStream(new File(filehash));
			out2.write(bytes);

			File file = new File(uploadPath);
			file.delete();

			printWriter = response.getWriter();
			String fileUrl = "upload/" + hash;
			JsonObject jobj = new JsonObject();
			JsonObject jobj1 = new JsonObject();
			jobj.add("jsonData", jobj1);
			jobj1.addProperty("uploaded", 1);
			jobj1.addProperty("fileName", hash);
			jobj1.addProperty("url", "/upload/"+hash);
			
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
