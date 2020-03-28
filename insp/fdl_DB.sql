

--   start for solusion                                               
--   ------------------------------------------------------------     
--   21-07-2019                                                       
--   eng.abduelhakeem m ajaj  & eng.zakaria joma elshrief             
--   tripoli - libys                                                  
--                                                                    
--   inspection DATABASE version 1.0.0                                
--   mysql DATABASE                                                   
--   developer updates table
--   27-03-10-16AM                                                                 
--   27-03-2020 20:14 PM                                                                
--   --------------------------------------------------------------   
--   host     : localhost                                             
--   port     : 3306                                                  
--   DATABASE : fdl ,fdl_proj , fdl_dlrs                              


DROP DATABASE if EXISTS fdl_dlrs;
DROP DATABASE if EXISTS fdl_proj;
DROP DATABASE if EXISTS fdl;

CREATE DATABASE if NOT EXISTS fdl_dlrs
    character SET 'utf8'
    collate 'utf8_general_ci';

CREATE DATABASE if NOT EXISTS fdl_proj
    character SET 'utf8'
    collate 'utf8_general_ci';

CREATE DATABASE if NOT EXISTS fdl
    character SET 'utf8'
    collate 'utf8_general_ci';

 use fdl;

--   inspections forms to be ues in all the inspections 
create table fdl.t_inspforms (
    formid varchar(225) not null primary key,
    formname varchar(225) unique,
    isactive tinyint
 );
--   countrys table 
create table fdl.h_country (
    cntryid char(2) not null primary key,
    cntryname varchar(225) unique
 );
--   company table
create table fdl.t_company (
    id varchar(225) not null primary key,
    comapnyname varchar(225),
    domain varchar(225), --   company scope of business 
    logo longblob, --   company logo 
    addr varchar(225), --   company adrress 
    tel varchar(225), --   company telephone 
    fax varchar(225), --   company fax 
    mobile varchar(225), --   company mobile 
    web varchar(225), --   company website 
    email varchar(225), --   company email 
    gm varchar(225), --   general manger name 
    ceo varchar(225), --   ceo name 
    contact varchar(225), --   person how to contact 
    crr varchar(225), --   chamber room registration number 
    cr varchar(225), --   commercial register 
    lic varchar(225), --   license number 
    wh varchar(225), --   working hours 
    insu varchar(225), --   insurance number 
    from_email varchar(225), -- from E mail
    from_e_pwd varchar(225) -- from E mail
    stamp longblob -- company stamp image
 );

INSERT  INTO fdl.t_company (id )VALUES( 'AIC');
--   department list for inspector select
create table fdl.h_dep (
  depid char(2) not null primary key, --   mt,fd,md,pd 
  depname varchar(225) unique
 );
--   commodity 
create table fdl.h_commodity (
    comid int auto_increment not null primary key,
    comname varchar(225) unique,
    depid varchar(2),
    foreign key (depid) references fdl.h_dep(depid) on delete cascade on update cascade
 );
--   qualifications list for inspector select
create table fdl.h_quali (
  qualiid int auto_increment not null primary key,
  qualiname varchar(225) unique
 );
--   customers table () 
create table fdl.t_cust (
    custid int auto_increment not null primary key,
    code varchar(20),
    custname varchar(225) unique,
    country char(2),
    cust_address varchar(225),
    web varchar(225),
    tel varchar(15),
    fax varchar(15),
    email varchar(225),
    person varchar(225)
 );


 create table fdl.t_cust_contacts (
     id int auto_increment not null primary key,
     custid int not null,
     person varchar(150),
     pobox varchar(20),
     tel varchar(10),
     mobile varchar(15),
     email varchar(225),
     whatsup varchar(225),
     viber varchar(225),
     mesngr varchar(225),  
     skype varchar(225),   
     foreign key (custid) references fdl.t_cust(custid) on update cascade on delete cascade
 );
