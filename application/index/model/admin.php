<?php
	namespace app\index\model;
	use think\Model;
	class admin extends Model{
		function jugg($password){
			$infox=$this->find(1);
			$info=$infox->data;
			$salt=$info['salt'];
			$passwd=$info['password'];
			$jugg_passwd=md5(md5($password).$salt);
			if($jugg_passwd==$passwd){
				return true;
			}else{
				return false;
			}
		}
		function salt(){
			$salt=mt_rand(100000,999999);
			return $salt;
		}
		function change_passwd($old,$password){
			$type=$this->jugg($old);
			if(!$type){
				return false;
			}
			$salt=$this->salt();
			$passwd=md5(md5($password).$salt);
			$update['admin']=1;
			$update['salt']=$salt;
			$update['password']=$passwd;
			$this->update($update);
			return true;
		}
	}