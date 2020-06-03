package cesium.controller;


import cesium.pojo.Air;
import cesium.pojo.Ele_field;
import cesium.pojo.User;
import cesium.service.AirService;
import cesium.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
@RequestMapping("/airController")
public class AirController {

	@Resource(name = "airService")
	private AirService airService;


	@RequestMapping("show_all2")
	public ModelAndView show_all() {
		//do
		ModelAndView mv =new ModelAndView();
		List<Air> l = airService.showAll();
		System.out.println(l.get(0).toString());



		mv.addObject("list",l);
		mv.setViewName("show_all2");


		return mv;
	}

	private Map<String,Object> result = new HashMap<String,Object>();
	@RequestMapping("show_all")
	@ResponseBody
	public Map<String,Object> show_all(Integer page,Integer rows) {
		//do
		PageHelper.startPage(page,rows);
		List<Air> l1 = airService.showAll();
		PageInfo<Air> pi = new PageInfo<Air>(l1);
		long total = pi.getTotal();
		List<Air> l2= pi.getList();
		result.put("total",total);
		result.put("rows",l2);
		return result;
	}


	@RequestMapping("add")
	@ResponseBody
	public Map<String,Object> add(Air air){
		System.out.println("do=====================");
		System.out.println(air.toString());
		if(airService.selectById(air.getId()) == null){
			try{
				airService.save(air);
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
				airService.updateById(air);
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
	public Air findById(Integer id){
		return airService.selectById(id);

	}

	@RequestMapping("del")
	@ResponseBody
	public Map<String,Object> del(Integer [] id){
		for(int i=0;i<id.length;i++){
			try{
				airService.delById(id[i]);
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
		List<Air> l = airService.showAll();

		mv.addObject("list",l);
		mv.setViewName("air_man");


		return mv;
	}
	@RequestMapping("dele")
	@ResponseBody
	public Map<String,Object> del(HttpServletRequest request) throws UnsupportedEncodingException {
		System.out.println("del================================re");
		Map requestParams = request.getParameterMap();
		Map<String, String> params = new HashMap<String, String>();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
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

		try {
			airService.delById(Integer.parseInt(params.get("id")));
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	@RequestMapping("insert")
	@ResponseBody
	public Map<String,Object> insert(Air air) throws UnsupportedEncodingException {
		System.out.println("insert================================re");
		if(airService.selectById(air.getId())==null){
			try{
				airService.save(air);
				result.put("success",true);
			}
			catch (Exception e){
				e.printStackTrace();
				result.put("success",false);
				result.put("msg",e.getMessage());
			}
		}
		else{
			airService.updateById(air);
		}


		return result;
	}

	@RequestMapping("getall")
	@ResponseBody
	public List<Air> getall() {
		//do
		return airService.showAll();
	}
}
