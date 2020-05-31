package cesium.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cesium.pojo.Air;
import cesium.pojo.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;


import cesium.pojo.Ele_field;
import cesium.service.Ele_fieldService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
@RequestMapping("/ele_fieldController")
public class Ele_fieldController {

	@Resource(name = "ele_fieldService")
	private Ele_fieldService ele_fieldService;




	@RequestMapping("save")
	public String save(Ele_field ele_field) {
		ele_fieldService.saveEle_field(ele_field);
		
		return "saveok";
	}
	@RequestMapping("show_all")
	public ModelAndView show_all() {
		//do
		ModelAndView mv =new ModelAndView();
		List<Ele_field> l = ele_fieldService.showAll();
		System.out.println(l.get(1).toString());

		 mv.addObject("list",l);
		 mv.setViewName("show_all");


		return mv;
	}
	@RequestMapping("/show_one")
	public  ModelAndView  showOne(HttpServletRequest request) {

		ModelAndView mv =new ModelAndView();
		List<Ele_field> l = ele_fieldService.showAll();
		System.out.println(l.get(1).toString());
		request.setAttribute("ele.r",l.get(1).getR());//request不能放对象？？
		mv.addObject("ele",l.get(1));
		mv.setViewName("show_one");


		return mv;
	}


	@RequestMapping("/ajax")
	public @ResponseBody String ajax(@RequestBody String body, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String Id = request.getParameter("id");
		System.out.println("id"+Id);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(ele_fieldService.showAll());
		System.out.println(json);


		return json;
	}

/////////////////////for  manage
private Map<String,Object> result = new HashMap<String,Object>();
	@RequestMapping("show")
	@ResponseBody
	public Map<String,Object> show(Integer page,Integer rows) {
		//do
		PageHelper.startPage(page,rows);
		ArrayList<Ele_field> l1 = ele_fieldService.showAll();
		PageInfo<Ele_field> pi = new PageInfo<Ele_field>(l1);
		long total = pi.getTotal();
		List<Ele_field> l2= pi.getList();
		result.put("total",total);
		result.put("rows",l2);
		return result;
	}


	@RequestMapping(value = "add")
	@ResponseBody
	public Map<String,Object> add(Ele_field ele_field){
		System.out.println("建do=====================");
		System.out.println(ele_field.toString());
		if(ele_fieldService.selectById(ele_field.getId()) == null){
			try{
				ele_fieldService.save(ele_field);
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
				ele_fieldService.updateById(ele_field);
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
	public Ele_field findById(Integer id){
		return ele_fieldService.selectById(id);

	}

	@RequestMapping("del")
	@ResponseBody
	public Map<String,Object> del(Integer [] id){
		for(int i=0;i<id.length;i++){
			try{
				ele_fieldService.delById(id[i]);
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
	@RequestMapping("all")
	public ModelAndView all() {
		//do
		ModelAndView mv =new ModelAndView();
		List<Ele_field> l = ele_fieldService.showAll();
		System.out.println(l.get(1).toString());

		mv.addObject("list",l);
		mv.setViewName("ele_man");


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
			ele_fieldService.delById(Integer.parseInt(params.get("id")));
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
	public Map<String,Object> insert(Ele_field ele_field) throws UnsupportedEncodingException {
		System.out.println("insert================================re");

		try{
			ele_fieldService.save(ele_field);
			result.put("success",true);
		}
		catch (Exception e){
			e.printStackTrace();
			result.put("success",false);
			result.put("msg",e.getMessage());
		}
		return result;
	}

}
