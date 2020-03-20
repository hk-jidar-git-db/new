--   pest managment software database                                               
--   ------------------------------------------------------------     
--   18-03-2020                                                       
--   eng.abduelhakeem m ajaj              
--   tripoli - libys                                                  
--                                                                    
--   pest database version 1.0.0                                
--   mysql DATABASE                                                   
--                                                                    
--                                                                    
--   --------------------------------------------------------------   
--   host     : localhost                                             
--   port     : 3306                                                  
--   DATABASE : pest_db                              


DROP DATABASE if EXISTS pst ;


CREATE DATABASE if NOT EXISTS pst
    character SET 'utf8'
    collate 'utf8_general_ci';

--  -------------  Secuirty Area --
create table pst.s_users (
        `login` VARCHAR(255) NOT NULL,
        pswd VARCHAR(255) NOT NULL,
        `name` VARCHAR(64),
        email VARCHAR(255),
        active VARCHAR(1),
        activation_code VARCHAR(32),
        priv_admin VARCHAR(1), 
        PRIMARY KEY (`login`)
    );

create table pst.s_logs(
    `login` varchar(225) not null,
    login_time timestamp not null default current_timestamp ,
    ip  varchar(20),
    primary key(`login`,login_time) 
   );

create table pst.s_apps 
    (
        app_name VARCHAR(128) NOT NULL,
        app_type VARCHAR(255),
        `description` VARCHAR(255),
        PRIMARY KEY (app_name)
    );
create table pst.s_apps_desc 
    (
        app_name VARCHAR(128) NOT NULL,
        ar VARCHAR(128) NOT NULL,
        en VARCHAR(128) NOT NULL,
        PRIMARY KEY (app_name)
    );
create table pst.s_groups (
    group_id int(11) NOT NULL AUTO_INCREMENT,
    `description` varchar(255) DEFAULT NULL, 
    email varchar(225),
    PRIMARY KEY (group_id) ,
    UNIQUE KEY description (description)
    );
create table pst.s_users_groups (
        `login` VARCHAR(255) NOT NULL,
        group_id int(11) NOT NULL,
        PRIMARY KEY (login, group_id),
        foreign key (`login`) references s_users (`login`) on delete cascade,
        foreign key (group_id) references s_groups (group_id) on delete cascade
    );
create table pst.s_groups_apps (
        group_id    int(11) NOT NULL,
        app_name    VARCHAR(128) NOT NULL,
        priv_access VARCHAR(1),
        priv_insert VARCHAR(1),
        priv_delete VARCHAR(1),
        priv_update VARCHAR(1),
        priv_export VARCHAR(1),
        priv_print VARCHAR(1),
        PRIMARY KEY (group_id, app_name),
        foreign key (group_id) references s_groups (group_id) on delete cascade,
        foreign key (app_name) references s_apps (app_name) on delete cascade
    );    
-- modified secuerty system
alter table pst.s_users add userphoto longblob,  add issuing_certi VARCHAR(1) default 'N', add control_certi varchar(1) default 'N' ;
alter table pst.s_groups add  issuing_certi VARCHAR(1) default 'N', add control_certi varchar(1) default 'N' ;
--  [----------  End Secuirty Area-----]
create table pst.t_linea 
(
    id tinyint not null auto_increment primary key,
    linea varchar(60),
    visit varchar(28) default '0000000000000000000000000000'
);
create table pst.t_cust
(
    id int auto_increment not null primary key,
    par int not null, -- parent field
    cust_name varchar(225) unique,
    is_active char(1) default '0',
    visit varchar(28) default '0000000000000000000000000000',
    linea tinyint,
    foreign key (par) references pst.t_cust(id)  on update cascade ,
    foreign key (linea) references pst.t_linea(id) on update cascade 
);
create table pst.t_pay
(
    cust int not null primary key,
    pays varchar(12) default '000000000000',
    day varchar(30) default '00000000000000000000000000000',
    foreign key (cust) references pst.t_cust(id) on update cascade 
);
 
create table pst.t_cash
(
    cust int not null,
    cash_date date not null default current_date,
    in_cash decimal(15,3) default 0,
    out_cash decimal(15,3) default 0,
    code varchar(50), -- document number
    cash_check char(1) , -- cash c , check k
    primary key(cust,cash_date),
    foreign key (cust) references pst.t_cust(id) on update cascade
);
create table pst.t_articles
(
    id int not null auto_increment primary key,
    pest varchar(10) default '0000000000', -- flying insect , rodent , crawling insect , tools 
    a_name varchar(225),
    in_list char(1)  -- use in list display or not 
);
create table pst.t_checkpoint
(
    id int not null auto_increment primary key,
    pest char(1), -- for which pest 1:flying insects , 2:rodent ,3:crawling insects ....
    c_type varchar(10) default '0000000000',
    body_code int, -- bait station , trap box ....
    rep_code1 int, -- Replacment code: glue board , blobs....
    rep_code2 int, -- Replacment code: glue board , blobs....
    install_date date ,
    foreign key (rep_code1) references pst.t_articles(id) on update cascade,
    foreign key (rep_code2) references pst.t_articles(id) on update cascade
);

