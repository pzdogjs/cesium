package cesium.controller;



import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import cesium.pojo.Ele_field;
import cesium.service.Ele_fieldService;

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


	@RequestMapping("/input")
	public String input() {
		return "input";
	}



}
