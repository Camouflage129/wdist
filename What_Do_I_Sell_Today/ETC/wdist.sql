drop user wdist;
create user wdist identified by 1234;
grant dba to wdist;
connect wdist/1234;

drop table Reply;
drop table FreeBoard;
drop table ServiceBoard;
drop table Users;

/**********************************/
/* Table Name: ServiceBoard */
/**********************************/
CREATE TABLE ServiceBoard(
		Num INT,
		Title VARCHAR(100) NOT NULL,
		Contents VARCHAR(3000),
		FileName VARCHAR(100),
		HashName VARCHAR(100),
		FileType VARCHAR(10),
		UserID VARCHAR(15) NOT NULL,
		PostDate DATE NOT NULL
);
/**********************************/
/* Table Name: FreeBoard */
/**********************************/
CREATE TABLE FreeBoard(
		Num INT,
		Title VARCHAR(100) NOT NULL,
		Contents VARCHAR(3000),
		FileName VARCHAR(100),
		HashName VARCHAR(100),
		FileType VARCHAR(10),
		UserID VARCHAR(15) NOT NULL,
		PostDate DATE NOT NULL
);
/**********************************/
/* Table Name: Reply */
/**********************************/
CREATE TABLE Reply(
		Num INT,
		UserID VARCHAR(15) NOT NULL,
		Contents VARCHAR(1000),
		PostDate DATE NOT NULL,
		ReplyNum VARCHAR(10),
		FreeBoardNum INT,
		ServiceBoardNum INT
);
/**********************************/
/* Table Name: Users */
/**********************************/
CREATE TABLE Users(
		ID VARCHAR(15),
		PW VARCHAR(100) NOT NULL,
		Name VARCHAR(20) NOT NULL,
		Email VARCHAR(25) NOT NULL
);

ALTER TABLE Users ADD CONSTRAINT IDX_Users_PK PRIMARY KEY (ID);

ALTER TABLE ServiceBoard ADD CONSTRAINT IDX_ServiceBoard_PK PRIMARY KEY (Num);
ALTER TABLE ServiceBoard ADD CONSTRAINT IDX_ServiceBoard_FK0 FOREIGN KEY (UserID) REFERENCES Users (ID);

ALTER TABLE FreeBoard ADD CONSTRAINT IDX_FreeBoard_PK PRIMARY KEY (Num);
ALTER TABLE FreeBoard ADD CONSTRAINT IDX_FreeBoard_FK0 FOREIGN KEY (UserID) REFERENCES Users (ID);

ALTER TABLE Reply ADD CONSTRAINT IDX_Reply_PK PRIMARY KEY (Num);
ALTER TABLE Reply ADD CONSTRAINT IDX_Reply_FK0 FOREIGN KEY (ServiceBoardNum) REFERENCES ServiceBoard (Num);
ALTER TABLE Reply ADD CONSTRAINT IDX_Reply_FK1 FOREIGN KEY (FreeBoardNum) REFERENCES FreeBoard (Num);
