﻿CREATE TABLE Users (
    ID             INTEGER       PRIMARY KEY	Auto_increment,
    UserName       NVARCHAR (16) NOT NULL,
    Password       VARCHAR (50)  NOT NULL,
    PassSalt       VARCHAR (50)  NOT NULL,
    DisplayName    VARCHAR (50)  NOT NULL,
    RegisterTime   DATETIME      NOT NULL,
    ApprovedTime   DATETIME,
    ApprovedBy     VARCHAR (50),
    Description    VARCHAR (500) NOT NULL,
    RejectedBy     VARCHAR (50),
    RejectedTime   DATETIME,
    RejectedReason VARCHAR (50),
    Icon           VARCHAR (50),
    Css            VARCHAR (50),
	App			   VARCHAR (50)
);

CREATE TABLE UserRole (
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	UserID 			INT NOT NULL,
	RoleID 			INT NOT NULL
);

CREATE TABLE UserGroup(
	ID   			INTEGER PRIMARY KEY	Auto_increment,
	UserID 			INT NOT NULL,
	GroupID 		INT NOT NULL
);

CREATE TABLE Roles(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	RoleName 		VARCHAR (50) NOT NULL,
	Description 	VARCHAR (500) NULL
);

CREATE TABLE RoleGroup(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	RoleID 			INT NOT NULL,
	GroupID 		INT NOT NULL
);

CREATE TABLE RoleApp(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	AppID 			VARCHAR (500) NOT NULL,
	RoleID 			INT NOT NULL
);

CREATE TABLE Notifications(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	Category 		VARCHAR (50) NOT NULL,
	Title 			VARCHAR (50) NOT NULL,
	Content 		VARCHAR (50) NOT NULL,
	RegisterTime 	DATETIME NOT NULL,
	ProcessTime 	DATETIME NULL,
	ProcessBy 		VARCHAR (50) NULL,
	ProcessResult 	VARCHAR (50) NULL,
	Status 			VARCHAR (50) DEFAULT 0
);

CREATE TABLE Navigations(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	ParentId 		INT DEFAULT 0,
	Name 			VARCHAR (50) NOT NULL,
	`Order` 		INT NOT NULL DEFAULT 0,
	Icon 			VARCHAR (50) DEFAULT 'fa fa-fa',
	Url 			VARCHAR (4000) NULL,
	Category 		VARCHAR (50) DEFAULT 0,
	Target 			VARCHAR (10) DEFAULT '_self',
	IsResource 		INT DEFAULT 0,
	Application 	VARCHAR (200) DEFAULT 0
);

CREATE TABLE NavigationRole(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	NavigationID 	INT NOT NULL,
	RoleID 			INT NOT NULL
);

CREATE TABLE Logs(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	CRUD 			VARCHAR (50) NOT NULL,
	UserName 		VARCHAR (50) NOT NULL,
	LogTime			DATETIME NOT NULL,
	Ip				VARCHAR (15) NOT NULL,
	Browser			VARCHAR (50) NULL,
	OS				VARCHAR (50) NULL,
	City			VARCHAR (50) NULL,
	RequestUrl		VARCHAR (500) NOT NULL,
	RequestData		MEDIUMTEXT NULL,
	UserAgent		VARCHAR (2000) NULL
);

CREATE TABLE `Groups`(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
    GroupCode       VARCHAR (50) NOT NULL,
	GroupName 		VARCHAR (50) NOT NULL,
	Description 	VARCHAR (500) NULL
);

CREATE TABLE Exceptions(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	AppDomainName 	VARCHAR (50) NOT NULL,
	ErrorPage 		VARCHAR (50) NOT NULL,
	UserID 			VARCHAR (50) NULL,
	UserIp 			VARCHAR (15) NULL,
	ExceptionType 	TEXT NOT NULL,
	Message 		TEXT NOT NULL,
	StackTrace 		TEXT NULL,
	LogTime 		DATETIME NOT NULL,
	Category		VARCHAR (50) NULL
);

CREATE TABLE Dicts(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	Category 		VARCHAR (50) NOT NULL,
	Name 			VARCHAR (50) NOT NULL,
	Code 			VARCHAR (2000) NOT NULL,
	Define 			INT NOT NULL DEFAULT 1
);

CREATE TABLE Messages(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	Title 			VARCHAR (50) NOT NULL,
	Content 		VARCHAR (500) NOT NULL,
	`From` 			VARCHAR (50) NOT NULL,
	`To` 			VARCHAR (50) NOT NULL,
	SendTime 		DATETIME NOT NULL,
	Status 			VARCHAR (50) NOT NULL,
	Flag 			INT DEFAULT 0,
	IsDelete 		INT DEFAULT 0,
	Label 			VARCHAR (50)
);

CREATE TABLE Tasks(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	TaskName 		VARCHAR (500) NOT NULL,
	AssignName 		VARCHAR (50) NOT NULL,
	UserName 		VARCHAR (50) NOT NULL,
	TaskTime 		INT NOT NULL,
	TaskProgress 	INT NOT NULL,
	AssignTime 		DATETIME NOT NULL
);

CREATE TABLE RejectUsers(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	UserName 		VARCHAR (50) NOT NULL,
	DisplayName 	VARCHAR (50) NOT NULL,
	RegisterTime 	DATETIME NOT NULL,
	RejectedBy		VARCHAR (50) NOT NULL,
	RejectedTime	DATETIME NOT NULL,
	RejectedReason 	VARCHAR (50) NULL
);

CREATE TABLE LoginLogs(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	UserName 		VARCHAR (50) NOT NULL,
	LoginTime 	    DATETIME NOT NULL,
	Ip 	            VARCHAR (15) NOT NULL,
	OS		        VARCHAR (50) NULL,
	Browser	        VARCHAR (50) NULL,
	City 	        VARCHAR (50) NULL,
	Result 	        VARCHAR (50) NOT NULL,
	UserAgent		VARCHAR (2000) NULL
);

CREATE TABLE ResetUsers(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
	UserName 		VARCHAR (50) NOT NULL,
	DisplayName 	VARCHAR (50) NOT NULL,
	Reason			VARCHAR (500) NOT NULL,
	ResetTime		DATETIME NOT NULL
);

CREATE TABLE Traces(
	ID 				INTEGER PRIMARY KEY	Auto_increment,
    UserName   		VARCHAR (50)  NOT NULL,
    LogTime    		DATETIME      NOT NULL,
    IP         		VARCHAR (15)  NOT NULL,
    Browser    		VARCHAR (50),
    OS         		VARCHAR (50),
    City       		VARCHAR (50),
    RequestUrl 		VARCHAR (500) NOT NULL,
	UserAgent		VARCHAR (2000) NULL
);

CREATE TABLE DBLogs (
    ID              INTEGER PRIMARY KEY	Auto_increment,
    UserName        VARCHAR (50)    NULL,
    `SQL`           VARCHAR (2000)  NOT NULL,
    LogTime         DATETIME        NOT NULL
);