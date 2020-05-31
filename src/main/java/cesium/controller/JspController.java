package cesium.controller;


import cesium.pojo.*;
import cesium.service.*;
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
@RequestMapping("/jspController")
public class JspController {
	@Resource(name = "ele_fieldService")
	private Ele_fieldService ele_fieldService;
	@Resource(name = "heatMapService")
	private HeatMapService heatMapService;
	@Resource(name = "airService")
	private AirService airService;
	@Resource(name = "pathService")
	private PathService pathService;



/////////////easyui
	@RequestMapping("index2")
	public String index2() {
		return "index2";
	}
	@RequestMapping("user_manage")
	public String user_manage() {
		return "user_mannage";
	}
	@RequestMapping("ele_manage")
	public String ele_manage() {
		return "ele_manage";
	}
	@RequestMapping("air_manage")
	public String air_manage() {
		return "air_manage";
	}
	@RequestMapping("heatmap_manage")
	public String heatmap_manage() {
		return "heatmap_manage";
	}
	@RequestMapping("path_manage")
	public String path_manage() {
		return "path_manage";
	}

	@RequestMapping("show")
	public ModelAndView show() {
		//do
		ModelAndView mv =new ModelAndView();

		List<Ele_field> l = ele_fieldService.showAll();
		List<Air> l2 = airService.showAll();
		List<HeatMap> l3 = heatMapService.showAll();

		mv.addObject("list",l);
		mv.addObject("listair",l2);
		mv.addObject("listheat",l3);
		mv.setViewName("show");


		return mv;
	}
////////////////layui
	@RequestMapping("index")
	public String index() {
	return "index";
}
	@RequestMapping("member-add")
	public String menber_add() {
		return "user-add";
	}
	@RequestMapping("air-add")
	public String air_add() {
		return "air-add";
	}

	@RequestMapping("ele-add")
	public String ele_add() {
		return "ele-add";
	}

	@RequestMapping("path-add")
	public String path_add() {
		return "path-add";
	}

	@RequestMapping("heatMap-add")
	public String heatMap_add() {
		return "heatMap-add";
	}


	@RequestMapping("ana-list")
	public ModelAndView ana_list() {
		//do
		ModelAndView mv =new ModelAndView();
		List<Air> lair = airService.showAll();
		List<Path> lpath = pathService.showAll();
		List<Ele_field> lele = ele_fieldService.showAll();

		mv.addObject("air",lair);
		mv.addObject("ele",lele);
		mv.addObject("path",lpath);

		mv.setViewName("ana-list");
		return mv;
	}

}
