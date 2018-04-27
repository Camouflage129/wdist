package com.wdist.biz.rserve;

public class SFTP {
	public static void main(String args[]) {

        String host = "70.12.109.77";
        int port = 22;
        String userName = "hadoop";
        String password = "wjdqhqhdks";
        String dir = "/home/hadoop/rServeTmp/";

        SFTPUtil util = new SFTPUtil();
        util.init(host, userName, password, port);
        
		String fileName="wordcloud4.jpeg";
		String saveDir="C:/Users/User/git/wdist/What_Do_I_Sell_Today/src/main/webapp/image/"+fileName;

        util.download(dir, fileName, saveDir);

        util.disconnection();
        System.exit(0);
    }
}
