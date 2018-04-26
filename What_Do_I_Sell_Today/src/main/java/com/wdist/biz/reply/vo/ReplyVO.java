package com.wdist.biz.reply.vo;

import java.sql.Date;

public class ReplyVO {
	private int replyNum;
	private int parentNum;
	private int count;
	private int childCount;
	private String usersID;
	private String contents;
	private Date postDate;
	private int boardNum;
	
	public ReplyVO() {
	}

	public ReplyVO(String usersID, String contents, Date postDate, int boardNum) {
		this.usersID = usersID;
		this.contents = contents;
		this.postDate = postDate;
		this.boardNum = boardNum;
	}

	public ReplyVO(int replyNum, int parentNum, int count, int childCount, String usersID, String contents,
			Date postDate, int boardNum) {
		this.replyNum = replyNum;
		this.parentNum = parentNum;
		this.count = count;
		this.childCount = childCount;
		this.usersID = usersID;
		this.contents = contents;
		this.postDate = postDate;
		this.boardNum = boardNum;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getParentNum() {
		return parentNum;
	}

	public void setParentNum(int parentNum) {
		this.parentNum = parentNum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getChildCount() {
		return childCount;
	}

	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}

	public String getUsersID() {
		return usersID;
	}

	public void setUsersID(String usersID) {
		this.usersID = usersID;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardNum;
		result = prime * result + childCount;
		result = prime * result + ((contents == null) ? 0 : contents.hashCode());
		result = prime * result + count;
		result = prime * result + parentNum;
		result = prime * result + ((postDate == null) ? 0 : postDate.hashCode());
		result = prime * result + replyNum;
		result = prime * result + ((usersID == null) ? 0 : usersID.hashCode());
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
		if (boardNum != other.boardNum)
			return false;
		if (childCount != other.childCount)
			return false;
		if (contents == null) {
			if (other.contents != null)
				return false;
		} else if (!contents.equals(other.contents))
			return false;
		if (count != other.count)
			return false;
		if (parentNum != other.parentNum)
			return false;
		if (postDate == null) {
			if (other.postDate != null)
				return false;
		} else if (!postDate.equals(other.postDate))
			return false;
		if (replyNum != other.replyNum)
			return false;
		if (usersID == null) {
			if (other.usersID != null)
				return false;
		} else if (!usersID.equals(other.usersID))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNum=" + replyNum + ", parentNum=" + parentNum + ", count=" + count + ", childCount="
				+ childCount + ", usersID=" + usersID + ", contents=" + contents + ", postDate=" + postDate
				+ ", boardNum=" + boardNum + "]";
	}
}
