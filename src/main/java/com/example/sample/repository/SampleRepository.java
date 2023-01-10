package com.example.sample.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SampleRepository {

    @Select("select content from log order by id desc")
    List<String> select();

    @Insert("insert into log (content) values (now())")
    void insert();
}
