    /* project doc */

/*        [  docs data  ]           */
UPDATE 
    s_groups_apps 
SET 
    priv_access =   'N',
    priv_insert =   'N',
    priv_delete =   'N',
    priv_update =   'N',
    priv_export =   'N',
    priv_print  =   'N' ;

UPDATE 
    s_groups_apps 
SET 
    priv_access =   'Y',
    priv_insert =   'Y',
    priv_delete =   'Y',
    priv_update =   'Y',
    priv_export =   'Y',
    priv_print  =   'Y' ;
WHERE 
    group_id = 1 ;