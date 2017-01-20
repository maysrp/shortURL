<?php
	namespace app\index\controller;
	use think\Controller;
	use app\index\model\url as UrlModel;
	use app\index\model\site as SiteModel;
	use app\index\model\admin as AdminModel;
	use think\Session;
	use think\Request ;
	class Admin extends Controller{
		function index(){
			$request=Request::instance();//
			if($request->session('admin')){
				$site=new SiteModel();
				$url=new UrlModel();
				if($request->post('add_p')){
					$site->up_site($request->post());	
					$this->success("已经更新配置");
					return;
				}
				$site_info=$site->find(1);
				$domain=json_decode($site_info['domain'],true);
				$site_info['domain']=implode(" ", $domain);
				$count=$url->count();
				$this->assign("count",$count);
				$this->assign("site",$site_info);
				return $this->fetch();
			}else{//登入
				$this->error("请先登入",'Admin/login');
			}
		}
		function login(){//验证
			$request=Request::instance();//
			if($request->session('admin')){
				$this->error("你已登入","Admin/index");
				return;
			}
			if(!isset($_POST['name'])){
				return $this->fetch();
			}else{
				$name=$request->post('name');
				if(strtolower($name)!="admin"){
					$this->error("无该用户");
				}else{
					$password=$request->post('password');
					$admin=new AdminModel();
					$re=$admin->jugg($password);
					if ($re) {
						Session::set('admin','admin');
						$this->success("登入成功",'Admin/index');
					}else{
						$this->error("密码错误");
					}
				}
			}
		}
		function change_p(){
			$request=Request::instance();//
			if(!$request->session('admin')){
				$this->error("你还未登入","Admin/login");
				return;
			}
			$old=$request->post('old');
			$new=$request->post('new');
			$admin=new AdminModel();
			$re=$admin->change_passwd($old,$new);
			if($re){//成功true

			}
		}
		function lister(){
			$url=new UrlModel();
			$listall=$url->select();//
			//var_dump($listall);
		}


	}