<?php
	namespace app\index\model;
	use think\Model;
	class url extends Model{
		protected $name='url';
		function create_info($info,$num){//传入值
			$save['uid']=$info['uid'];
			$save['original']=$info['original'];
			$save['short']=$this->random_short($num);
			$save['time']=time();
			$save['ip']=$info['ip'];
			$this->insert($save);
			$re['status']=true;
			$re['con']=$save['short'];
			return $re;
		}
		function random_short($num){
			if(isset($num)){
				if((int)$num<=4){
					$num=4;
				}
			}else{
				$num=4;
			}
			$str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			$short="";
			for ($i=0; $i < $num; $i++) { 
				$mt=mt_rand(0,61);
				$short=$short.$str[$mt];
			}
			$re=$this->is_short($short);
			if($re){
				$this->random_short();
			}else{
				return $short;
			}		
		}
		function is_short($short){//jugg
			$where['short']=$short;
			$re=$this->where($where)->select();
			if($re){
				return true;
			}else{
				return false;
			}
		}
		function short_key($short){//匹配 用short去匹配信息
			$where['short']=$short;
			$re=$this->where($where)->select();
			if($re){
				return $re[0]->data;
			}else{
				return false;
			}
		}
		function click($info){//访问信息[short,ip]
			$noke=$this->short_key($info['short']);
			if($noke){
				$info_array=json_decode($noke['visitor'],true);
				$info['time']=time();
				$info_array[]=$info;
				$noke['click']=$noke['click']+1;
				$noke['visitor']=json_encode($info_array);
				$this->update($noke);
				
				$rex['status']=true;
				$rex['con']=$noke['original'];
			}else{
				$rex['status']=false;
				$rex['con']="无该链接";
			}
			return $rex;
		}
		function ip_select($ip){//IP查询
			$where['ip']=$ip;
			$re_ip=$this->where($where)->select();
			if($re_ip){
				$re['status']=true;
				$re['con']=$re_ip->data;
			}else{
				$re['status']=false;
				$re['con']="无该IP信息";
			}
		}
		

	}