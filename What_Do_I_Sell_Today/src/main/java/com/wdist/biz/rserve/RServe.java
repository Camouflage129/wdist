package com.wdist.biz.rserve;

import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class RServe {
	public void getWordCloud(String species) {
		RConnection conn = null;
		System.out.println("species : "+species);
		try {
			conn = new RConnection("70.12.109.77",6312);
			System.out.println("RServe 연동, conn: "+conn);
			conn.eval("library(RColorBrewer)");
			conn.eval("library(DBI)");
			conn.eval("library(RMySQL)");
			conn.eval("library(rJava)");
			conn.eval("library(wordcloud)");
			conn.eval("library(Rserve)");
			conn.eval("library(ggplot2)");
			conn.eval("con <- dbConnect(MySQL(), host = '70.12.109.53', dbname = 'project', user = 'root', password = 'bigdata', port = 3306)");
			conn.eval("wordcount <- dbGetQuery(con, 'SELECT word, tfidf FROM wordcount WHERE searchword = \\'"+species+"\\' and tfidf > (SELECT AVG(tfidf) FROM wordcount)')");
			conn.eval("palete<-brewer.pal(9,'Set1')");
			conn.eval("jpeg(filename = '/home/hadoop/rServeTmp/"+species+".jpeg',width = 400, height = 400)");
			conn.eval("wordcloud(wordcount$word, wordcount$tfidf, max.words=Inf, random.order=FALSE, rot.per=.15, colors=palete)");
			conn.eval("dev.off()");
			System.out.println("Rserve 수행 끝");
		} catch (RserveException e) {
			e.printStackTrace();
		} finally {
			if( conn != null && conn.isConnected())
				conn.close();
		}
		
		String host = "70.12.109.77";
        int port = 22;
        String userName = "hadoop";
        String password = "wjdqhqhdks";
        String dir = "/home/hadoop/rServeTmp/";

        SFTPUtil util = new SFTPUtil();
        util.init(host, userName, password, port);
        
		String fileName=species;
		String saveDir="C:/Users/User/git/wdist/What_Do_I_Sell_Today/src/main/webapp/image/"+fileName;

        util.download(dir, fileName, saveDir);

        util.disconnection();
        System.exit(0);
	}
}
