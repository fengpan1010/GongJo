package com.car;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.frame.Dao;
import com.mapper.carMapper;
import com.vo.Car;

@Component("CarDao")
public class CarDao implements Dao<String, Car> {
	
	@Resource(name = "carMapper")
	carMapper carMapper;
	
	@Override
	public void insert(Car v) {
		carMapper.insert(v);
	}

	@Override
	public void update(Car v) {
		carMapper.update(v);
	}

	@Override
	public void delete(String k) {
		carMapper.delete(k);
	}

	@Override
	public Car select(String k) {
		Car car = carMapper.select(k);
		
		return car;
	}

	@Override
	public ArrayList<Car> selects(String k) {
		ArrayList<Car> cars = carMapper.selects(k);
		return cars;
	}

	@Override
	public ArrayList<Car> selectAll() {
		ArrayList<Car> cars = carMapper.selectAll();
		
		return cars;
	}

}