create table fdl.t_sup (
    supid int auto_increment not null primary key,
    code varchar(20),
    supname varchar(225) unique,
    sup_address varchar(225),
    country char(2),
    web varchar(225),
    email varchar(225),
    fax varchar(20),
    tel varchar(20) 
 );
 create table fdl.t_sup_contacts (
     id int auto_increment not null primary key,
     supid int not null,
     person varchar(150),
     pobox varchar(20),   
     tel varchar(10),
     mobile varchar(15),
     email varchar(225),
     whatsup varchar(225),
     viber varchar(225),
     mesngr varchar(225),  
     skype varchar(225), 
     foreign key (supid) references fdl.t_sup(supid) on update cascade on delete cascade
 );

--   preplanning items for inspection 
create table fdl.t_insp_sys
    (
        id int auto_increment not null primary key,
        step varchar(150),
        sys_row tinyint,
        col tinyint
    );

insert into fdl.t_insp_sys(id,step,sys_row,col) values 
    (1,'First fax'                          ,1,1),
    (2,'Inspector authorization'            ,1,2),
    (3,'traveling decision'                 ,1,3),
    (4,'Ticket issuing'                     ,1,4),
    (5,'The arrival of the inspector'       ,2,1),
    (6,'Meeting Agenda'                     ,2,2),
    (7,'Declaration of responsibility'      ,2,3),
    (8,'Daily reports'                      ,2,4),
    (9,'Letter of permission'               ,3,1),
    (10,'Shipping survey'                   ,3,2),
    (11,'CERTIFICATE OF FITNESS'            ,3,3),
    (12,'CONTAINER’S INSPECTION REPORT'     ,3,4),
    (13,'Final Report'                      ,4,1),
    (14,'Inspection fees'                   ,4,2),
    (15,'Transference  Inspection docs.'    ,4,3),
    (16,'Receipt of samples'                ,4,4),
    (17,'Hold of inspection'                ,5,1),
    (18,'Issuing certificate'               ,5,2);

 




create table fdl.t_p_sect (
    sec_id tinyint auto_increment not null primary key,
    sec_descrip varchar(225),
    sec_status tinyint
 );

create table fdl.t_p_items (
    item_id tinyint auto_increment not null primary key,
    sec_id tinyint,
    item_name varchar(225),
    item_status tinyint,
    foreign key (sec_id) references fdl.t_p_sect(sec_id) on update cascade on delete cascade
 );

--   inspector's table 
create table fdl.t_insp (
  inspid int auto_increment not null primary key,
  insp_type char(1), --   p = personal , s = subcontract 
  first_name varchar(20),
  mid_name varchar(20),
  last_name varchar(20),
  passport varchar(225),
  idcard varchar(225),
  country char(2),
  depid varchar(2) not null, --   department of inspector
  qualiid int not null, --   qualifications
  fld_exp tinyint, --   field experiance
  insp_exp tinyint, --   experince in the inspections
  contid varchar(225), --   contract number
  mobile varchar(225), --   mobile number
  email varchar(225), --   inspector email
  fax varchar(225),
  phone varchar(225),
  donor varchar(225), --   donor 
  graddate date, --   graduate date
  crdate date, --   created date
  isactive char(1) default 'Y',  --   is inspector still avtive  Y= active
  inspphoto longblob ,--   inspectore personal photo 
  loginname varchar(225) unique not null,
  loginpassword varchar(225),
  issuing_certi varchar(1),
  foreign key (depid) references h_dep(depid) on update cascade on delete cascade,
  foreign key (qualiid) references h_quali(qualiid) on update cascade on delete cascade,
  foreign key (country) references h_country(cntryid) on update cascade on delete cascade
 );

--   mainprojects 
create table fdl.t_mproj (
    mprjid int auto_increment not null primary key,
    code varchar(225) UNIQUE,
    depid varchar(2) not null,
    projname varchar(225),
    lcreditno varchar(225), --   letter of credit no 
    subjpurchorderno varchar(225), --   subject of purchase order number 
    ms varchar(225),   --     made to your favor by :m/s 
    totalaccred decimal(15,3), --   the total value of the accreditation 
    commodity varchar(225) not null, --   commodity 
    qyagrosswt int, --   quantity: gross weight  
    qyanetwt int, --   quantity: net weight 
    custid int not null, --   open by a party 
    foreign key (custid) references t_cust(custid) on update cascade on delete cascade,
    foreign key (depid) references fdl.h_dep(depid) on update cascade on delete cascade
 );

