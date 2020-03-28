import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cesium.dao.Ele_fieldDao;
import cesium.pojo.Ele_field;

public class test {
 @Test
 public void main() {
	 
	 ApplicationContext aContext=new ClassPathXmlApplicationContext("applicationContext.xml");
	
	 Ele_fieldDao eMapper=(Ele_fieldDao) aContext.getBean("ele_fieldDao");
	 Ele_field ele_field=new Ele_field();
		ele_field.setHeight(15000);
		ele_field.setR(15000);
		ele_field.setX(130);
		ele_field.setY(130);
		
		eMapper.saveEle_field(ele_field);
		
				

		
 }
}
