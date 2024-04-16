CREATE TABLE PROFESSOR (
    PROF_ID     INTEGER     NOT NULL    UNIQUE,
    PROF_FNAME  VARCHAR(35) NOT NULL,
    PROF_LNAME  VARCHAR(35) NOT NULL,
    PRIMARY KEY (PROF_ID));

CREATE TABLE COURSE (
    CRS_NUM     INTEGER     NOT NULL    UNIQUE,
    DEPT        VARCHAR(35) NOT NULL,
    CRS_NAME    VARCHAR(35) NOT NULL,
    SEMESTER    VARCHAR(6)  NOT NULL,
    SCHOOL_YEAR SMALLINT    NOT NULL,
    PROF_ID     INTEGER,
    PRIMARY KEY (CRS_NUM),
    FOREIGN KEY (PROF_ID) REFERENCES PROFESSOR (PROF_ID) ON UPDATE CASCADE);

CREATE TABLE STUDENT (
    STUDENT_ID      INTEGER     NOT NULL   UNIQUE,
    STUDENT_FNAME   VARCHAR(35) NOT NULL,
    STUDENT_LNAME   VARCHAR(35) NOT NULL,
    CRS_NUM         INTEGER,
    PRIMARY KEY (STUDENT_ID),
    FOREIGN KEY (CRS_NUM) REFERENCES COURSE (CRS_NUM) ON UPDATE CASCADE);

CREATE TABLE ENROLLMENT (
    STUDENT_ID  INTEGER,
    CRS_NUM     INTEGER,
    PRIMARY KEY (STUDENT_ID, CRS_NUM),
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID) ON DELETE NO ACTION,
    FOREIGN KEY (CRS_NUM) REFERENCES COURSE (CRS_NUM) ON DELETE NO ACTION);

CREATE TABLE CATEGORY (
    CATEGORY_ID     INTEGER     NOT NULL   UNIQUE,
    CATEGORY_TYPE   VARCHAR(35) NOT NULL,
    CATEGORY_WEIGHT SMALLINT    NOT NULL    CHECK(CATEGORY_WEIGHT <= 100),
    CRS_NUM         INTEGER,
    PRIMARY KEY (CATEGORY_ID),
    FOREIGN KEY (CRS_NUM) REFERENCES COURSE (CRS_NUM) ON UPDATE CASCADE);

CREATE TABLE ASSIGNMENT (
    ASSIGNMENT_ID   INTEGER     NOT NULL   UNIQUE,
    MAX_SCORE       SMALLINT    NOT NULL    DEFAULT 100,
    CATEGORY_ID     INTEGER,
    PRIMARY KEY (ASSIGNMENT_ID),
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID) ON UPDATE CASCADE);

CREATE TABLE GRADE (
    STUDENT_ID      INTEGER,
    ASSIGNMENT_ID   INTEGER,
    SCORE           SMALLINT    NOT NULL,
    PRIMARY KEY (STUDENT_ID, ASSIGNMENT_ID),
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID) ON DELETE NO ACTION,
    FOREIGN KEY (ASSIGNMENT_ID) REFERENCES ASSIGNMENT (ASSIGNMENT_ID) ON DELETE NO ACTION);
GO