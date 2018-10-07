package com.test.service;

import java.util.List;

import com.test.bean.Continent;
import com.test.dao.DropDownDao;

public class DropDownService {

	DropDownDao dropDownDao;
	
	public List queryContinent(){
		
		List<Continent> list = dropDownDao.queryContinent();
		return list;
	}

	public List queryCountry(String continentId){
		
		List<Continent> list = dropDownDao.queryCountry(continentId);
		return list;
	}

	public DropDownDao getDropDownDao() {
		return dropDownDao;
	}

	public void setDropDownDao(DropDownDao dropDownDao) {
		this.dropDownDao = dropDownDao;
	}
}
