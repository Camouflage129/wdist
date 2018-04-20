package com.wdist.biz.board.vo;

import java.sql.Date;

public class BoardVO {
	private int BoardNum;
	private String Type;
	private String Title;
	private String Contents;
	private String UsersID;
	private Date DATE;
	
	public BoardVO() {
	}

	public BoardVO(String type, String title, String contents, String usersID, Date dATE) {
		super();
		Type = type;
		Title = title;
		Contents = contents;
		UsersID = usersID;
		DATE = dATE;
	}

	public BoardVO(int boardNum, String type, String title, String contents, String usersID, Date dATE) {
		BoardNum = boardNum;
		Type = type;
		Title = title;
		Contents = contents;
		UsersID = usersID;
		DATE = dATE;
	}

	public int getBoardNum() {
		return BoardNum;
	}

	public void setBoardNum(int boardNum) {
		BoardNum = boardNum;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getContents() {
		return Contents;
	}

	public void setContents(String contents) {
		Contents = contents;
	}

	public String getUsersID() {
		return UsersID;
	}

	public void setUsersID(String usersID) {
		UsersID = usersID;
	}

	public Date getPostDate() {
		return DATE;
	}

	public void setDATE(Date dATE) {
		DATE = dATE;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + BoardNum;
		result = prime * result + ((Contents == null) ? 0 : Contents.hashCode());
		result = prime * result + ((DATE == null) ? 0 : DATE.hashCode());
		result = prime * result + ((Title == null) ? 0 : Title.hashCode());
		result = prime * result + ((Type == null) ? 0 : Type.hashCode());
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
		BoardVO other = (BoardVO) obj;
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
		if (Title == null) {
			if (other.Title != null)
				return false;
		} else if (!Title.equals(other.Title))
			return false;
		if (Type == null) {
			if (other.Type != null)
				return false;
		} else if (!Type.equals(other.Type))
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
		return "BoardVO [BoardNum=" + BoardNum + ", Type=" + Type + ", Title=" + Title + ", Contents=" + Contents
				+ ", UsersID=" + UsersID + ", DATE=" + DATE + "]";
	}
}
