package com.wdist.biz.board.vo;

public class FileVO {
	private int FileNum;
	private String FileName;
	private String HashValue;
	private int FileGroupNum;
	private int FileSize;
	private String Flag;
	
	public FileVO() {
	}

	public FileVO(int fileNum, String fileName, String hashValue, int fileGroupNum, int fileSize, String flag) {
		FileNum = fileNum;
		FileName = fileName;
		HashValue = hashValue;
		FileGroupNum = fileGroupNum;
		FileSize = fileSize;
		Flag = flag;
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

	public String getFlag() {
		return Flag;
	}

	public void setFlag(String flag) {
		Flag = flag;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + FileGroupNum;
		result = prime * result + ((FileName == null) ? 0 : FileName.hashCode());
		result = prime * result + FileNum;
		result = prime * result + FileSize;
		result = prime * result + ((Flag == null) ? 0 : Flag.hashCode());
		result = prime * result + ((HashValue == null) ? 0 : HashValue.hashCode());
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
		if (Flag == null) {
			if (other.Flag != null)
				return false;
		} else if (!Flag.equals(other.Flag))
			return false;
		if (HashValue == null) {
			if (other.HashValue != null)
				return false;
		} else if (!HashValue.equals(other.HashValue))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "FileVO [FileNum=" + FileNum + ", FileName=" + FileName + ", HashValue=" + HashValue + ", FileGroupNum="
				+ FileGroupNum + ", FileSize=" + FileSize + ", Flag=" + Flag + "]";
	}
}
