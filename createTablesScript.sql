CREATE TABLE "user"
(
 login   varchar(50) NOT NULL,
 name    varchar(50) NOT NULL,
 surname varchar(50) NOT NULL,
 tg_id   bigint NOT NULL,
 CONSTRAINT PK_41 PRIMARY KEY ( login )
);


CREATE TABLE time_slot
(
 slot_id    int NOT NULL,
 time_start time NOT NULL,
 time_end   time NOT NULL,
 CONSTRAINT PK_71 PRIMARY KEY ( slot_id )
);

CREATE TABLE table_info
(
 "table_name" varchar(10) NOT NULL,
 is_exists  boolean NOT NULL,
 CONSTRAINT PK_37 PRIMARY KEY ( "table_name" )
);

CREATE TABLE orders
(
 "id"           int NOT NULL,
 "table_name"   varchar(10) NOT NULL,
 slot_id      int NOT NULL,
 login        varchar(50) NOT NULL,
 "date"         date NOT NULL,
 is_avaliable boolean NOT NULL,
 CONSTRAINT PK_50 PRIMARY KEY ( "id" ),
 CONSTRAINT FK_63 FOREIGN KEY ( "table_name" ) REFERENCES table_info ( "table_name" ),
 CONSTRAINT FK_66 FOREIGN KEY ( login ) REFERENCES "user" ( login ),
 CONSTRAINT FK_74 FOREIGN KEY ( slot_id ) REFERENCES time_slot ( slot_id )
);


CREATE INDEX FK_65 ON orders
(
 "table_name"
);

CREATE INDEX FK_68 ON orders
(
 login
);

CREATE INDEX FK_76 ON orders
(
 slot_id
);
