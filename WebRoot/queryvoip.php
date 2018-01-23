<?php
/*
 *  Copyright (c) 2013 The CCP project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a Beijing Speedtong Information Technology Co.,Ltd license
 *  that can be found in the LICENSE file in the root of the web site.
 *
 *   http://www.cloopen.com
 *
 *  An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */
 if($_SERVER["REQUEST_METHOD"]=="POST")
{  
  //获取POST数据
  $result = file_get_contents("php://input");
  //解析XML
  $xml = simplexml_load_string(trim($result," \t\n\r"));
  //获取XML数据
  $action = $xml->action;
  $id = $xml->id;
  $type = $xml->type;
  $strXML="";
  //ID判断
  if ("token1"==$id){        
     $strXML="<?xml version='1.0' encoding='utf-8'?>
              <Response>
              <dname>填写用户昵称</dname>        
              <voipid>填写voip账号</voipid>
              <voippwd>填写voip密码</voippwd>
              <hash>$id</hash>
              </Response>";    
  }else if ("token2"==$id){        
     $strXML="<?xml version='1.0' encoding='utf-8'?>
              <Response>
              <dname>填写用户昵称</dname>        
              <voipid>填写voip账号</voipid>
              <voippwd>填写voip密码</voippwd>
              <hash>$id</hash>
              </Response>";    
  }
  echo $strXML; 
}else{
  //兼容旧版本GET-json方式
  $type = $_REQUEST["type"];    
  $id = $_REQUEST["id"];   
  $strJson="";
  // 此处可根据$id查询对应的voip信息，进行json组包。
  
  //json示例   
  if ("token1"==$id){        
     $strJson="{\"dname\":\"填写用户昵称\",\"voipid\":\"填写voip账号\",\"voippwd\":\"填写voip密码\",\"hash\":\"".$id."\"}";    
  }else if ("token2"==$id){        
     $strJson="{\"dname\":\"填写用户昵称\",\"voipid\":\"填写voip账号\",\"voippwd\":\"填写voip密码\",\"hash\":\"".$id."\"}";    
  }    
  echo $strJson;
}
 ?>