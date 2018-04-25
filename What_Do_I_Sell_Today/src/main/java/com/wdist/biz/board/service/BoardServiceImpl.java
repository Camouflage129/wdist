package com.wdist.biz.board.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wdist.biz.board.dao.BoardDAO;
import com.wdist.biz.board.util.BoardFileManager;
import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	@Resource(name = "BoardDAO")
	BoardDAO dao;

	BoardFileManager bfm = new BoardFileManager();

	@Override
	public List<BoardVO> freeOrCsBoard(String Type) {
		return dao.freeOrCsBoard(Type);
	}

	@Override
	public BoardVO viewBoard(int BoardNum) {
		return dao.viewBoard(BoardNum);
	}

	@Override
	public List<FileVO> viewBoradFile(int BoardNum) {
		return dao.viewBoradFile(BoardNum);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<BoardVO> searchBoard(String Type, String searchTitle, String text) {
		return dao.searchBoard(Type, searchTitle, text);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int insertBoard(BoardVO boardVO, String id) {
		int rows = 0;
		int boardNum = 0;
		rows += dao.insertBoard(boardVO);
		List<FileVO> files = dao.getFiles(id);
		System.out.println(files);
		if(files != null) {
			Iterator<FileVO> it = files.iterator();
			boardNum = dao.getBoardNum(boardVO);
			rows += dao.insertFileGroup(boardNum);
			while(it.hasNext()) {
				FileVO data = it.next();
				data.setFileGroupNum(dao.getFileGroupNum(boardNum));
				data.setFlag("");
				dao.modifyFile(data);
			}
		}
		return rows;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int deleteBoard(int num, String content, String filePath) {
		System.out.println(num);
		int rows = 0;
		if(dao.getFileGroupNum(num) != -1) {
			rows += dao.deleteFile(dao.getFileGroupNum(num));
			rows += dao.deleteFileGroup(num);
		}
		rows += dao.deleteReply(num);
		rows += dao.deleteBoard(num);
		ArrayList<String> list = bfm.contentsFileDelect(content);
		int testcount = 0;
		if (list.size() > 0) {
			for (String str : list) {
				if (dao.filecount(str) == 1) {
					bfm.filedelete(str, filePath);
					testcount++;
				}
			}
		}
		System.out.println("검색된 파일 " + list.size() + "개, 실제 삭제파일 " + testcount+"개");
		return rows;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int modifyBoard(BoardVO vo, String id, String filePath) {
		int rows = 0;
		int boardNum = vo.getBoardNum();
		HashSet<String> set = bfm.contentsUpdateFile(vo.getContents(), filePath);
		List<FileVO> newfiles = dao.getFiles(id);
		if (newfiles != null) {
			Iterator<FileVO> it = newfiles.iterator();
			rows += dao.insertFileGroup(boardNum);
			int filegnum = 0;
			if (it.hasNext())
				filegnum = dao.getFileGroupNum(boardNum);
			while (it.hasNext()) {
				FileVO data = it.next();
				data.setFileGroupNum(filegnum);
				dao.modifyFile(data);
			}
		}
		ArrayList<FileVO> deletelist = new ArrayList<FileVO>();
		Iterator<FileVO> deleteit = deletelist.iterator();
		int testcount = 0, tc2 = 0;
		while (deleteit.hasNext()) {
			FileVO deletefile = deleteit.next();
			if (!(set.contains(deletefile.getHashValue()))) {
				dao.deleteFiles(deletefile.getFileNum());
				testcount++;
				if (dao.filecount(deletefile.getHashValue()) == 1) {
					tc2++;
					bfm.filedelete(deletefile.getHashValue(), filePath);
				}
			}
		}
		System.out.println("내용에서 없어진 파일 " + testcount + "개, 실제 삭제파일 " + tc2 + "개");
		rows += dao.modifyBoard(vo);
		return rows;
	}

	@Override
	public int insertFile(FileVO vo) {
		return dao.insertFile(vo);
	}

	@Override
	public int deleteFile(String id) {
		int rows = 0;
		List<FileVO> files = dao.getFiles(id);
		Iterator<FileVO> it = files.iterator();
		while (it.hasNext()) {
			FileVO data = it.next();
			rows += dao.deleteFiles(data.getFileNum());
		}
		return rows;
	}
}