--   projects
create table fdl.t_proj (
    steps varchar(20) default '000000000000000' , -- STEPS#=15 -> firstFax|assign|approve by GM|Approve by Techic|ticket|arrival|meeting|declaration|daily|letter|shiping|fitnes|cont|f_rep|fee|docs|Samples|certification
    -- STEPS : 1:DONE , 0:FINISH
    approv_hold varchar(3) default '000', -- dep = 100 , thec = 110 , gm= 111
    projid int auto_increment not null primary key,
    code varchar(225) UNIQUE,
    projname varchar(225),
    shipmentno varchar(225), --   shipment number 
    shipmentvalue decimal(10,3), --   the shimpment price 
    currency varchar(3), -- currency
    supid int not null, --   for a company 
    commodity int not null, --   commodity 
    vesselsname varchar(225), --   vessels name 
    cntryid char(2) not null, --   national  
    town varchar(225),
    origin_goods char(2) not null, --  origin of goods
    place_insp char(2), --   place of inspection
    insp_date date,  -- inspection date 
    portdispach varchar(225), --    port of dispatch/loadin 
    portdischarge varchar(225), --   port of discharge 
    loadfromdate date, --   loading date: from 
    loadtodate date, --   loading date: to 
    qyagrosswt decimal(15,3), --   quantity: gross weight  
    qyanetwt decimal(15,3), --   quantity: net weight 
    totalaccred decimal(15,3), --   the total value of the accreditation 
    mprojid int not null,
    bill_loading_no varchar(225), --  bill of loadin no.
    bill_loading_date date,
    invoice_no varchar(225),
    invoice_date date,
    total_packing varchar(225),
    l_c_nr  varchar(225),
    pro_inv_no varchar(225),
    pro_inv_date date,
    isactive tinyint default 1, -- active = 1 , not active=0
    conclusion longtext ,
    is_f_fax_ok tinyint , -- is first fax send it 0= No 1 = Yes 
    is_insp_ticket varchar(1) default 'N' , -- N: nothing to do W:wait for ticket F:Finish job
    fee decimal(15,3), -- the fee sendit
    is_send_frep varchar(1) default 'N', -- Y = sendeit is the final report was send it
    trans_docs varchar(5) default '00000', -- insp|dep|tech|ACC|GM 
    issuing_approv varchar(5) default '00000', -- insp|dep|tech|ACC|GM
    foreign key (commodity) references h_commodity(comid) on update cascade,
    foreign key (supid) references t_sup(supid) on update cascade on delete cascade,
    foreign key (cntryid) references h_country(cntryid) on update cascade on delete cascade,
    foreign key (origin_goods) references h_country(cntryid) on update cascade on delete cascade,
    foreign key (mprojid) references t_mproj(mprjid) on update cascade on delete cascade
 );

