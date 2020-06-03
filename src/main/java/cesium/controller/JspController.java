package cesium.controller;


import cesium.pojo.*;
import cesium.service.*;
import cesium.util.HarvenSin;
import cesium.util.PzUntil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
@RequestMapping("wait")
public String wait1() {
	return "wait";
}
	@RequestMapping("ana-all")
	public String ana_all() {
	return "ana-all";
}
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
	@RequestMapping("ana-list2")
	public String ana_list2() {
		return "ana-list2";
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



	private Map<String,Object> result = new HashMap<String,Object>();
	@RequestMapping("ana")
	@ResponseBody
	public Map<String,Object> ana(HttpServletRequest request) throws UnsupportedEncodingException {
		/////////////////////////////////////////////////////////////////////////////取出请求参数
		Map<String,Object> resu;
		System.out.println("anananan================================re");
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
		String eleIds = params.get("eleIds");
		String airIds = params.get("airIds");

		System.out.println("ids1==========="+params.get("eleIds"));
		System.out.println("ids2==========="+params.get("airIds"));
		/////////////////////////////////////////////////////////////////////////////无选中雷达或飞机则不分析
		if(eleIds.equals("")){
			System.out.println("ele is null===========");
			resu = new HashMap<String,Object>();
			resu.put("success",false);
			resu.put("msg","未选择雷达");
			return resu;
			//雷达空，
		}
		else if(airIds.equals("")){
			 resu = new HashMap<String,Object>();
			System.out.println("air is null===========");
			resu.put("success",false);
			resu.put("msg","未选择飞行器");
			//飞机空，不计算，只返回飞机与热图信息
			return resu;
		}
		else{
			System.out.println("air ele all hava===========");
			resu = ana(eleIds,airIds);
			resu.put("success",true);
			//air and ele   need ana
			return resu;
		}


	}


	public  Map<String,Object> ana(String eleIds,String airIds){
		/////////////////////////////////////////////////////////////////取出id
		String [] strEle = eleIds.split(",");
		String [] strAir = airIds.split(",");
		//System.out.println("length==========="+strEle.length);
		//System.out.println("length==========="+strAir.length);
		//System.out.println("a in air==========="+"air".indexOf("a"));
		int [] intEle = new int [strEle.length];
		int [] intAir = new int [strAir.length];
		List<Ele_field> eleList= new ArrayList<Ele_field>();
		List<Air> airList = new ArrayList<Air>();
		List<Path> pathList = new ArrayList<Path>();
		List<HeatMap> heatList = new ArrayList<HeatMap>();

		///////////////////取出传递的id对应的实体，放入list中
		for(int i=0; i<strEle.length; i++){
			intEle[i] = Integer.parseInt(strEle[i].replace("ele","").trim());
			eleList.add(ele_fieldService.selectById(intEle[i]));
		}
		for(int i=0;i<strAir.length;i++){
			if(strAir[i].indexOf("a")==0){
				intAir[i] = Integer.parseInt(strAir[i].replace("air",""));
				airList.add(airService.selectById(intAir[i]));
			}else {
				intAir[i] = Integer.parseInt(strAir[i].replace("path",""));
				pathList.add(pathService.selectById(intAir[i]));
			}
		}
		heatList = heatMapService.showAll();
		System.out.println("heatList==========="+heatList.toString());
		System.out.println("eleList=========="+eleList.toString());
		System.out.println("airList==========="+airList.toString());
		System.out.println("pathList==========="+pathList.toString());
		/////////////////////////////////////////////////分析数据放入map
		Map<Integer,List<Object>> eleFindMap = new HashMap<>();
		Map<Integer,List<Object>> airFindMap = new HashMap<>();
		//System.out.println("map   test null============"+eleFindMap.get(1));
		for(int i=0;i<eleList.size();i++){
			for(int j=0;j<airList.size();j++){
				//如果在雷达范围内
				if(PzUntil.is_found(eleList.get(i),pathList.get(j))){
					System.out.println("eleid,pathid,airid=============="+eleList.get(i).getId()+"=========="+pathList.get(j).getId()+"=========="+airList.get(j).getId());
					//添加ele探测map
					if(eleFindMap.get(eleList.get(i).getId()) == null){

						System.out.println("cut=====111111=====cut");
						//此雷达无可探测信息，生成新的信息list
						List<Object> eleFind = new ArrayList<Object>();
						//list add
						eleFind.add(airList.get(j));
						eleFind.add(pathList.get(j));
						//add list to 雷达探测图
						eleFindMap.put(eleList.get(i).getId(),eleFind);
					}
					else{System.out.println("cut==============cut");
						//此雷达有可探测信息，取出旧list
						List<Object> eleFind =  eleFindMap.get(eleList.get(i).getId());
						//list add\
						eleFind.add(airList.get(j));
						eleFind.add(pathList.get(j));

						//删除旧的list
						eleFindMap.remove(eleList.get(i).getId());
						//放入新的list
						eleFindMap.put(eleList.get(i).getId(),eleFind);
					}
					//添加air探测map
					if(airFindMap.get(airList.get(j).getId()) == null){
						System.out.println("cut=====111111=====cut"+airFindMap.get(airList.get(j).getId()));
						//此雷达无可探测信息，生成新的信息list
						List<Object> airFind = new ArrayList<Object>();
						//list add
						airFind.add(eleList.get(i));
						//add list to 雷达探测图
						airFindMap.put(airList.get(j).getId(),airFind);
					}
					else{
						System.out.println("cut==============cut");
						//此雷达有可探测信息，取出旧list
						List<Object> airFind =  airFindMap.get(airList.get(j).getId());
						//list add
						airFind.add(eleList.get(i));
						//删除旧的list
						airFindMap.remove(airList.get(j).getId());
						//放入新的list
						airFindMap.put(airList.get(j).getId(),airFind);
					}
					System.out.println("i==========" +i);
					System.out.println("j==========" +j);
					System.out.println("add 1=======ele" + eleFindMap.toString());
					System.out.println("add 1=======air" + airFindMap.toString());
				}//if如果在雷达范围内
				else{
					;//no do
				}

			}//for2
		}//for1
		System.out.println( "last ele=======" +eleFindMap.toString());
		System.out.println( "last air=======" +airFindMap.toString());
		System.out.println("info ok==============================");
		////////////////////////////////////////////////////////map存放的分析数据，转list，
		List<Object> eleFList = new ArrayList<Object>();
		List<Object> airFList = new ArrayList<Object>();

		for(int i=0;i<eleList.size();i++){
			if(eleFindMap.get(eleList.get(i).getId())   == null){
				eleFList.add("no");
			}else{
				List<Object> l = eleFindMap.get(
						eleList.get(i).getId());
				eleFList.add(l);

			}
		}

		for(int i=0;i<airList.size();i++){
			if(airFindMap.get(airList.get(i).getId())   == null){
				airFList.add("no");
			}else{
				List<Object> l = airFindMap.get(
						airList.get(i).getId());
				airFList.add(l);
			}
		}
		System.out.println( "last eleFindlist=======" +eleFList.toString());
		System.out.println( "last eleFindlist=======" +airFList.toString());
		////////////////////分析 时间元素
		List<String> timeList = PzUntil.getTimeList(airList);
		System.out.println( "last timeList=======" +timeList.toString());
		/////////////////////设定返回值
		Map<String,Object> resu = new HashMap<String,Object>();
		resu.put("eleList",eleList);
		resu.put("airList",airList);
		resu.put("pathList",PzUntil.pathChange(pathList));////////////////////////路径信息优化
		resu.put("heatList",heatList);
		resu.put("eleFList",eleFList);
		resu.put("airFList",airFList);
		resu.put("timeList",timeList);
		return resu;
	}
}
