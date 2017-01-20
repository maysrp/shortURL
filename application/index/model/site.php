<?php
	namespace app\index\model;
	use think\Model;
	class site extends Model{
		protected $name='site';
		public $site;
		function start($ip){
			$ob_find=$this->find(1);
			$this->site=$ob_find->data;
			$ip_array=json_decode($this->site['forbidden_ip'],true);
			if(!$ip_array){
				return false;
			}
			if(in_array($ip, $ip_array)){
				return true;//被屏蔽IP返回true
			}
		}
		function jugg($url){//true 可以转短链接
			
			$re_1=$this->jugg_domain($url);//没有匹配到false ok！
			if($re_1){
				$ret['status']=false;
				$ret['con']="已经屏蔽域名:".$re_1;
			}else{
				$ret['status']=true;
				$ret['con']="";
			}
			if(!$ret['status']){
				return $ret;
			}
			if($this->site['filter']){//若开启比对！
				$re_2=$this->filter($url);
				if($re_2){
					$ret['status']=$ret['status']&&false;
					$ret['con']="存在屏蔽词语:".$re_2;
				}else{
					$ret['status']=$ret['status']&&true;
					$ret['con']=$ret['con']."";

				}
			}
			return $ret;
		}
		function jugg_domain($url){
			$domain_array=json_decode($this->site['domain'],true);
			if($domain_array){
					foreach ($domain_array as $key => $value) {
					$pre="/".$value."/i";
					$end=preg_match($pre, $url,$match);
					if($end){
						return $match[0];//禁止网站字符串
					}
				}

			}
		}
		function filter($url){
			$filter_array=json_decode($this->site['filter_key'],true);
			if(!$filter_array){
				return false;
			}
			ini_set('user_agent','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; GreenBrowser)');
			$info=@file_get_contents($url);//获取内容
			foreach ($filter_array as $key => $value) {
				$pre="/".$value."/i";
				$end=preg_match($pre, $info,$match);
			}
			if($end){
				return $match[0];//禁止网站字符串
			}
		}
		function f_ip($ip){//禁止IP
			$ob_find=$this->find(1);
			$ip_j=$ob_find->data;
			$ip_a=json_decode($ip_j['forbidden_ip'],true);//添加IP
			$ip_a[]=$ip_a;
			$save['forbidden_ip']=json_encode($ip_a);
			$save['site']=1;
			$this->update($save);//添加IP
		}
		function up_site($info){
			$domain=strip_tags($info['domain']);
			$domain_string=preg_replace('/\s+/', ' ', $domain);
			$domain_array=explode(" ", $domain_string);
			$info['domain']=json_encode($domain_array);
			$info['site']=1;
			$this->update($info);

		}
	}