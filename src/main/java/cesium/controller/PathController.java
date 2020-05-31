package cesium.controller;


import cesium.pojo.Air;
import cesium.pojo.Path;
import cesium.pojo.User;
import cesium.service.AirService;
import cesium.service.PathService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/pathController")
public class PathController {

	@Resource(name = "pathService")
	private PathService pathService;


	@RequestMapping("show_all2")
	public ModelAndView show_all() {
		//do
		ModelAndView mv =new ModelAndView();
		List<Path> l = pathService.showAll();
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
		List<Path> l1 = pathService.showAll();
		PageInfo<Path> pi = new PageInfo<Path>(l1);
		long total = pi.getTotal();
		List<Path> l2= pi.getList();
		result.put("total",total);
		result.put("rows",l2);
		return result;
	}


	@RequestMapping("add")
	@ResponseBody
	public Map<String,Object> add(Path path){
		System.out.println("do=====================");
		System.out.println(path.toString());
		if(pathService.selectById(path.getId()) == null){
			try{
				pathService.save(path);
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
				pathService.updateById(path);
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
	public Path findById(Integer id){
		return pathService.selectById(id);

	}

	@RequestMapping("del")
	@ResponseBody
	public Map<String,Object> del(Integer [] id){
		for(int i=0;i<id.length;i++){
			try{
				pathService.delById(id[i]);
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
		List<Path> l = pathService.showAll();
		System.out.println(l.get(0).toString());

		mv.addObject("list",l);
		mv.setViewName("path_man");


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
			pathService.delById(Integer.parseInt(params.get("id")));
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
	public Map<String,Object> insert(Path path) throws UnsupportedEncodingException {
		System.out.println("insert================================re");

		try{
			pathService.save(path);
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
