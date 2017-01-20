<?php
namespace app\index\controller;
use think\Controller;
use app\index\model\url as UrlModel;
use app\index\model\site as SiteModel;
use think\Request ;
class Index extends Controller
{
    public function index()
    {
        $site=new SiteModel;
        $url=new UrlModel;
        $request=Request::instance();
        $ip=$request->ip();
        if($site->start($ip)){ //如果IP被禁止则true;
            $this->error("你的IP".$ip."处于禁止名单之中，请联系管理员！");
            return;
        }
        $u=$request->get('u');
        if(strlen($u)>4){
            $info['short']=$u;
            $info['ip']=$ip;
            $re=$url->click($info);
            if($re['status']){
                $this->assign("url",$re['con']);
                $this->assign("site",$site->site);
                return $this->fetch("click");
            }else{
                $this->error($re['con']);
            }
        }
        $r=$request->post('r');
        if(strlen($r)>4){
            $p_http='/http:\/\/|https:\/\//i';
            $http=preg_match($p_http,$r);
            if(!$http){
                $r="http://".$r;
            }
            $rem=$site->jugg($r);
            if(!$rem['status']){
                return json($rem);
            }
        	$info['uid']=10;
        	$info['ip']=$ip;
        	$info['original']=$r;
       		$rem=$url->create_info($info,NUM);//返回key
            //var_dump($rem);
            return json($rem);

        }else{
            $site_obj=$site->find(1);
            $this->assign("site",$site_obj);
        	return $this->fetch('index');
        	
        }
    }

}
