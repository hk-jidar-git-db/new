insert into pst.s_users (login,pswd,name,email,active,activation_code,priv_admin,userphoto,issuing_certi,control_certi)
    values  
    ('admin',md5('123'),'Welbie'    ,'hk.jidar@gmail.com'           ,'Y','','Y',null,'N','Y'),
    (   'gm',md5('123'),'Leo'       ,'lsaing6@narod.ru'             ,'Y','','N',null,'N','N'),
    (  'acc',md5('123'),'Leo'       ,'lsaing6@narod.ru'             ,'Y','','N',null,'N','N'),
    ('t_man',md5('123'),'fathi'     ,'fathi@gmail.com'              ,'Y','','N',null,'Y','N'),
    (  'dep',md5('123'),'Leo'       ,'lsaing6@narod.ru'             ,'Y','','N',null,'N','N'),
    ( 'tech',md5('123'),'Leo'       ,'lsaing6@narod.ru'             ,'Y','','N',null,'N','N');

INSERT INTO pst.s_groups (group_id, description,   issuing_certi,email) VALUES
    (1 ,'Administrator'                                , 'Y',"hk.jidar.fdl@gmail.com"),
    (2 ,'General Director'                             , 'Y',"hk.jidar.fdl@gmail.com"),
    (3 ,'Financial and administrative'                 , 'N',"hk.jidar.fdl@gmail.com"),
    (4 ,'Technical Manager'                            , 'N',"hk.jidar.fdl@gmail.com"),
    (5 ,'pest departments'                             , 'N',"hk.jidar.fdl@gmail.com"),
    (6 ,'Technical'                                    , 'N',"hk.jidar.fdl@gmail.com");    

insert into pst.s_users_groups (`login`,group_id)
    values
    ('admin',1),
    (   'gm',2),
    (  'acc',3),
    ('t_man',4),
    (  'dep',5),
    ( 'tech',6);