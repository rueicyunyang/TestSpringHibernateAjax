package com.test.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.test.bean.Continent;
import com.test.bean.Country;

public class DropDownDao extends HibernateDaoSupport {

	public List queryContinent(){
		
		List<Continent> list = (List<Continent>) getHibernateTemplate().find("from Continent");
		
		return list;
	}

	public List queryCountry(String continentId){
		
		List<Country> list = (List<Country>) getHibernateTemplate().find("from Country where continentId ="+continentId+"");
		
		return list;
	}
}
