package com.zb.controller;

import com.alibaba.fastjson.JSON;
import com.zb.pojo.Parking_record;
import com.zb.pojo.Region;
import com.zb.service.impl.Parking_recordServiceImpl;
import com.zb.service.impl.RegionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class ControllerRecord {
    @Autowired
    Parking_recordServiceImpl recordService;
    @Autowired
    RegionServiceImpl regionService;
    //异步获取下拉列表
    @RequestMapping(value = "/xiala")
    @ResponseBody
    public List<Region> xiala(){
        List<Region> list = regionService.getAll();
        return list;
    }
    @RequestMapping("/show")
    //查询全部车辆信息的方法
    public String getAll(Integer region_id, Model model){
        List<Parking_record> list = recordService.getAll(region_id);
        model.addAttribute("list",list);
        return "index";
    }
    @RequestMapping("/add")
    public String add(Parking_record parking_record){
        int count = recordService.add(parking_record);
        if(count>0){
            //新增成功!
            return "redirect:/show";
        }else{
            return "add";
        }
    }
    //修改停车状态
    @RequestMapping("/update")
    @ResponseBody
    public String update(Parking_record parking_record){
        int count = recordService.update(parking_record);
        if(count>0){
            return "ok";
        }else{
            return "no";
        }
    }
}
