package com.zb.service.impl;

import com.zb.mapper.Parking_recordMapper;
import com.zb.pojo.Parking_record;
import com.zb.service.Parking_recordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Parking_recordServiceImpl implements Parking_recordService {
    @Resource
    Parking_recordMapper mapper;
    @Override
    public List<Parking_record> getAll(Integer region_id) {

        return mapper.getAll(region_id);
    }

    @Override
    public int add(Parking_record p) {

        return mapper.add(p);
    }

    @Override
    public int update(Parking_record p) {

        return mapper.update(p);
    }
}
