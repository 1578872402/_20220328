package com.zb.mapper;

import com.zb.pojo.Parking_record;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface Parking_recordMapper {
    //查询全部车辆信息
    public List<Parking_record> getAll(@Param("region_id") Integer region_id);
    //新增车辆信息
    public int add(Parking_record p);
    //将汽车状态改为已驶离
    public int update(Parking_record p);
}
