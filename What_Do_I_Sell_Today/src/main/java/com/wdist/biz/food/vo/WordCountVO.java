package com.wdist.biz.food.vo;

public class WordCountVO {
	private String word;
	private String searchword;
	private String quater;
	private int count;
	private double tfidf;
	private int rank;
	
	public WordCountVO() {
	}

	public WordCountVO(String word, String searchword, String quater, int count, double tfidf, int rank) {
		this.word = word;
		this.searchword = searchword;
		this.quater = quater;
		this.count = count;
		this.tfidf = tfidf;
		this.rank = rank;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getSearchword() {
		return searchword;
	}

	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	public String getQuater() {
		return quater;
	}

	public void setQuater(String quater) {
		this.quater = quater;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getTfidf() {
		return tfidf;
	}

	public void setTfidf(double tfidf) {
		this.tfidf = tfidf;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "WordCountVO [word=" + word + ", searchword=" + searchword + ", quater=" + quater + ", count=" + count
				+ ", tfidf=" + tfidf + ", rank=" + rank + "]";
	}
}
