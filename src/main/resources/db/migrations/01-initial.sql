CREATE TABLE uzer
(
 login   varchar(50) PRIMARY KEY,
 pwd_hash TEXT,
 pwd_salt TEXT,
 email varchar(50) NOT NULL,
 name    varchar(50) NOT NULL,
 surname varchar(50),
 created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
 tg_id   bigint NOT NULL
);

CREATE TABLE uzer_2_club(
    uzer_login varchar(50) NOT NULL,
    club_name varchar(50) NOT NULL,
    is_blocked BOOLEAN,
    is_root BOOLEAN,
    CONSTRAINT uzer_2_club_pk  PRIMARY KEY (uzer_login, club_name),
    CONSTRAINT uzer_2_club_uzer_fk FOREIGN KEY uzer_login REFERENCES uzer(login),
    CONSTRAINT uzer_2_club_club_fk FOREIGN KEY club_name REFERENCES club(name)
);

CREATE TABLE club
(
    name varchar(50) PRIMARY KEY,
    address TEXT,
    rttf_link TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    created_by TEXT NOT NULL,
    deleted_at TIMESTAMP WITHOUT TIME ZONE,
    deleted_by TEXT
);


CREATE TABLE time_slot
(
 id    int PRIMARY KEY,
 time_start time NOT NULL,
 time_end   time NOT NULL
);

CREATE TABLE table_info
(
 id    int PRIMARY KEY,
 table_name varchar(10),
 is_exists  boolean NOT NULL,
 club_name varchar(50) NOT NULL,
 CONSTRAINT table_info_club_fk FOREIGN KEY club_name REFERENCES club(name)
);

CREATE TABLE orders
(
 id           int NOT NULL,
 table_id   varchar(10) NOT NULL,
 slot_id      int NOT NULL,
 uzer_login        varchar(50),
 ord_date         DATE NOT NULL,
 is_avaliable boolean NOT NULL DEFAULT false,
 CONSTRAINT PK_50 PRIMARY KEY ( id ),
 CONSTRAINT FK_63 FOREIGN KEY ( table_id ) REFERENCES table_info ( id ),
 CONSTRAINT FK_66 FOREIGN KEY ( uzer_login ) REFERENCES uzer ( login ),
 CONSTRAINT FK_74 FOREIGN KEY ( slot_id ) REFERENCES time_slot ( id ),
 CONSTRAINT unq_key (table_id, ord_date, slot_id)
);