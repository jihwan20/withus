package com.bjh.withus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bjh.withus.vo.Todo;

@Mapper
public interface TodoMapper {
	List<Todo> selectTodoListByMonth(Todo todo);
}