--   evaluation of the operations of the inspector 
create table fdl.t_inspprocass(
    hold_insp  tinyint default 0 , -- 1 = Hold of inspection 
    confirmed tinyint default 0 , -- 1 = confirmed , 0=not confirmed
    user_ins varchar(225) , -- the department manger name how inserted
    procdate date not null,
    insp_type char(1), --   p = personal , s = subcontract 
    is_boss char(1),
    projid int not null,
    whysub  tinyint, --   the necessity that necessitates a company to inspect the subsoil is: 
    inspid int not null, --   inspectore 
    condation tinyint,--   commitment to contractual terms 
    implimint tinyint,--   commitment to process implementation 
    timeing tinyint,--   commitment to execution time 
    cooperation tinyint,--   cooperation with others 
    overall tinyint, --   overall assessment 
    perioddays tinyint, -- how long stay
    localprice decimal(10,3), -- local price
    externelprice decimal(10,3), -- external price
    remarks varchar(225),
    approved varchar(2) default '00' not null, -- '10' approve by thechnical manager , '11' approve by general manager
    -- ARRIVAL OF INSPECTOR
    arrive_date date, -- arriveing date 
    startdate date, -- after arriveing starting date
    -- MEETING OF AGENDA 
  --  meeting varchar(9) default '000000000' , -- Y,N Meeting Agenda
  --  program_dates longtext, -- The program of inspection agreed 
    -- DECLARATION OF RESPONABILITY AND INSPECTION FEES
  --  declared varchar(225), -- on behalf declaration
    -- LETTER OF PERMISSION
  --  m_v varchar(100), -- The master of M/V 
  --  bert_port varchar(100), -- Berthing Port
  --  lett_date date, -- Date
    -- Certificate of fitness 
   -- cert_no varchar(20), -- certification number
   -- vessel_owner varchar(100), -- vessel owner
   -- call_sign varchar(100), -- names use by the vessel internally
   -- flag varchar(100), -- the vessel flag 
   -- loading_port varchar(100), -- Loading port
   -- imo_no varchar(10), -- vessel number
    -- CONTAINER’S INSPECTION REPORT
   -- cont_no tinyint, -- Nº of containers inspected
   -- cont_type varchar(50),-- Type of containers: - 20ft / 40ft / Reefer cont. / Open top …etc
   -- cont_rej tinyint,-- Nº of container rejected
   -- rej_reas varchar(225),-- Reasons
   -- cont_action varchar(225),-- Action Taken
   -- cont_status varchar(6) default '000000', -- Containers Status	Door	Locks	Ceiling	Walls	Floors	Ventilators
    -- FINAL INSPECTION REPORT
    -- 1-VISUAL INSPECTION
   -- ssc varchar(225), -- Supplier’s storing conditions
   -- ma varchar(225), -- Material appearance
   -- pq varchar(225),-- Packaging quality
   -- cc varchar(225),-- Containers condition
   -- sample_standard varchar(225),-- Sample taken according the standards
    primary key (projid,inspid),
    foreign key (inspid) references t_insp(inspid) on update cascade on delete cascade,
    foreign key (projid) references t_proj(projid) on update cascade on delete cascade
 );
-- SAMPLES VERIFIED, ANALYSED AND TESTED
-- The sample could be, raw material, finished product, , document, record, drawing, And/or etc.
create table fdl.t_samples
    (
        id varchar(20) not null,
        sn tinyint not null,
        comid int, -- commidty
        qya  int , -- quantity of samples
        inspid int, -- inspector name
        projid int, -- l/c no.
        temp varchar(5), -- condation temp.
        humm varchar(5), -- condation hummidity
        light varchar(5), -- condation light
        place varchar(100), -- place of sample,
        primary key(id,sn),
        foreign key (comid) references h_commodity(comid),
        foreign key (inspid) references t_insp(inspid),
        foreign key (projid) references t_proj(projid)
    );

--   table of containers
create table fdl.t_cont
    (
        sn tinyint not null,
        projid int not null,
        cont_no varchar(3),
        seal_no varchar(3),
        remarks varchar(225),
        primary key(sn,projid),
        foreign key (projid) references fdl.t_proj(projid)
    );
--   inspectore planning 
create table fdl.t_inspplann (
    chk tinyint , --   checkbox 0= false ; 1=true 
    projid int not null,
    planid tinyint not null,
    sdate datetime,
    edate datetime,
    dsdate datetime,
    dedate datetime,
    remarks text,
    approved tinyint DEFAULT 0,
    primary key (projid,planid),
     foreign key (projid) references t_proj(projid) on update cascade on delete cascade,
    foreign key (planid) references t_p_items(item_id) on update cascade on delete cascade
 );

--   [  Document tables  ] 
--   company docs 
create table fdl.t_companydocs (
    id int not null auto_increment primary key,
    doc_type tinyint,
    companyid varchar(225) not null,
    docname varchar(225),
    copyfile longblob ,
    foreign key (companyid) references t_company(id) on update cascade on delete cascade
 );

--   [ New Document tables  ] 
--   documents table 
create table fdl.t_inspformdocs (
    id int auto_increment not null primary key,
    formid varchar(225) not null,
    docname varchar(225) ,
    copyfile longblob,
    foreign key (formid) references t_inspforms(formid) on update cascade on delete cascade
 );
--   inspection doc 
create table fdl.t_inspdocs (
        id int auto_increment not null primary key,
        inspid int not null,
        docname varchar(225),
        copyfile longblob ,
        foreign key (inspid) references t_insp(inspid)  on update cascade  on delete cascade
    );

