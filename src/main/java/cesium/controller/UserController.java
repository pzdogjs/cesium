package cesium.controller;


import cesium.pojo.Ele_field;
import cesium.pojo.User;
import cesium.service.Ele_fieldService;
import cesium.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
@RequestMapping("/userController")
public class UserController {

	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping("register")
	public String register() {
		return "register";
	}


	@RequestMapping("save")
	public String save(HttpServletRequest request) throws UnsupportedEncodingException {
		Map requestParams = request.getParameterMap();
		Map<String, String> params = new HashMap<String, String>();
		List l =new ArrayList();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);

			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
				System.out.println(valueStr);
			}
			l.add(valueStr);
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		User user =new User();
		user.setName((String)l.get(0));
		user.setPassword((String)l.get(1));
		String first = (String)l.get(2);
		String rootPD = (String)l.get(3);

		System.out.println("test:"+user.toString()+first+rootPD);
		String reStr = "error";
		if(first.equals("true")){
			if(userService.count() == 0){
				userService.saveUser(user);
				return "index";
			}
			else{
				return "error";
			}
		}
		else{
			if(userService.selectById(1).getPassword().equals(rootPD)){
				List<User> luser = userService.showAll();
				for(int i = 0 ; i<luser.size(); i++){
					if(luser.get(i).getName().equals(user.getName())){
						return "error";
					}
				}
				userService.saveUser(user);
				return "index";
			}
			else{
				return "error";
			}
		}

	}


	@RequestMapping("dologin")
	public String dologin(HttpServletRequest request) throws UnsupportedEncodingException {
		Map requestParams = request.getParameterMap();
		Map<String, String> params = new HashMap<String, String>();
		List l =new ArrayList();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);

			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
				System.out.println(valueStr);
			}
			l.add(valueStr);
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		System.out.println("name and ps"+params.get("name")+";ps;"+params.get("password"));

		User user =new User();
		user.setName(params.get("name"));
		user.setPassword(params.get("password"));
		User user2 = userService.selectByName(user.getName());
 		if( user2 == null){
			return "error";
		}else{
 			if(user2.getPassword().equals(user.getPassword())){
				return "index";
			}
 			else{
				return "error";
			}

		}


	}

	@RequestMapping("doLoginRoot")
	public String doLoginRoot(HttpServletRequest request) throws UnsupportedEncodingException {
		Map requestParams = request.getParameterMap();
		Map<String, String> params = new HashMap<String, String>();
		List l =new ArrayList();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);

			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
				System.out.println(valueStr);
			}
			l.add(valueStr);
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		User user =new User();
		user.setName((String)l.get(0));
		user.setPassword((String)l.get(1));
		User user2 = userService.selectById(1);
		if( user2 == null){
			return "login_error";
		}else{
			if(user2.getPassword().equals(user.getPassword())){
				return "user_manage";
			}
			else{
				return "login_error";
			}

		}


	}
	private Map<String,Object> result = new HashMap<String,Object>();
	@RequestMapping("show_all")
	@ResponseBody
	public Map<String,Object> show_all(Integer page,Integer rows) {
		//do
		PageHelper.startPage(page,rows);
		List<User> l1 = userService.showAll();
		PageInfo<User> pi = new PageInfo<User>(l1);
		long total = pi.getTotal();
		List<User> l2= pi.getList();
		result.put("total",total);
		result.put("rows",l2);
		return result;
	}


	@RequestMapping("addUser")
	@ResponseBody
	public Map<String,Object> addUser(User user){
		System.out.println("do=====================");
		System.out.println(user.toString());
		if(userService.selectById(user.getId()) == null){
			try{
				userService.saveUser(user);
				result.put("success",true);
			}
			catch (Exception e){
				e.printStackTrace();
				result.put("success",false);
				result.put("msg",e.getMessage());
			}
		}
		else{
			try{
				userService.updateById(user);
				result.put("success",true);
			}
			catch (Exception e){
				e.printStackTrace();
				result.put("success",false);
				result.put("msg",e.getMessage());
			}
		}

		return result;

	}
	@RequestMapping("findById")
	@ResponseBody
	public User findById(Integer id){
		return userService.selectById(id);

	}

	@RequestMapping("del")
	@ResponseBody
	public Map<String,Object> del(Integer [] id){
		for(int i=0;i<id.length;i++){
			try{
				userService.delById(id[i]);
				result.put("success",true);
			}
			catch (Exception e){
				e.printStackTrace();
				result.put("success",false);
				result.put("msg",e.getMessage());
			}

		}
		return result;

	}
///////////////////layui

	@RequestMapping("lay-login")
	@ResponseBody
	public Map<String,Object> lay_login(HttpServletRequest request) throws UnsupportedEncodingException {
		System.out.println("login================================re");
		Map requestParams = request.getParameterMap();
		Map<String, String> params = new HashMap<String, String>();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		System.out.println(userService.selectById(Integer.parseInt(params.get("id"))).toString());
		System.out.println("password==="+params.get("password"));
		if(userService.selectById(Integer.parseInt(params.get("id"))) == null){
			System.out.println("id err="+params.get("id"));
			result.put("success",false);
		}
		else if(userService.selectById(Integer.parseInt(params.get("id"))).getPassword().equals(params.get("password"))){
			System.out.println("id ok="+params.get("id"));
			result.put("success",true);
		}
		else{
			System.out.println("id err="+params.get("id"));
			result.put("success",false);
		}
		return result;
	}
	@RequestMapping("lay-dologin")
	public String lay_dologin() {
				return "index";
	}
	@RequestMapping("lay-re")
	@ResponseBody
	public Map<String,Object> lay_re(HttpServletRequest request) throws UnsupportedEncodingException {
		System.out.println("login================================re");
		Map requestParams = request.getParameterMap();
		Map<String, String> params = new HashMap<String, String>();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		System.out.println("re get id="+params.get("id"));
		User user=new User();
		user.setPassword(params.get("name"));
		user.setId(Integer.parseInt(params.get("id")));
		if(userService.selectById(Integer.parseInt(params.get("id"))) == null){
			userService.saveUser(user);
			result.put("success",true);
			System.out.println("id re ok="+params.get("id"));
		}else{

			result.put("success",false);
		}
		return result;
	}
@RequestMapping("all")
public ModelAndView all() {
	//do
	ModelAndView mv =new ModelAndView();
	List<User> l = userService.showAll();

	mv.addObject("list",l);
	mv.setViewName("user_man");


	return mv;
}
	@RequestMapping("dele")
	@ResponseBody
	public Map<String,Object> del(HttpServletRequest request) throws UnsupportedEncodingException {
		System.out.println("del================================re");
		Map requestParams = request.getParameterMap();
		Map<String, String> params = new HashMap<String, String>();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

			try{
				userService.delById(Integer.parseInt(params.get("id")));
				result.put("success",true);
			}
			catch (Exception e){
				e.printStackTrace();
				result.put("success",false);
				result.put("msg",e.getMessage());
			}
		return result;
	}
	@RequestMapping("insert")
	@ResponseBody
	public Map<String,Object> insert(User user) throws UnsupportedEncodingException {
		System.out.println("insert or  updat================================re");
		if(userService.selectById(user.getId())==null){
			try{
				userService.saveUser(user);
				result.put("success",true);
			}
			catch (Exception e){
				e.printStackTrace();
				result.put("success",false);
				result.put("msg",e.getMessage());
			}
		}
		else{
			userService.updateById(user);
		}

		return result;
	}

}
