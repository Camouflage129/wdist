package com.wdist.biz.board.vo;

public class FileVO {
	private int FileNum;
	private String FileName;
	private String HashValue;
	private int FileGroupNum;
	private int FileSize;
	private String flag;
	
	public FileVO() {
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public FileVO(int fileNum, String fileName, String hashValue, int fileGroupNum, int fileSize) {
		this.FileNum = fileNum;
		this.FileName = fileName;
		this.HashValue = hashValue;
		this.FileGroupNum = fileGroupNum;
		this.FileSize = fileSize;
	}

	public FileVO(String fileName, String hashValue, int fileGroupNum, int fileSize, String flag) {
		super();
		this.FileName = fileName;
		this.HashValue = hashValue;
		this.FileGroupNum = fileGroupNum;
		this.FileSize = fileSize;
		this.flag = flag;
	}

	public int getFileNum() {
		return FileNum;
	}

	public void setFileNum(int fileNum) {
		FileNum = fileNum;
	}

	public String getFileName() {
		return FileName;
	}

	public void setFileName(String fileName) {
		FileName = fileName;
	}

	public String getHashValue() {
		return HashValue;
	}

	public void setHashValue(String hashValue) {
		HashValue = hashValue;
	}

	public int getFileGroupNum() {
		return FileGroupNum;
	}

	public void setFileGroupNum(int fileGroupNum) {
		FileGroupNum = fileGroupNum;
	}

	public int getFileSize() {
		return FileSize;
	}

	public void setFileSize(int fileSize) {
		FileSize = fileSize;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + FileGroupNum;
		result = prime * result + ((FileName == null) ? 0 : FileName.hashCode());
		result = prime * result + FileNum;
		result = prime * result + FileSize;
		result = prime * result + ((HashValue == null) ? 0 : HashValue.hashCode());
		result = prime * result + ((flag == null) ? 0 : flag.hashCode());
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
		FileVO other = (FileVO) obj;
		if (FileGroupNum != other.FileGroupNum)
			return false;
		if (FileName == null) {
			if (other.FileName != null)
				return false;
		} else if (!FileName.equals(other.FileName))
			return false;
		if (FileNum != other.FileNum)
			return false;
		if (FileSize != other.FileSize)
			return false;
		if (HashValue == null) {
			if (other.HashValue != null)
				return false;
		} else if (!HashValue.equals(other.HashValue))
			return false;
		if (flag == null) {
			if (other.flag != null)
				return false;
		} else if (!flag.equals(other.flag))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "FileVO [FileNum=" + FileNum + ", FileName=" + FileName + ", HashValue=" + HashValue + ", FileGroupNum="
				+ FileGroupNum + ", FileSize=" + FileSize + ", flag=" + flag + "]";
	}
	
}
