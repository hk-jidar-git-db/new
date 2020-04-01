<?php

 
$user_grp 	= $_SESSION['s']['login_grp_id'] ;		
$role_grp = $_SESSION['steps'][$id] ;	
$id_txt = "Id".$id;
$app = "" ;
$par = "";
$app_arr = array
( 
    1=> "c_send_message,proj_id=$projid",
    2=>"g_select_insp,proj=$projid",
    3=>"g_select_insp,proj=$projid;no_new='Yes'",
    4=>"g_select_insp,proj=$projid;no_new='Yes'",
    4=>"inform_insp_about_assign,proj_id=$projid",
    5=>"",
    6=>"",
    7=>"",
    8=>"",
    9=>"",
    10=>"",
    11=>"",
    12=>"",
    13=>"",
    14=>"",
    15=>"",
);
if($id==1)
{
   $app = "" ;
   $par = "" ;
}
if($id==2)
{
   $app = "g_select_insp";  
   $par = "proj=$projid";
}
if($id==3 || $id == 4)
{
   $app = "g_select_insp";  
   $par = "proj=$projid;no_new='Yes'" ;
}
if($id==5)
{
   $app = "inform_insp_about_assign";  
   $par = "proj_id=$projid";
}
if($id==6)
{
   $app = "c_send_insp_sup";  
   $par = "proj_id=$projid";
}
if($id==7)
{
   $app ="g_t_ticket";  
   $par = "proj_id=$projid;how='1'"
}  
if($id==8)
{
   $app ="g_t_ticket";  
   $par = "proj_id=$projid;how='2'"
}  

if(!in_array($id,array(3,4) && $role_grp == $user_grp )	// send fax
{  
    sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, $app,  $par, "", "", "");  	   
}
else
{
    sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "",  "", "", "", "");  	   
}


sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, $app,  $par, "", "", ""); 





/*
   if($id== 1 && $role_grp == $user_grp )	// send fax
    {  
        sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "c_send_message",  "proj_id=$projid", "", "", "");  	   
    }
	else
	{
        sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "",  "", "", "", "");  	   
	}
    
    if($id== 2  && $role_grp == $user_grp ) // Inspectors assign
    {
        sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "g_select_insp",  "proj=$projid", "", "", "");  	   
    }	
    elseif($id== 3 && $role_grp == $user_grp ) // Approve insp by tech Manger
    {
	 	if(is_assign_insp_need_approve($projid,$user_grp))
        {
            sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "g_select_insp",  "proj=$projid;no_new='Yes'", "", "", "");  	   
        }
        else
        {
            sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "",  "", "", "", "");  	   
        } 
   }	

     elseif($id== 4 && $role_grp == $user_grp ) // Approve insp by GM
    {
        if(is_assign_insp_need_approve($projid,$user_grp))
        {
            sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "g_select_insp",  "proj=$projid;no_new='Yes'", "", "", "");  
        }
        else
        {
            sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "",  "", "", "", "");  	   
        }  
    }
    elseif($id== 5 && $role_grp == $user_grp ) // send & print mail of inspectore assigning  
    {
        sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "inform_insp_about_assign",  "proj_id=$projid", "", "", "");  	   
    }
    elseif($id== 6) // send & print mail of inspectore assigning  
    {
        sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "c_send_insp_sup",  "proj_id=$projid", "", "", "");  	   
    }
    elseif($id== 7 && $role_grp == $user_grp ) // send & print mail of inspectore assigning  
    {
        sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "g_t_ticket",  "proj_id=$projid;how='1'", "", "", "");  	   
    }
    elseif($id== 8 && $role_grp == $user_grp ) // send & print mail of inspectore assigning  
    {
        sc_appmenu_add_item("m_tracking_menu", $id_txt, "", $txt	, "g_t_ticket",  "proj_id=$projid;how='2'", "", "", "");  	   
    }
 
 */
 
 
