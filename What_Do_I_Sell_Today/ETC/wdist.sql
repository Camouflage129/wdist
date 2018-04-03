drop user wdist cascade;
create user wdist identified by 1234;
grant dba to wdist;
connect wdist/1234;

drop table Reply;
drop table Files;
drop table FileGroup;
drop table Board;
drop table Users;

/**********************************/
/* Table Name: Users */
/**********************************/
CREATE TABLE Users(
		UsersID VARCHAR(15),
		PW VARCHAR(100) NOT NULL,
		Name VARCHAR(20) NOT NULL,
		Email VARCHAR(25) NOT NULL
);
/**********************************/
/* Table Name: Board */
/**********************************/
CREATE TABLE Board(
		BoardNum INT,
		Type VARCHAR(20) NOT NULL,
		Title VARCHAR(100) NOT NULL,
		Contents VARCHAR(3000),
		UsersID VARCHAR(15) NOT NULL,
		PostDate DATE NOT NULL
);
/**********************************/
/* Table Name: FileGroup */
/**********************************/
CREATE TABLE FileGroup(
		FileGroupNum INT,
		BoardNum INT
);
/**********************************/
/* Table Name: File */
/**********************************/
CREATE TABLE Files(
		FileNum INT,
		FileName VARCHAR(100) NOT NULL,
		HashValue VARCHAR(100) NOT NULL,
		FileGroupNum INT
);
/**********************************/
/* Table Name: Reply */
/**********************************/
CREATE TABLE Reply(
		ReplyNum INT,
		UsersID VARCHAR(15) NOT NULL,
		Contents VARCHAR(1000),
		PostDate DATE NOT NULL,
		ReplyNums VARCHAR(10),
		BoardNum INT
);

ALTER TABLE Users ADD CONSTRAINT IDX_Users_PK PRIMARY KEY (UsersID);

ALTER TABLE Board ADD CONSTRAINT IDX_Board_PK PRIMARY KEY (BoardNum);
ALTER TABLE Board ADD CONSTRAINT IDX_Board_FK0 FOREIGN KEY (UsersID) REFERENCES Users (UsersID);

ALTER TABLE Reply ADD CONSTRAINT IDX_Reply_PK PRIMARY KEY (ReplyNum);
ALTER TABLE Reply ADD CONSTRAINT IDX_Reply_FK0 FOREIGN KEY (BoardNum) REFERENCES Board (BoardNum);
ALTER TABLE Reply ADD CONSTRAINT IDX_Reply_FK1 FOREIGN KEY (UsersID) REFERENCES Users (UsersID);

ALTER TABLE FileGroup ADD CONSTRAINT IDX_FileGroup_PK PRIMARY KEY (FileGroupNum);
ALTER TABLE FileGroup ADD CONSTRAINT IDX_FileGroup_FK0 FOREIGN KEY (BoardNum) REFERENCES Board (BoardNum);

ALTER TABLE Files ADD CONSTRAINT IDX_File_PK PRIMARY KEY (FileNum);
ALTER TABLE Files ADD CONSTRAINT IDX_File_FK0 FOREIGN KEY (FileGroupNum) REFERENCES FileGroup (FileGroupNum);
