import cesium.dao.CampDao;
import cesium.pojo.Camp;
import cesium.pojo.QueryVo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cesium.dao.Ele_fieldDao;
import cesium.pojo.Ele_field;

import java.util.ArrayList;
import java.util.List;

public class test {
 @Test
 public void main() {

     ClassPathXmlApplicationContext aContext=new ClassPathXmlApplicationContext("applicationContext.xml");
	
	 Ele_fieldDao eMapper=(Ele_fieldDao) aContext.getBean("ele_fieldDao");

	 /*
	 ////ele_filed test

//add  and !!!!!return id
     Ele_field ele_field=new Ele_field();
     ele_field.setHeight(15000);
     ele_field.setR(15000);
     ele_field.setX(130);
     ele_field.setY(130);
     ele_field.setName("a");
     ele_field.setCid_fk(1);
     eMapper.save(ele_field);

     System.out.println(ele_field.getId());
	//del
		 eMapper.delByID(10);
	//update
			Ele_field ele_field=new Ele_field();
			 ele_field.setId(9);
			 ele_field.setHeight(15000);
			 ele_field.setR(15000);
			 ele_field.setX(130);
			 ele_field.setY(130);
			   ele_field.setName("a");
     ele_field.setCid_fk(1);

	 eMapper.updateByID(ele_field);
	//selectall
		 List<Ele_field> l=eMapper.selectAll();
		 for (Ele_field ele_field:l) {
			 System.out.println(ele_field.toString());
		 }
        //select  id
                System.out.println( eMapper.selectByID(1).toString());
         //select   likename   模糊查询注意name包含模糊语句，，，不能在下级添加模糊

             List<Ele_field> l=eMapper.selectByLikeName("%a%");
             for (Ele_field ele_field:l) {
                 System.out.println(ele_field.toString());
             }

       ///count(*)	  总记录数
         System.out.println(eMapper.CountNumber());


        //selectby condition
             Ele_field ele_field=new Ele_field();

             ele_field.setX(130);
             List<Ele_field> l=eMapper.selectByCondition(ele_field);
             for (Ele_field ele_field2:l) {
                 System.out.println(ele_field2.toString());
             }

             //query vo
              QueryVo queryVo=new QueryVo();
     List<Integer> list=new ArrayList<Integer>();
     list.add(1); list.add(2); list.add(3);
     queryVo.setIds(list);

     List<Ele_field> l=eMapper.selectInIds(queryVo);
     for (Ele_field ele_field:l) {
         System.out.println(ele_field.toString());
     }

//Ele_field   and  camp
     List<Ele_field> l=eMapper.selectAndCamp();
     for (Ele_field ele_field:l) {
         System.out.println(ele_field.toString());
     }


        */

	 /*
	 ///camp test



	 ///camp and Ele_field
     CampDao cd= (CampDao) aContext.getBean("campDao");
     List<Camp> l=cd.findAll();
     for (Camp camp:l) {
         System.out.println(camp.toString());
     }

	  */
aContext.close();


 }
}
