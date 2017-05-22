package com.fdmgroup.tradingplatform.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.fdmgroup.tradingplatform.model.Company;

public class CollectionCompanyDAOTest {

	CollectionCompanyDAO companyDAO;
	List<Company> companies;
	Company company1, company2;
	
	@Before
	public void init() {
		companyDAO = new CollectionCompanyDAO();
		companies = companyDAO.readAll();
		/*
		 * companyDAO.create(new Company( 743, "STAPLES", 200.22));
		 * companyDAO.create(new Company( 779, "TOYS R US", 500.55));
		 */
		// company1 = new Company( 743, "STAPLES", 200.22);
		// companies.add(company1);
		// company2 = new Company( 779, "TOYS R US", 500.55);
		// companies.add(company2);

	}

	@Test
	public void testCreate() {
		Company company1 = new Company("TOYS R US", 500.55);
		Company returnedComp = companyDAO.create(company1);
		Company company2 = new Company( "STAPLES", 200.22);
		Company returnedComp2 = companyDAO.create(company2);
		assertEquals(2, (int) returnedComp.getId());
		assertEquals(3, (int) returnedComp2.getId());
		
	}

	@Test
	public void testRead() {
		Company company1 = new Company("TOYS R US", 500.55);
		companyDAO.create(company1);
		Company company2 = new Company( "STAPLES", 200.22);
		companyDAO.create(company2);
		
		assertEquals(company1, companyDAO.read(2));
		assertEquals(company2, companyDAO.read(3));
	
	}


	@Test
	public void testUpdate() {
		Company company1 = new Company("TOYS R US", 500.55);
		companyDAO.create(company1);
		Company company2 = new Company( "STAPLES", 200.22);
		companyDAO.create(company2);
		
		assertEquals(company1, companyDAO.update(company1));
		assertEquals(company2, companyDAO.update(company2));
	}

	@Test
	public void testDelete() {
		company1 = new Company("TOYS R US", 500.55);
		companyDAO.create(company1);

		// assertEquals(true, companyDAO.delete(companya));
		assertEquals(true, companyDAO.delete(company1));
	}

	@Test
	public void testFindByStockId() {
		Company company1 = new Company("TOYS R US", 500.55);
		companyDAO.create(company1);
		Company company2 = new Company( "STAPLES", 200.22);
		companyDAO.create(company2);
		
		assertEquals(company2, companyDAO.findByStockId(3));
	}

	@Test
	public void testFindByName() {
		Company company1 = new Company( "TOYS R US", 500.55);
		companyDAO.create(company1);
		Company company2 = new Company( "STAPLES", 200.22);
		companyDAO.create(company2);
		
		assertEquals(company2, companyDAO.findByName("STAPLES"));
		// assertEquals(company2, companyDAO.findByName("STAPLES"));
	}

}
