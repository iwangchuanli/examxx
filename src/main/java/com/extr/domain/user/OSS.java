package com.extr.domain.user;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.Date;

public class OSS {
    public static final String RESOURCE_PATH="D:/";
    public static final String URL_PATH="www.haha174.top:8086/dbz/";
    //  oos   相关   数据
    public static final String endpoint="http://oss-cn-beijing.aliyuncs.com";
    public static final  String accessKeyId = "LTAIWOJiEXDii";
    public static final  String accessKeySecret = "0GQxrDVLr1ohyCMOuZpUvg";
    public static final String bucketName="haha174";
    public static final String accessUrl="http://haha174.oss-cn-beijing.aliyuncs.com";
    //  oos   相关   结束
    // 下载文件零时存放  和  pdf  临时存放路径
    public static final String PDF_PATH="D://";


}
