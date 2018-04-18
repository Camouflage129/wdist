package com.wdist.biz.board.vo;

import java.sql.Date;

public class ReplyVO {
	private int ReplyNum;
	private String UsersID;
	private String Contents;
	private Date DATE;
	private String ReplyNums;
	private int BoardNum;
	
	public ReplyVO() {
	}

	public ReplyVO(int replyNum, String usersID, String contents, Date dATE, String repliesNum, int boardNum) {
		ReplyNum = replyNum;
		UsersID = usersID;
		Contents = contents;
		DATE = dATE;
		ReplyNums = repliesNum;
		BoardNum = boardNum;
	}

	public int getReplyNum() {
		return ReplyNum;
	}

	public void setReplyNum(int replyNum) {
		ReplyNum = replyNum;
	}

	public String getUsersID() {
		return UsersID;
	}

	public void setUsersID(String usersID) {
		UsersID = usersID;
	}

	public String getContents() {
		return Contents;
	}

	public void setContents(String contents) {
		Contents = contents;
	}

	public Date getDATE() {
		return DATE;
	}

	public void setDATE(Date dATE) {
		DATE = dATE;
	}

	public String getReplyNums() {
		return ReplyNums;
	}

	public void getReplyNums(String repliesNum) {
		ReplyNums = repliesNum;
	}

	public int getBoardNum() {
		return BoardNum;
	}

	public void setBoardNum(int boardNum) {
		BoardNum = boardNum;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + BoardNum;
		result = prime * result + ((Contents == null) ? 0 : Contents.hashCode());
		result = prime * result + ((DATE == null) ? 0 : DATE.hashCode());
		result = prime * result + ((ReplyNums == null) ? 0 : ReplyNums.hashCode());
		result = prime * result + ReplyNum;
		result = prime * result + ((UsersID == null) ? 0 : UsersID.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReplyVO other = (ReplyVO) obj;
		if (BoardNum != other.BoardNum)
			return false;
		if (Contents == null) {
			if (other.Contents != null)
				return false;
		} else if (!Contents.equals(other.Contents))
			return false;
		if (DATE == null) {
			if (other.DATE != null)
				return false;
		} else if (!DATE.equals(other.DATE))
			return false;
		if (ReplyNums == null) {
			if (other.ReplyNums != null)
				return false;
		} else if (!ReplyNums.equals(other.ReplyNums))
			return false;
		if (ReplyNum != other.ReplyNum)
			return false;
		if (UsersID == null) {
			if (other.UsersID != null)
				return false;
		} else if (!UsersID.equals(other.UsersID))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReplyVO [ReplyNum=" + ReplyNum + ", UsersID=" + UsersID + ", Contents=" + Contents + ", DATE=" + DATE
				+ ", RepliesNum=" + ReplyNums + ", BoardNum=" + BoardNum + "]";
	}
}
