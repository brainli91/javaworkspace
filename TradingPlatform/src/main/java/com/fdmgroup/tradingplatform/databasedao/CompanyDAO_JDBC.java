package com.fdmgroup.tradingplatform.databasedao;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.fdmgroup.tradingplatform.dao.ICompanyDAO;
import com.fdmgroup.tradingplatform.model.Company;
import com.fdmgroup.tradingplatform.model.Role;


public class CompanyDAO_JDBC implements ICompanyDAO {

	private static CompanyDAO_JDBC companyDAO;

	private CompanyDAO_JDBC() {
		super();
	}

	public static CompanyDAO_JDBC getInstance() {
		if (companyDAO == null)
			companyDAO = new CompanyDAO_JDBC();

		return companyDAO;
	}

	public List<Company> readAll() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;	

			try {
				String query = "SELECT * FROM tp_company";
				con = DataSource.getInstance().getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				
				List<Company> companies = new ArrayList<Company>();
				
				while (rs != null && rs.next()){
					Company company = new Company();
					
					company.setId(rs.getInt("company_id"));
					company.setName(rs.getString("company_name"));
					company.setStockId(rs.getInt("stock_id"));
					company.setStartingPrice(rs.getDouble("starting_price"));
					
					companies.add(company);
				}
				return companies;
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (PropertyVetoException e) {
				e.printStackTrace();
			}finally{
				closeAll(con, ps, rs);
			}
		
			
		
		return null;
	}

	public Company create(Company newCompany) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "INSERT INTO TP_COMPANY(company_id,company_name,stock_id, starting_price) Values(TP_COMPANY_ID_SEQ.NEXTVAL,?,TP_COMPANY_ID_SEQ.CURRVAL,?)";
		String query2 = "INSERT INTO TP_USER_ROLE (user_id, role_id) Values (TP_USER_ID_SEQ.CURRVAL,?)";

		try {
			con = DataSource.getInstance().getConnection();
			ps = con.prepareStatement(query);

			ps.setString(1, newCompany.getName());
			ps.setDouble(2, newCompany.getStartingPrice());
			ps.executeUpdate();

			ps = con.prepareStatement(query2);

			ps.setInt(1, 3);

			ps.executeUpdate();
			return findByName(newCompany.getName());
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		} finally {
			closeAll(con, ps, rs);
		}
		return null;

	}

	public Company read(int companyId) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			String query = "SELECT * FROM tp_company WHERE company_id = ?";
			con = DataSource.getInstance().getConnection();
			ps = con.prepareStatement(query);
			ps.setInt(1, companyId);

			rs = ps.executeQuery();

			Company company = new Company();
			if (rs != null && rs.next()) {
				company.setId(rs.getInt("company_id"));
				company.setName(rs.getString("company_name"));
				company.setStockId(rs.getInt("stock_id"));
				company.setStartingPrice(rs.getDouble("starting_price"));
				return company;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		} finally {
			closeAll(con, ps, rs);
		}

		return null;
	}

	public Company update(Company company) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			String query = "UPDATE tp_company SET company_name = ?, starting_price =? WHERE company_id =?";
			con = DataSource.getInstance().getConnection();
			ps = con.prepareStatement(query);
			
			ps.setString(1, company.getName());
			ps.setDouble(2, company.getStartingPrice());
			ps.setInt(3, company.getId());
			
			ps.executeUpdate();
			
			return company;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}finally {
			closeAll(con, ps, null);
		}
		return null;
	}

	public boolean delete(Company company) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			String query = "UPDATE tp_company SET company_name = ? WHERE company_name = ?";
			con = DataSource.getInstance().getConnection();
			ps =  con.prepareStatement(query);
			String deleteComapny ="~" + company.getName();
			ps.setString(1, deleteComapny);
			ps.setString(2, company.getName());
			if(ps.executeUpdate() == 1)
				return true;
			return false;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}finally{
			closeAll(con, ps, null);
		}
		return false;
	}

	public Company findByStockId(int stockId) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			String query = "SELECT * FROM tp_company WHERE stock_id = ?";
			con = DataSource.getInstance().getConnection();
			ps = con.prepareStatement(query);
			ps.setInt(1, stockId);

			rs = ps.executeQuery();

			Company company = new Company();
			if (rs != null && rs.next()) {
				company.setId(rs.getInt("company_id"));
				company.setName(rs.getString("company_name"));
				company.setStockId(rs.getInt("stock_id"));
				company.setStartingPrice(rs.getDouble("starting_price"));
				return company;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		} finally {
			closeAll(con, ps, rs);
		}

		return null;
	}

	public Company findByName(String companyName) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String query = "SELECT * FROM tp_company WHERE company_name = ?";
			

			con = DataSource.getInstance().getConnection();
			Company company = new Company();

			ps = con.prepareStatement(query);
			ps.setString(1, companyName);

			rs = ps.executeQuery();

			if (rs != null && rs.next()) {
				company.setId(rs.getInt("company_id"));
				company.setName(rs.getString("company_name"));
				company.setStockId(rs.getInt("stock_id"));
				company.setStartingPrice(rs.getDouble("starting_price"));
				return company;

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		} finally {
			closeAll(con, ps, rs);
		}
		return null;
	}

	private static void closeAll(Connection cn, Statement st, ResultSet rs) {

		try {
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
			if (cn != null)
				cn.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
}