create table fdl.t_certi (
    id                  int  ,
    projid              int not null primary key,
    code                varchar(225),
    fdl_code            varchar(225), 
    create_date         timestamp,
    created_user        varchar(225),
    is_insp             tinyint default 0,
    print_user          varchar(225),
    col01               varchar(225), -- Description of goods:   
    col02               varchar(225), -- Beneficiary:
    col03               varchar(225), -- Applicant:
    col04               varchar(225), -- Origin of goods:
    col05               varchar(225), -- L/c nr
    col06               varchar(225), -- Place of inspection:
    col07               varchar(225), -- Port of discharge:
    col08               varchar(225), -- Bill of lading no:
    col09               varchar(225), -- Vessel name:
    col10               varchar(225), -- Invoice no:
    col11               varchar(225), -- Total packing:
    col12               varchar(225), -- Net weight:
    col13               varchar(225), -- Gross weight:
    col14               varchar(225), -- Total amount:
    col15               varchar(225), -- CONCLUSION:
    inspection_date     date, 
    bill_loading_date   date,
    invoice_date        date,
    row01               tinyint default 0,
    row02               tinyint default 0,
    row03               tinyint default 0,
    row04               tinyint default 0,
    row05               tinyint default 0,
    row06               tinyint default 0,
    row07               tinyint default 0,
    row08               tinyint default 0,
    row09               tinyint default 0,
    row10               tinyint default 0,
    row11               tinyint default 0,
    row12               tinyint default 0,
    row13               tinyint default 0,
    row14               tinyint default 0,
    row15               tinyint default 0,
    qr                  tinyint default 1,
    paper               varchar(1) default 'R', -- [R]eady,[E]mpty,[T]est
    lock_admin          tinyint default 0,
    foreign key (projid) references t_proj(projid) 
    on update cascade 
    on delete cascade
 );

create table fdl.t_ticket 
    (
        arrival  char(2),  
        departure char(2),  
        sugest_date date, 
        find_date  date, 
        arrival1  char(2),   
        departure1 char(2),  
        tranporter varchar(225), 
        seats_level varchar(1), 
        inspid int not null,
        projid int not null,
        primary key (projid,inspid),
        foreign key (arrival)   references fdl.h_country (cntryid) on update cascade  ,
        foreign key (departure) references fdl.h_country (cntryid) on update cascade  ,
        foreign key (arrival1)   references fdl.h_country (cntryid) on update cascade  ,
        foreign key (departure1) references fdl.h_country (cntryid) on update cascade  ,
        foreign key (inspid)    references fdl.t_insp (inspid)     on update cascade  ,
        foreign key (projid)    references fdl.t_proj (projid)     on update cascade  
    );
create table fdl.t_daily_report
    (
        inspid int not null,
        projid int not null,
        depid varchar(2),
        hotel_tel varchar(20),
        hotel_fax varchar(20),
        room_no varchar(20),
        rep_date date,
        report longtext,
        photo longblob,
        foreign key (inspid) references t_insp(inspid),
        foreign key (projid) references t_proj(projid),
        primary key(inspid,projid)
    );
--      
create table fdl.t_ship_survey -- SHIPPING SURVEY
    (
        projid int not null primary key,
        -- 1-	Ships specification
        vessel_type varchar(225), -- Vessel type
        call_sign varchar(225), -- Call sign
        loading_port varchar(225), -- Loading port
        loading_rate varchar(225), -- Loading rate
        Date_place_built varchar(225), -- Date& place of  built	
        imo_no varchar(225),	 -- IMO No	
        loading_date date,-- Loading date	Fm...  .. .. hr to ….hr
        discharging_rate varchar(10), -- Discharging rate	
        -- 2- Shipment details:-
        owner_style varchar(225),-- Owner / charter full style
        loading_style varchar(225),-- Loading port shipping agent full style
        Discharging_style varchar(225),-- Discharging port shipping agent full style
        Stevedoring varchar(225),-- Stevedoring obligation
        Supplying varchar(225),-- Supplying limits  : (Direct shipment – Partial shipment – Transit shipment )
        -- 3-	Cargo information:-
        Cargo_type varchar(225), -- Cargo type 
        pallets tinyint,-- No. of pallets, containers, Drums, etc.
        p_measur varchar(225),-- Measurement of each
        p_weight varchar(225),-- Weight of each
        p_total_m varchar(225),-- Total measurement
        p_total_w varchar(225),-- Total weight
        p_remark varchar(225),-- Packing remarks requested by consignee
        -- Stowing limits (On Deck –Under Deck –One/Two Tiers)
        -- 4 – Documentation:-
        -- L/C
        -- B/L
        foreign key (projid) references t_proj(projid)                                                                     


    );


