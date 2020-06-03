package cesium.util;

import cesium.pojo.Air;
import cesium.pojo.Ele_field;
import cesium.pojo.Path;
import cesium.service.AirService;
import cesium.service.Ele_fieldService;
import cesium.service.HeatMapService;
import cesium.service.PathService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PzUntil {
    // 数据格式：2012-08-04T10:00:00Z
    static boolean ismin(String start,String min){ //如果第一个参数更小，返回true
        if(   start.compareTo(min)  < 0   ){
            return true;
        }
        else if( start.compareTo(min)  > 0  ){
            return false;
        }
        else{
            ;
        }
        return false;
    }
    static boolean isMax(String end,String max){
        if(   end.compareTo(max)  < 0   ){ //如果第一个参数更大，返回true
            return false;
        }
        else if( end.compareTo(max)  > 0  ){
            return true;
        }
        else{
            ;
        }
        return false;
    }
    //判断出  系统需要的时间轴的 起点与终点
    // 数据格式：2012-08-04T10:00:00Z
    public static List<String> getTimeList(List<Air> airList){
        List<String> l =new ArrayList<String>();
        String minStart="9999";
        String maxEnd="";
        for(int i=0;i<airList.size();i++){
            if(ismin(airList.get(i).getStart().trim(),minStart)){
                minStart = airList.get(i).getStart();
            }
            if(isMax(airList.get(i).getEnd().trim(),minStart)){
               maxEnd = airList.get(i).getEnd();
            }
        }


        l.add(minStart);
        l.add(maxEnd);
        return l;
    }
    //优化路径信息
    //优化一条路径中的一段
    public static String changePart( int time1,double x1,double y1,double h1,
                                     int time2,double x2,double y2,double h2){
        String pathdata="";
        //System.out.println("receive====="+time1);
        int n = (time2-time1)/100;//分割为n个点
        double x= (x2-x1)/n;
        double y= (y2-y1)/n;
        double h= (h2-h1)/n;
        //System.out.println("start=========");
        for(int i=0;i<n;i++){
            //System.out.println("changepart  part====="+i);
            pathdata+= (String.valueOf(  time1+i*100  )+",");
            pathdata+= (String.valueOf(  x1+i*x  ) +",");
            pathdata+= (String.valueOf(  y1+i*y  )+",");
            pathdata+= (String.valueOf(  h1+i*h  )+",");
        }
        return pathdata;
    }
    public static Path changeOne(Path path){
        String pathdata = path.getData();//取出路径数据    " 0,x,y,h,   100,x2,y2,h2"
        String newpath="";
        System.out.println("path  before change ====="+pathdata);

        String [] str= pathdata.split(",");//       [0,x,y,h,   100,x2,y2,h2]
        int n = str.length/4;//n个路径点  2
        //System.out.println("n====="+str.length/4);

        for(int i=0;i<n-1;i++){
            //System.out.println("change  part====="+i);
            /*for(int j=0;j<8;j++){
                if(j==0 || j==4){
                    System.out.println("change  j===="+Integer.valueOf(str[j].trim()));
                }
                else{
                    System.out.println("change  j===="+Double.valueOf(str[j].trim()));
                }

            }
            */
            newpath= newpath+changePart(
                    Integer.valueOf(str[i].trim()),//不加trim可能失败
                    Double.valueOf(str[i+1].trim()),
                    Double.valueOf(str[i+2].trim()),
                    Double.valueOf(str[i+3].trim()),
                    Integer.valueOf(str[i+4].trim()),
                    Double.valueOf(str[i+5].trim()),
                    Double.valueOf(str[i+6].trim()),
                    Double.valueOf(str[i+7].trim())
            );
        }


        path.setData( newpath.substring(0,newpath.length()-1));//去掉最后的逗号
        System.out.println("path   change ====="+newpath);
        return path;
    }
    public static List<Path> pathChange(List<Path> pathList){
        List<Path> pathList2 = new ArrayList<Path>();
        List<Path> pathList3 = new ArrayList<Path>();
        for(int i=0;i<pathList.size();i++){//遍历path
            Path path = pathList.get(i);
            pathList2.add(changeOne(path));//会反？
        }
        for(int i=0;i<pathList.size();i++) {//遍历path 反转list2
            pathList3.add(
                    pathList2.get(i)
            );//会反？
        }

        return pathList3;
    }


    public static Boolean is_found(Ele_field ele_field, Path path){
        String pathdata = path.getData();
        Double x = ele_field.getX();
        Double y = ele_field.getY();
        Double h = ele_field.getHeight();
        Double r = ele_field.getR();
        String [] str = pathdata.split(",");
        for(int i=0;i<str.length;i++){
            ;//System.out.println("path str========="+i+"======"+str[i]);
        }
        //n段路程
        int n=str.length/4-1;
        for(int i=0;i<n;i++){
            double x1 = Double.valueOf(str[i+1]);
            double y1 = Double.valueOf(str[i+2]);
            double h1 = Double.valueOf(str[i+3]);

            double x2 = Double.valueOf(str[i+5]);
            double y2 = Double.valueOf(str[i+6]);
            double h2 = Double.valueOf(str[i+7]);

            double hair =(h2+h1)/2;
            //求两点间距离
            //39.94607,116.32793  31.24063,121.42575  先纬度后经度

            //三个距离中，l1为path距离
            double l1=HarvenSin.Distance(y1, x1, y2, x2);//路径边
            double l2=HarvenSin.Distance(y, x, y2, x2);
            double l3=HarvenSin.Distance(y1, x1, y, x);

            //垂线长度，第一条边上的垂线
            double d1 = HarvenSin.getVerticalVal(l1,l2,l3);

            //垂线，高度。平方和求距离
            double length = HarvenSin.getPz(d1,(hair-h)/1000);


            if(length<=r){         //路径是否被探测判断，
                if((l1*l1+l2*l2)<l3*l3 || (l1*l1+l3*l3)<l2*l2){     //垂点是否在三角形边上判断
                    if(l2<r || l3<r){
                        return true;
                    }
                    else{
                        ;
                    }
                }
                else{//
                    return true;
                }
            }
            else{
                ;//垂点大于r
            }
        }//for
        //所有路径不被探测，返回false
        return false;
    }
}
