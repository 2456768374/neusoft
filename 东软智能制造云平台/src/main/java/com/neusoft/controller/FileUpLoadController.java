package com.neusoft.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@Controller
public class FileUpLoadController {
    private Date date=new Date();
    private SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMdd");

    @RequestMapping(value = "/upload")
    public @ResponseBody String upLoadFile(@RequestParam(value ="uploadFile") MultipartFile multipartFile, HttpServletRequest request) throws IOException {
        String oldFileName=multipartFile.getOriginalFilename();
        HashMap<String,String> resultMap=new HashMap<>();
        //判断上传的文件是否存在
        if(multipartFile==null || null==oldFileName && oldFileName.length()<=0){
            resultMap.put("result","false");
            resultMap.put("errMsg","上传文件不存在");
            return  JSONObject.toJSONString(resultMap);
        }

        String suffix=getSuffix(oldFileName);
        if(!issLegalSuffix(suffix)){
            resultMap.put("result","false");
            resultMap.put("errMsg","上传文件不合法!");
            return  JSONObject.toJSONString(resultMap);
        }

        //物理存储路径
        String rootPath= request.getServletContext().getRealPath("/");
        //组合子目录
        String savePath=rootPath+"upload\\"+simpleDateFormat.format(date)+"\\";
        //文件访问的相对路径
        String url="upload/"+simpleDateFormat.format(date)+"/";

        //判断目录是否已创建
        File mk=new File(savePath);
        if(!mk.exists())
        {
            //创建目录,如果父级目录不存在,则一起创建
            mk.mkdirs();
        }

        //获取新的文件名
        String newFileName=creatNewFileName(suffix);

        //实例化文件对象
        File newFile=new File(savePath+newFileName);
        //将文件写入磁盘
        multipartFile.transferTo(newFile);

        resultMap.put("result","true");
        resultMap.put("url",url+newFileName);
        return  JSONObject.toJSONString(resultMap);


    }


    /**
     * 一般使用时间戳做文件名
     * 组合文件名
     * @return
     */
    public String creatNewFileName(String suffix){
        return System.currentTimeMillis()+"."+suffix;
    }


    /**
     * 截取文件后缀
     * @param fileName
     * @return
     */
    public String getSuffix(String fileName){
        String suffix=fileName.substring( fileName.lastIndexOf(".")+1);
        return  suffix;
    }

    /**
     * 判断文件后缀是否合法
     * @param suffix 文件后缀
     * @return
     */
    public  boolean issLegalSuffix(String suffix){
        String[] legalSuffixs={"jpg","png","gif","bmp"};
        for (String suf:legalSuffixs) {
            if(suf.equalsIgnoreCase(suffix)){
                return true;
            }
        }
        return false;
    }

}