--  -------------  Secuirty Area --
create table fdl.s_users (
        `login` VARCHAR(255) NOT NULL,
        pswd VARCHAR(255) NOT NULL,
        `name` VARCHAR(64),
        email VARCHAR(255),
        active VARCHAR(1),
        activation_code VARCHAR(32),
        priv_admin VARCHAR(1), 

        PRIMARY KEY (`login`)
    );

create table fdl.s_logs(
    `login` varchar(225) not null,
    login_time timestamp not null default current_timestamp ,
    ip  varchar(20),
    primary key(`login`,login_time) 
   );
create table fdl.s_apps_sec
    (
        id tinyint not null primary key auto_increment,
        section varchar(225)
    );
create table fdl.s_apps 
    (
        app_name VARCHAR(128) NOT NULL,
        app_type VARCHAR(255),
        `description` VARCHAR(255),
        PRIMARY KEY (app_name)
    );
create table fdl.s_apps_desc 
    (
        app_name VARCHAR(128) NOT NULL,
        ar VARCHAR(128) NOT NULL,
        en VARCHAR(128) NOT NULL,
        PRIMARY KEY (app_name)
    );
create table fdl.s_groups (
    group_id int(11) NOT NULL AUTO_INCREMENT,
    `description` varchar(255) DEFAULT NULL, 
    PRIMARY KEY (group_id) ,
    UNIQUE KEY description (description)
    );
create table fdl.s_users_groups (
        `login` VARCHAR(255) NOT NULL,
        group_id int(11) NOT NULL,
        PRIMARY KEY (login, group_id),
        foreign key (`login`) references s_users (`login`) on delete cascade,
        foreign key (group_id) references s_groups (group_id) on delete cascade
    );
create table fdl.s_groups_apps (
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
alter table fdl.s_users add userphoto longblob, add inspid int, add issuing_certi VARCHAR(1) default 'N', add control_certi varchar(1) default 'N' ;
alter table fdl.s_apps add section tinyint ;
alter table fdl.s_groups 
    add  issuing_certi VARCHAR(1) default 'N', 
    add control_certi varchar(1) default 'N' , 
    add signat longblob , 
    add email varchar(225),
    add arab_des varchar(225);
create table fdl.s_users_dep (
        `login` VARCHAR(255) NOT NULL,
        depid varchar(2) NOT NULL,
        PRIMARY KEY (login, depid),
         foreign key (`login`) references s_users (`login`) on delete cascade,
         foreign key (depid) references fdl.h_dep (depid) on delete cascade
    );


create table fdl.s_steps
    (
        id int not null auto_increment primary key,
        act varchar(50),
        txt varchar(100),
        txt1 varchar(100),
        grp tinyint
    );

--  [----------  End Secuirty Area-----]
--
--    [ CREATE VIEW ] ---- 
create view v_login AS
    SELECT  
            priv_admin						, --  0
            active    						, --  1  
            name							, --  2  
            email							, --  3 
            userphoto		AS photo		, --  4 
            issuing_certi					, --  5 
            control_certi					, --  6 
            "tech" 			AS speciality	, --  7   
            null   			AS inspid  		,  --  8
            login                           ,
            pswd            
    FROM    fdl.s_users 	
    UNION
    SELECT  "N"				AS priv_admin	, --  0													
            isactive 		AS active 		, --  1
            concat(first_name,' ',mid_name,' ',last_name) 		AS fullname		, --  2  
            email							, --  3 
            inspphoto 		AS photo		, --  4 
            issuing_certi					, --  5 
            "N"				AS control_certi, --  6 
            "insp" 			AS speciality	, --  7 
            inspid			  	  			, --  8
            loginname       AS login        , -- 9
            loginpassword   AS pswd	        	 						
    FROM    fdl.t_insp ;

create view v_proj as
        (
            SELECT 
            m.mprjid,
                m.custid ,
                m.code as mproj_code,
                m.depid,
                m.projname as mproj_name,
                m.lcreditno,
                m.subjpurchorderno,
                m.ms,
                m.totalaccred,
                m.qyagrosswt,
                m.qyanetwt,
            p.steps,
                p.approv_hold ,
                p.projid ,
                p.code as proj_cod ,
                p.projname ,
                p.shipmentno ,
                p.shipmentvalue ,
                p.currency ,
                p.supid ,
                p.commodity ,
                p.vesselsname ,
                p.cntryid ,
                p.town ,
                p.origin_goods ,
                p.place_insp ,
                p.insp_date ,
                p.portdispach ,
                p.portdischarge ,
                p.loadfromdate ,
                p.loadtodate ,
                p.qyagrosswt as p_qyagrosswt ,
                p.qyanetwt as p_qyanetwt, 
                p.totalaccred as p_totalaccred, 
                p.mprojid ,
                p.bill_loading_no ,
                p.bill_loading_date ,
                p.invoice_no ,
                p.invoice_date ,
                p.total_packing ,
                p.l_c_nr ,
                p.pro_inv_no ,
                p.pro_inv_date ,
                p.isactive as proj_is_active ,
                p.conclusion  ,
                p.is_insp_ticket ,
                p.fee ,
                p.is_send_frep ,
                p.issuing_approv, 
            ss.hold_insp, 
                ss.confirmed, 
                ss.procdate,
                ss.startdate, 
                ss.insp_type as subcont_or_person , 
                ss.is_boss, 
                ss.whysub, 
                ss.condation, 
                ss.implimint, 
                ss.timeing, 
                ss.cooperation, 
                ss.overall, 
                ss.perioddays, 
                ss.localprice, 
                ss.externelprice, 
                ss.remarks,
                ss.approved,
                ss.user_ins,
            i.inspid, 
                i.insp_type, 
                i.first_name, 
                i.mid_name, 
                i.last_name, 
                i.passport, 
                i.idcard, 
                i.country   as insp_country, 
                i.depid     as insp_dep, 
                i.qualiid, 
                i.fld_exp, 
                i.insp_exp, 
                i.contid, 
                i.mobile    as insp_mobile, 
                i.email     as insp_email, 
                i.fax       as insp_fax, 
                i.phone     as insp_phone, 
                i.donor, 
                i.graddate, 
                i.crdate, 
                i.isactive as insp_is_active, 
                i.inspphoto, 
                i.loginname, 
                i.loginpassword, 
                i.issuing_certi 
            from fdl.t_mproj m
            left join fdl.t_proj p
            on p.mprojid = m.mprjid
            left join fdl.t_inspprocass ss
            on ss.projid = p.projid
            and p.isactive = 1
            and ss.is_boss = 'Y'
            left join fdl.t_insp i
            on i.inspid = ss.inspid
        );
 --    [ END CREAT VIEW ] ---

-- -------------- triggers -------
create  trigger fdl.processplan
    after insert on t_proj for each row 
    begin
        -- this fill complete plann for new process
        declare chk int ;
        
        set @chk = (select count(*)    from fdl.t_inspplann p where p.projid = new.projid);       
        
        if (@chk = 0) then
        insert into t_inspplann(chk ,projid,planid,approved) select 0, new.projid ,item_id,item_status from fdl.t_p_items ;
        end if; 
        
    end;

create trigger fdl.set_is_boss
    before insert on t_inspprocass for each row 
    BEGIN
        declare boss int ;
    
        set @boss = (select count(*) from fdl.t_inspprocass where projid = new.projid);       
        
        if (@boss > 0) then
        set new.is_boss = "N";
        else
        set new.is_boss = "Y";
        end if; 
        
    end;

create trigger fdl.set_app_to_each_group
    after insert on s_groups for each row 
    BEGIN
        declare bool char(1) ;

        if(new.group_id = 1) then
            set @bool = 'Y' ;
        else
            set @bool = 'N' ;
        end if;


        INSERT INTO s_groups_apps(group_id, app_name, priv_access, priv_insert, priv_delete, priv_update, priv_export, priv_print) 
        SELECT new.group_id , app_name,@bool,@bool,@bool,@bool,@bool,@bool  FROM s_apps ;
        
    end;

create trigger fdl.unique_login_users before insert on fdl.s_users
    for each row begin
    declare c int;
    select count(*) into c from fdl.t_insp where loginname = new.`login`;
    if (c > 0) then
        -- abort insert, because bar.username should be not null
        set new.`login` = null;
    end if;
    end;

create trigger fdl.unique_login_insp before insert on fdl.t_insp
    for each row begin
    declare c int;
    select count(*) into c from fdl.s_users where `login` = new.loginname;
    if (c > 0) then
        -- abort insert, because bar.username should be not null
        set new.loginname = null;
    end if;
    end;

create trigger fdl.groups_prevent_from_deletion before delete on s_groups for each row
    begin
        if old.group_id < 11 then -- will only abort deletion for specified ids
            signal sqlstate '45000' -- "unhandled user-defined exception"
            -- here comes your custom error message that will be returned by mysql
            set message_text = 'this record is sacred! you are not allowed to remove it!!';
        end if;
    end;
create trigger fdl.sn_containers before insert on fdl.t_cont for each row
    begin
        declare id tinyint ;
        select count(*) into id from fdl.t_cont where projid = new.projid;
        set new.sn = id + 1 ;
    end;
create trigger fdl.smapl_id before insert on fdl.t_samples for each row
 begin
   declare company varchar(5);
   declare insp varchar(100);
   declare dep varchar(3);
   declare sn tinyint;
   select id into company from t_company limit 1;
   select concat(substring(first_name,1,1),substring(mid_name,1,1),substring(last_name,1,1)) into insp from t_insp where inspid = new.inspid ;
   select depid into dep from t_insp where inspid = new.inspid ; 
   select count(*) into sn from t_samples where projid = new.projid ;
    
    set new.id = concat(company,':',cast(insp as varchar(5)),dep ,substring(YEAR(CURDATE()),3),cast(new.projid as varchar(5))) ;
    set new.sn = sn+1 ;
 end;

create trigger fdl.set_depid_i before insert  on fdl.t_daily_report for each row
    begin
      declare dep varchar(2);
      select depid into dep from fdl.t_insp where inspid = new.inspid ;
      set new.depid = dep ;
    end;
create trigger fdl.set_depid_u before update  on fdl.t_daily_report for each row
    begin
        declare dep varchar(2);
        select depid into dep from fdl.t_insp where inspid = new.inspid ;
        set new.depid = dep ;
    end;
create trigger fdl.set_steps after update on fdl.t_inspprocass for each row
    begin
       declare txt varchar(20) ;
        select steps into txt from fdl.t_proj where projid = new.projid ;
        IF (new.approved = '10') then
             -- |1-fax | 2-assign|3-approv tech|4-approve gm|
            set txt = concat(substring(txt,1,2) , '1',substring(txt,4)) ;
            update fdl.t_proj set steps = txt where projid = new.projid ;
        ELSEIF (new.approved = '11') then 
            set txt = concat(substring(txt,1,3) , '1',substring(txt,5)) ;
            update fdl.t_proj set steps = txt where projid = new.projid ;
        END IF;
    end;


--      end triggers

--    [ Stored proceduers ] --
 

-- [ End stored procedures]



use fdl_proj;
--   projects documents
create table  fdl_proj.t_projdoc 
    (
        id integer not null auto_increment primary key,
        projid int not null,
        caption varchar(45),
        section varchar(1), -- S= for Samples , P= for project document
        img_type varchar(1), -- P photo , D doc
        img longblob,
        planid integer, 
        foreign key (projid) references fdl.t_proj(projid) on update cascade on delete cascade
    );

use fdl_dlrs;
--   cust doc 
create table fdl_proj.t_custdocs (
        id int auto_increment not null primary key,
        custid int not null,
        docname varchar(225),
        copyfile  longblob,
        foreign key (custid) references fdl.t_cust(custid) on update cascade on delete cascade
    );

--   supplier doc 
create table fdl_proj.t_supdocs (
        id int auto_increment not null primary key,
        supid int not null,
        docname varchar(225),
        copyfile  longblob ,
        foreign key (supid) references fdl.t_sup(supid) on update cascade on delete cascade
    );


   
